#include <cstdio>
#include <cmath>
#include <cstdint>

int main() {
	FILE *hex = std::fopen("doge2.bin", "r");
	FILE *raw = std::fopen("doge2-ds.bin", "w");
	uint8_t value;
	for(int i = 0; i < 256 * 256; ++i) {
		fscanf(hex, "%hhx\n", &value);
		fprintf(raw, "%02x\n", value >> 2);
	}
	std::fclose(hex);
	std::fclose(raw);
}
