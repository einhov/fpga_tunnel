;buildInfoPackage: chisel3, version: 3.0.0-RC1, scalaVersion: 2.12.3, sbtVersion: 0.13.16, builtAtString: 2017-10-30 21:53:14.573, builtAtMillis: 1509400394573
circuit Not : 
  module Not : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<1>, out : UInt<1>}
    
    node _T_4 = not(io.in) @[not.scala 11:13]
    io.out <= _T_4 @[not.scala 11:10]
    
