;  SPI NET ENC28J60 device driver for A500-SD-Plus controller
;
;  Copyright (C) 2018 Mike Stirling
;  modified for A500-SD-Plus by Dennis van Weeren
;
;  This program is free software: you can redistribute it and/or modify
;  it under the terms of the GNU General Public License as published by
;  the Free Software Foundation, either version 3 of the License, or
;  (at your option) any later version.
;
;  This program is distributed in the hope that it will be useful,
;  but WITHOUT ANY WARRANTY; without even the implied warranty of
;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;  GNU General Public License for more details.
;
;  You should have received a copy of the GNU General Public License
;  along with this program.  If not, see <https://www.gnu.org/licenses/>.

	XDEF	        _interrupt_handler
	XDEF            _interrupt_enable
	XDEF            _interrupt_disable

IRQ_CTRL_ADDRESS    equ         $00BFED01


;**************************************************************************************************/
;  Register usage for interrupt servers:
;
;  D0 == scratch
;  D1 == scratch
;  A0 == scratch
;  A1 == is_Data which is RBFDATA structure (scratch)
;  A5 == vector to our code (scratch)
;  A6 == scratch
;
;  Data is expected to contain the following data items in this order:
;
;  0 - pointer to task structure for signal (4)
;  4 - signal mask to send (4)


_interrupt_handler:
                    move.l		4,a6				        ; SysBase
                    move.l		4(a1),d0			        ; Signal number from data struct
                    move.l		0(a1),a1			        ; Task handle
                    move.b      #$20,(IRQ_CTRL_ADDRESS).l	; Mask Ethernet interrupt
                    jsr			-$144(a6)			        ; Exec "Signal"
                    moveq		#0,d0				        ; Set Z flag to indicate IRQ should be propagated further
                    rts

;**************************************************************************************************/

					; enable NIC interrupt

_interrupt_enable:  move.b      #$A0,(IRQ_CTRL_ADDRESS).l
                    rts
