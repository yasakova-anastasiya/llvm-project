//===-- AMDGPUSearchableTables.td - ------------------------*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// Resource intrinsics table.
//===----------------------------------------------------------------------===//

class RsrcIntrinsic<AMDGPURsrcIntrinsic intr> {
  Intrinsic Intr = !cast<Intrinsic>(intr);
  bits<8> RsrcArg = intr.RsrcArg;
  bit IsImage = intr.IsImage;
}

def RsrcIntrinsics : GenericTable {
  let FilterClass = "RsrcIntrinsic";
  let Fields = ["Intr", "RsrcArg", "IsImage"];

  let PrimaryKey = ["Intr"];
  let PrimaryKeyName = "lookupRsrcIntrinsic";
}

foreach intr = !listconcat(AMDGPUBufferIntrinsics,
                           AMDGPUImageDimIntrinsics,
                           AMDGPUImageDimAtomicIntrinsics) in {
  def : RsrcIntrinsic<!cast<AMDGPURsrcIntrinsic>(intr)>;
}

class SourceOfDivergence<Intrinsic intr> {
  Intrinsic Intr = intr;
}

def SourcesOfDivergence : GenericTable {
  let FilterClass = "SourceOfDivergence";
  let Fields = ["Intr"];

  let PrimaryKey = ["Intr"];
  let PrimaryKeyName = "lookupSourceOfDivergence";
}

def : SourceOfDivergence<int_amdgcn_workitem_id_x>;
def : SourceOfDivergence<int_amdgcn_workitem_id_y>;
def : SourceOfDivergence<int_amdgcn_workitem_id_z>;
def : SourceOfDivergence<int_amdgcn_interp_mov>;
def : SourceOfDivergence<int_amdgcn_interp_p1>;
def : SourceOfDivergence<int_amdgcn_interp_p2>;
def : SourceOfDivergence<int_amdgcn_interp_p1_f16>;
def : SourceOfDivergence<int_amdgcn_interp_p2_f16>;
def : SourceOfDivergence<int_amdgcn_mbcnt_hi>;
def : SourceOfDivergence<int_amdgcn_mbcnt_lo>;
def : SourceOfDivergence<int_r600_read_tidig_x>;
def : SourceOfDivergence<int_r600_read_tidig_y>;
def : SourceOfDivergence<int_r600_read_tidig_z>;
def : SourceOfDivergence<int_amdgcn_atomic_inc>;
def : SourceOfDivergence<int_amdgcn_atomic_dec>;
def : SourceOfDivergence<int_amdgcn_ds_fadd>;
def : SourceOfDivergence<int_amdgcn_ds_fmin>;
def : SourceOfDivergence<int_amdgcn_ds_fmax>;
def : SourceOfDivergence<int_amdgcn_buffer_atomic_swap>;
def : SourceOfDivergence<int_amdgcn_buffer_atomic_add>;
def : SourceOfDivergence<int_amdgcn_buffer_atomic_sub>;
def : SourceOfDivergence<int_amdgcn_buffer_atomic_smin>;
def : SourceOfDivergence<int_amdgcn_buffer_atomic_umin>;
def : SourceOfDivergence<int_amdgcn_buffer_atomic_smax>;
def : SourceOfDivergence<int_amdgcn_buffer_atomic_umax>;
def : SourceOfDivergence<int_amdgcn_buffer_atomic_and>;
def : SourceOfDivergence<int_amdgcn_buffer_atomic_or>;
def : SourceOfDivergence<int_amdgcn_buffer_atomic_xor>;
def : SourceOfDivergence<int_amdgcn_buffer_atomic_cmpswap>;
def : SourceOfDivergence<int_amdgcn_raw_buffer_atomic_swap>;
def : SourceOfDivergence<int_amdgcn_raw_buffer_atomic_add>;
def : SourceOfDivergence<int_amdgcn_raw_buffer_atomic_sub>;
def : SourceOfDivergence<int_amdgcn_raw_buffer_atomic_smin>;
def : SourceOfDivergence<int_amdgcn_raw_buffer_atomic_umin>;
def : SourceOfDivergence<int_amdgcn_raw_buffer_atomic_smax>;
def : SourceOfDivergence<int_amdgcn_raw_buffer_atomic_umax>;
def : SourceOfDivergence<int_amdgcn_raw_buffer_atomic_and>;
def : SourceOfDivergence<int_amdgcn_raw_buffer_atomic_or>;
def : SourceOfDivergence<int_amdgcn_raw_buffer_atomic_xor>;
def : SourceOfDivergence<int_amdgcn_raw_buffer_atomic_cmpswap>;
def : SourceOfDivergence<int_amdgcn_struct_buffer_atomic_swap>;
def : SourceOfDivergence<int_amdgcn_struct_buffer_atomic_add>;
def : SourceOfDivergence<int_amdgcn_struct_buffer_atomic_sub>;
def : SourceOfDivergence<int_amdgcn_struct_buffer_atomic_smin>;
def : SourceOfDivergence<int_amdgcn_struct_buffer_atomic_umin>;
def : SourceOfDivergence<int_amdgcn_struct_buffer_atomic_smax>;
def : SourceOfDivergence<int_amdgcn_struct_buffer_atomic_umax>;
def : SourceOfDivergence<int_amdgcn_struct_buffer_atomic_and>;
def : SourceOfDivergence<int_amdgcn_struct_buffer_atomic_or>;
def : SourceOfDivergence<int_amdgcn_struct_buffer_atomic_xor>;
def : SourceOfDivergence<int_amdgcn_struct_buffer_atomic_cmpswap>;
def : SourceOfDivergence<int_amdgcn_ps_live>;
def : SourceOfDivergence<int_amdgcn_ds_swizzle>;
def : SourceOfDivergence<int_amdgcn_ds_ordered_add>;
def : SourceOfDivergence<int_amdgcn_ds_ordered_swap>;
def : SourceOfDivergence<int_amdgcn_permlane16>;
def : SourceOfDivergence<int_amdgcn_permlanex16>;
def : SourceOfDivergence<int_amdgcn_mov_dpp>;
def : SourceOfDivergence<int_amdgcn_mov_dpp8>;
def : SourceOfDivergence<int_amdgcn_update_dpp>;

