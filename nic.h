/*
 *  SPI NET ENC28J60 device driver for K1208/Amiga 1200
 *
 *  original code by Mike Stirling (2018)
 *
 *  adapted for use with A500 Simple SPI hardware by Dennis van Weeren (2022)
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

#ifndef NIC_H_
#define NIC_H_

#include <stdint.h>
#include "spi.h"

#define NIC_MACADDR_SIZE		6
#define NIC_MTU					1518
#define NIC_BPS					10000000ul

#pragma pack(push,1)
typedef struct {
	uint8_t		dest[NIC_MACADDR_SIZE];
	uint8_t		src[NIC_MACADDR_SIZE];
	uint16_t	type;
} nic_eth_hdr_t;
#pragma pack(pop)

int nic_init(spi_t *spi);
int nic_recv(spi_t *spi, uint8_t *buf, unsigned int length);
int nic_send(spi_t *spi, const uint8_t *buf, unsigned int length);

void nic_get_mac_address(uint8_t *buf);
int nic_keep_alive (spi_t *spi);


#endif /* NIC_H_ */
