package pynq

import chisel3._
import chisel3.util._

class VideoGenerator() extends Module {
	val io = IO(new Bundle {
		val colour = Output(UInt(24.W))
		val hsync = Output(Bool())
		val vsync = Output(Bool())
		val vde = Output(Bool())

        val distance_addr = Output(UInt(18.W))
        val distance_data = Input(UInt(8.W))
        val angle_addr = Output(UInt(18.W))
        val angle_data = Input(UInt(8.W))
        val texture_addr = Output(UInt(16.W))
        val texture_data = Input(UInt(6.W))

        val switch = Input(UInt(2.W))
        val button = Input(Bool())
	})

    val x = new Counter(1650)
    val y = new Counter(750)
    val frame = new Counter(0xffff)

    when(x.inc()) {
      when(y.inc()) {
        frame.inc()
      }
    }

    io.hsync := ~((x.value >= 1390.U) && (x.value < 1430.U))
    io.vsync := ~((y.value >= 725.U) && (y.value < 730.U))
    io.vde := (x.value < 1280.U) && (y.value < 720.U)

    val scaled_addr = (x.value >> 1.U) + (y.value >> 1.U) * 640.U
    io.distance_addr := scaled_addr
    io.angle_addr := scaled_addr

    val mapped_x = (io.distance_data + frame.value) % 256.U
    val mapped_y = (io.angle_data + (frame.value >> 1.U)) % 256.U
    io.texture_addr := Mux(
      io.switch === 1.U,
      (x.value % 256.U) + (y.value % 256.U) * 256.U,
      mapped_y * 256.U + mapped_x
    )

    val sample = Cat(io.texture_data, 0.U(2.W))
    val xor_intensity = ((x.value + frame.value) % 256.U) ^ ((y.value + 2.U * frame.value) % 256.U)

    val intensity = MuxLookup(
      io.switch, 0.U,
      Array(
        0.U -> xor_intensity,
        1.U -> Mux(x.value < 256.U && y.value < 256.U, sample, io.angle_data),
        2.U -> io.distance_data,
        3.U -> Mux(io.button, mapped_x ^ mapped_y, sample)
      )
    )
    io.colour := (intensity << 16) | (intensity << 8) | intensity
}