def : SourceOfDivergence<int_amdgcn_mfma_f32_4x4x1f32>;
def : SourceOfDivergence<int_amdgcn_mfma_f32_4x4x1f32>;
def : SourceOfDivergence<int_amdgcn_mfma_f32_4x4x4f16>;
def : SourceOfDivergence<int_amdgcn_mfma_i32_4x4x4i8>;
def : SourceOfDivergence<int_amdgcn_mfma_f32_4x4x2bf16>;
def : SourceOfDivergence<int_amdgcn_mfma_f32_16x16x1f32>;
def : SourceOfDivergence<int_amdgcn_mfma_f32_16x16x4f32>;
def : SourceOfDivergence<int_amdgcn_mfma_f32_16x16x4f16>;
def : SourceOfDivergence<int_amdgcn_mfma_f32_16x16x16f16>;
def : SourceOfDivergence<int_amdgcn_mfma_i32_16x16x4i8>;
def : SourceOfDivergence<int_amdgcn_mfma_i32_16x16x16i8>;
def : SourceOfDivergence<int_amdgcn_mfma_f32_16x16x2bf16>;
def : SourceOfDivergence<int_amdgcn_mfma_f32_16x16x8bf16>;
def : SourceOfDivergence<int_amdgcn_mfma_f32_32x32x1f32>;
def : SourceOfDivergence<int_amdgcn_mfma_f32_32x32x2f32>;
def : SourceOfDivergence<int_amdgcn_mfma_f32_32x32x4f16>;
def : SourceOfDivergence<int_amdgcn_mfma_f32_32x32x8f16>;
def : SourceOfDivergence<int_amdgcn_mfma_i32_32x32x4i8>;
def : SourceOfDivergence<int_amdgcn_mfma_i32_32x32x8i8>;
def : SourceOfDivergence<int_amdgcn_mfma_f32_32x32x2bf16>;
def : SourceOfDivergence<int_amdgcn_mfma_f32_32x32x4bf16>;

foreach intr = AMDGPUImageDimAtomicIntrinsics in
def : SourceOfDivergence<intr>;
