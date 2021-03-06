# RUN: llvm-mc %s -arch=mips -mcpu=mips32r2 -mattr=+msa -show-encoding | FileCheck %s
#
# RUN: llvm-mc %s -arch=mips -mcpu=mips32r2 -mattr=+msa -filetype=obj -o - | \
# RUN: llvm-objdump -d -arch=mips -mattr=+msa - | \
# RUN: FileCheck %s -check-prefix=CHECKOBJDUMP
#
# CHECK:        copy_s.b        $13, $w8[2]             # encoding: [0x78,0x82,0x43,0x59]
# CHECK:        copy_s.h        $1, $w25[0]             # encoding: [0x78,0xa0,0xc8,0x59]
# CHECK:        copy_s.w        $22, $w5[1]             # encoding: [0x78,0xb1,0x2d,0x99]
# CHECK:        copy_u.b        $22, $w20[4]            # encoding: [0x78,0xc4,0xa5,0x99]
# CHECK:        copy_u.h        $20, $w4[0]             # encoding: [0x78,0xe0,0x25,0x19]
# CHECK:        copy_u.w        $fp, $w13[2]            # encoding: [0x78,0xf2,0x6f,0x99]
# CHECK:        sldi.b          $w0, $w29[4]            # encoding: [0x78,0x04,0xe8,0x19]
# CHECK:        sldi.h          $w8, $w17[0]            # encoding: [0x78,0x20,0x8a,0x19]
# CHECK:        sldi.w          $w20, $w27[2]           # encoding: [0x78,0x32,0xdd,0x19]
# CHECK:        sldi.d          $w4, $w12[0]            # encoding: [0x78,0x38,0x61,0x19]
# CHECK:        splati.b        $w25, $w3[2]            # encoding: [0x78,0x42,0x1e,0x59]
# CHECK:        splati.h        $w24, $w28[1]           # encoding: [0x78,0x61,0xe6,0x19]
# CHECK:        splati.w        $w13, $w18[0]           # encoding: [0x78,0x70,0x93,0x59]
# CHECK:        splati.d        $w28, $w1[0]            # encoding: [0x78,0x78,0x0f,0x19]
# CHECK:        move.v          $w23, $w24              # encoding: [0x78,0xbe,0xc5,0xd9]

# CHECKOBJDUMP:        copy_s.b        $13, $w8[2]
# CHECKOBJDUMP:        copy_s.h        $1, $w25[0]
# CHECKOBJDUMP:        copy_s.w        $22, $w5[1]
# CHECKOBJDUMP:        copy_u.b        $22, $w20[4]
# CHECKOBJDUMP:        copy_u.h        $20, $w4[0]
# CHECKOBJDUMP:        copy_u.w        $fp, $w13[2]
# CHECKOBJDUMP:        sldi.b          $w0, $w29[4]
# CHECKOBJDUMP:        sldi.h          $w8, $w17[0]
# CHECKOBJDUMP:        sldi.w          $w20, $w27[2]
# CHECKOBJDUMP:        sldi.d          $w4, $w12[0]
# CHECKOBJDUMP:        splati.b        $w25, $w3[2]
# CHECKOBJDUMP:        splati.h        $w24, $w28[1]
# CHECKOBJDUMP:        splati.w        $w13, $w18[0]
# CHECKOBJDUMP:        splati.d        $w28, $w1[0]
# CHECKOBJDUMP:        move.v          $w23, $w24

                copy_s.b        $13, $w8[2]
                copy_s.h        $1, $w25[0]
                copy_s.w        $22, $w5[1]
                copy_u.b        $22, $w20[4]
                copy_u.h        $20, $w4[0]
                copy_u.w        $30, $w13[2]
                sldi.b          $w0, $w29[4]
                sldi.h          $w8, $w17[0]
                sldi.w          $w20, $w27[2]
                sldi.d          $w4, $w12[0]
                splati.b        $w25, $w3[2]
                splati.h        $w24, $w28[1]
                splati.w        $w13, $w18[0]
                splati.d        $w28, $w1[0]
                move.v          $w23, $w24
