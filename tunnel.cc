#include <cstdio>
#include <cmath>
#include <cstdint>

int main() {
	static const int tw = 256;
	static const int th = 256;
	static const int w = 640;
	static const int h = 360;

	uint8_t distances[w * h];
	uint8_t angles[w * h];

	uint8_t texture[tw * th];
	uint8_t buffer[w * h];

	for(int y = 0; y < th; ++y)
		for(int x = 0; x < tw; ++x)
			texture[tw * y + x] = x ^ y;

	for(int y = 0; y < h; ++y) {
		for(int x = 0; x < w; ++x) {
			static const auto ratio = 18.0;

			const int offset = w * y + x;
			distances[offset] = static_cast<int>(
				ratio * th / std::sqrt(std::pow((x - w / 2.0), 2) + std::pow((y - h / 2.0), 2))
			) % th;
			angles[offset] = static_cast<int>(0.5 * tw * std::atan2(y - h / 2.0, x - w / 2.0) / M_PI) % tw;
		}
	}

	for(int y = 0; y < h; ++y) {
		for(int x = 0; x < w; ++x) {
			const int offset = w * y + x;
			buffer[offset] = texture[(distances[offset] % tw) * tw + (angles[offset] % th)];
		}
	}

	FILE * const tunnel = std::fopen("tunnel.bin", "w");
	std::fwrite(buffer, w * h, 1, tunnel);
	std::fclose(tunnel);

	FILE * const dist = std::fopen("distances.bin", "w");
	for(int i = 0; i < w * h; ++i)
		std::fprintf(dist, "%02x\n", distances[i]);
	std::fclose(dist);

	FILE * const ang = std::fopen("angles.bin", "w");
	for(int i = 0; i < w * h; ++i)
		std::fprintf(ang, "%02x\n", angles[i]);
	std::fclose(ang);

}
