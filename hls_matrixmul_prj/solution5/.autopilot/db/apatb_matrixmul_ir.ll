; ModuleID = 'C:/Users/ShaneWu/OneDrive/Desktop/Documents/NTU/HLS/labA/hls_matrixmul_prj/solution5/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: inaccessiblememonly nounwind
declare void @llvm.sideeffect() #0

; Function Attrs: inaccessiblemem_or_argmemonly noinline
define void @apatb_matrixmul_ir([3 x i8]* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="3" %a, [3 x i8]* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="3" %b, [3 x i16]* noalias nocapture nonnull "fpga.decayed.dim.hint"="3" %res) local_unnamed_addr #1 {
entry:
  %a_copy_0 = alloca [3 x i8], align 512
  %a_copy_1 = alloca [3 x i8], align 512
  %a_copy_2 = alloca [3 x i8], align 512
  %b_copy_0 = alloca [3 x i8], align 512
  %b_copy_1 = alloca [3 x i8], align 512
  %b_copy_2 = alloca [3 x i8], align 512
  %res_copy = alloca [3 x [3 x i16]], align 512
  %0 = bitcast [3 x i8]* %a to [3 x [3 x i8]]*
  %1 = bitcast [3 x i8]* %b to [3 x [3 x i8]]*
  %2 = bitcast [3 x i16]* %res to [3 x [3 x i16]]*
  call void @copy_in([3 x [3 x i8]]* nonnull %0, [3 x i8]* nonnull align 512 %a_copy_0, [3 x i8]* nonnull align 512 %a_copy_1, [3 x i8]* nonnull align 512 %a_copy_2, [3 x [3 x i8]]* nonnull %1, [3 x i8]* nonnull align 512 %b_copy_0, [3 x i8]* nonnull align 512 %b_copy_1, [3 x i8]* nonnull align 512 %b_copy_2, [3 x [3 x i16]]* nonnull %2, [3 x [3 x i16]]* nonnull align 512 %res_copy)
  %a_copy.gep_0 = getelementptr [3 x i8], [3 x i8]* %a_copy_0, i64 0, i32 0
  %a_copy.gep_1 = getelementptr [3 x i8], [3 x i8]* %a_copy_1, i64 0, i32 0
  %a_copy.gep_2 = getelementptr [3 x i8], [3 x i8]* %a_copy_2, i64 0, i32 0
  %3 = getelementptr inbounds [3 x [3 x i16]], [3 x [3 x i16]]* %res_copy, i32 0, i32 0
  call void @llvm.sideeffect() #0 [ "xlx_array_partition"(i8* %a_copy.gep_0, i32 0, i32 1, i32 0, i1 false) ], !dbg !5
  call void @llvm.sideeffect() #0 [ "xlx_array_partition"(i8* %a_copy.gep_1, i32 0, i32 1, i32 0, i1 false) ], !dbg !5
  call void @llvm.sideeffect() #0 [ "xlx_array_partition"(i8* %a_copy.gep_2, i32 0, i32 1, i32 0, i1 false) ], !dbg !5
  call void @llvm.sideeffect() #0 [ "xlx_array_partition"([3 x i8]* %b_copy_0, i32 0, i32 1, i32 0, i1 false) ], !dbg !374
  call void @llvm.sideeffect() #0 [ "xlx_array_partition"([3 x i8]* %b_copy_1, i32 0, i32 1, i32 0, i1 false) ], !dbg !374
  call void @llvm.sideeffect() #0 [ "xlx_array_partition"([3 x i8]* %b_copy_2, i32 0, i32 1, i32 0, i1 false) ], !dbg !374
  call void @apatb_matrixmul_hw([3 x i8]* %a_copy_0, [3 x i8]* %a_copy_1, [3 x i8]* %a_copy_2, [3 x i8]* %b_copy_0, [3 x i8]* %b_copy_1, [3 x i8]* %b_copy_2, [3 x i16]* %3)
  call void @copy_back([3 x [3 x i8]]* %0, [3 x i8]* %a_copy_0, [3 x i8]* %a_copy_1, [3 x i8]* %a_copy_2, [3 x [3 x i8]]* %1, [3 x i8]* %b_copy_0, [3 x i8]* %b_copy_1, [3 x i8]* %b_copy_2, [3 x [3 x i16]]* %2, [3 x [3 x i16]]* %res_copy)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0a3a3i16([3 x [3 x i16]]* noalias align 512, [3 x [3 x i16]]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [3 x [3 x i16]]* %0, null
  %3 = icmp eq [3 x [3 x i16]]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop.split, %copy
  %for.loop.idx10 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop.split ]
  br label %for.loop2

for.loop2:                                        ; preds = %for.loop2, %for.loop
  %for.loop.idx39 = phi i64 [ 0, %for.loop ], [ %for.loop.idx3.next, %for.loop2 ]
  %dst.addr57 = getelementptr [3 x [3 x i16]], [3 x [3 x i16]]* %0, i64 0, i64 %for.loop.idx10, i64 %for.loop.idx39
  %src.addr68 = getelementptr [3 x [3 x i16]], [3 x [3 x i16]]* %1, i64 0, i64 %for.loop.idx10, i64 %for.loop.idx39
  %5 = load i16, i16* %src.addr68, align 2
  store i16 %5, i16* %dst.addr57, align 2
  %for.loop.idx3.next = add nuw nsw i64 %for.loop.idx39, 1
  %exitcond = icmp ne i64 %for.loop.idx3.next, 3
  br i1 %exitcond, label %for.loop2, label %for.loop.split

for.loop.split:                                   ; preds = %for.loop2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx10, 1
  %exitcond11 = icmp ne i64 %for.loop.idx.next, 3
  br i1 %exitcond11, label %for.loop, label %ret

ret:                                              ; preds = %for.loop.split, %entry
  ret void
}

; Function Attrs: nounwind
declare void @llvm.assume(i1) #3

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a3a3i8.3.4([3 x i8]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_0, [3 x i8]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_1, [3 x i8]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_2, [3 x [3 x i8]]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1") #2 {
entry:
  %1 = icmp eq [3 x i8]* %_0, null
  %2 = icmp eq [3 x [3 x i8]]* %0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop.split, %copy
  %for.loop.idx10 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop.split ]
  %dst.addr57_0 = getelementptr [3 x i8], [3 x i8]* %_0, i64 0, i64 %for.loop.idx10
  %dst.addr57_1 = getelementptr [3 x i8], [3 x i8]* %_1, i64 0, i64 %for.loop.idx10
  %dst.addr57_2 = getelementptr [3 x i8], [3 x i8]* %_2, i64 0, i64 %for.loop.idx10
  br label %for.loop2

for.loop2:                                        ; preds = %dst.addr57.exit, %for.loop
  %for.loop.idx39 = phi i64 [ 0, %for.loop ], [ %for.loop.idx3.next, %dst.addr57.exit ]
  %src.addr68 = getelementptr [3 x [3 x i8]], [3 x [3 x i8]]* %0, i64 0, i64 %for.loop.idx10, i64 %for.loop.idx39
  %4 = load i8, i8* %src.addr68, align 1
  %5 = trunc i64 %for.loop.idx39 to i2
  switch i2 %5, label %dst.addr57.case.2 [
    i2 0, label %dst.addr57.case.0
    i2 1, label %dst.addr57.case.1
  ]

dst.addr57.case.0:                                ; preds = %for.loop2
  store i8 %4, i8* %dst.addr57_0, align 1
  br label %dst.addr57.exit

dst.addr57.case.1:                                ; preds = %for.loop2
  store i8 %4, i8* %dst.addr57_1, align 1
  br label %dst.addr57.exit

dst.addr57.case.2:                                ; preds = %for.loop2
  %6 = icmp eq i2 %5, -2
  call void @llvm.assume(i1 %6)
  store i8 %4, i8* %dst.addr57_2, align 1
  br label %dst.addr57.exit

dst.addr57.exit:                                  ; preds = %dst.addr57.case.2, %dst.addr57.case.1, %dst.addr57.case.0
  %for.loop.idx3.next = add nuw nsw i64 %for.loop.idx39, 1
  %exitcond = icmp ne i64 %for.loop.idx3.next, 3
  br i1 %exitcond, label %for.loop2, label %for.loop.split

for.loop.split:                                   ; preds = %dst.addr57.exit
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx10, 1
  %exitcond11 = icmp ne i64 %for.loop.idx.next, 3
  br i1 %exitcond11, label %for.loop, label %ret

ret:                                              ; preds = %for.loop.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a3a3i8.5.6([3 x i8]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_0, [3 x i8]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_1, [3 x i8]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_2, [3 x [3 x i8]]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1") #2 {
entry:
  %1 = icmp eq [3 x i8]* %_0, null
  %2 = icmp eq [3 x [3 x i8]]* %0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop.split, %copy
  %for.loop.idx10 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop.split ]
  %4 = trunc i64 %for.loop.idx10 to i2
  %5 = icmp eq i2 %4, -2
  br label %for.loop2

for.loop2:                                        ; preds = %dst.addr57.exit, %for.loop
  %for.loop.idx39 = phi i64 [ 0, %for.loop ], [ %for.loop.idx3.next, %dst.addr57.exit ]
  %dst.addr57_0 = getelementptr [3 x i8], [3 x i8]* %_0, i64 0, i64 %for.loop.idx39
  %dst.addr57_1 = getelementptr [3 x i8], [3 x i8]* %_1, i64 0, i64 %for.loop.idx39
  %dst.addr57_2 = getelementptr [3 x i8], [3 x i8]* %_2, i64 0, i64 %for.loop.idx39
  %src.addr68 = getelementptr [3 x [3 x i8]], [3 x [3 x i8]]* %0, i64 0, i64 %for.loop.idx10, i64 %for.loop.idx39
  %6 = load i8, i8* %src.addr68, align 1
  switch i2 %4, label %dst.addr57.case.2 [
    i2 0, label %dst.addr57.case.0
    i2 1, label %dst.addr57.case.1
  ]

dst.addr57.case.0:                                ; preds = %for.loop2
  store i8 %6, i8* %dst.addr57_0, align 1
  br label %dst.addr57.exit

dst.addr57.case.1:                                ; preds = %for.loop2
  store i8 %6, i8* %dst.addr57_1, align 1
  br label %dst.addr57.exit

dst.addr57.case.2:                                ; preds = %for.loop2
  call void @llvm.assume(i1 %5)
  store i8 %6, i8* %dst.addr57_2, align 1
  br label %dst.addr57.exit

dst.addr57.exit:                                  ; preds = %dst.addr57.case.2, %dst.addr57.case.1, %dst.addr57.case.0
  %for.loop.idx3.next = add nuw nsw i64 %for.loop.idx39, 1
  %exitcond = icmp ne i64 %for.loop.idx3.next, 3
  br i1 %exitcond, label %for.loop2, label %for.loop.split

for.loop.split:                                   ; preds = %dst.addr57.exit
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx10, 1
  %exitcond11 = icmp ne i64 %for.loop.idx.next, 3
  br i1 %exitcond11, label %for.loop, label %ret

ret:                                              ; preds = %for.loop.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @copy_in([3 x [3 x i8]]* noalias readonly "orig.arg.no"="0", [3 x i8]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_0, [3 x i8]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_1, [3 x i8]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_2, [3 x [3 x i8]]* noalias readonly "orig.arg.no"="2", [3 x i8]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_01, [3 x i8]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_12, [3 x i8]* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_23, [3 x [3 x i16]]* noalias readonly "orig.arg.no"="4", [3 x [3 x i16]]* noalias align 512 "orig.arg.no"="5") #4 {
entry:
  call void @onebyonecpy_hls.p0a3a3i8.3.4([3 x i8]* align 512 %_0, [3 x i8]* align 512 %_1, [3 x i8]* align 512 %_2, [3 x [3 x i8]]* %0)
  call void @onebyonecpy_hls.p0a3a3i8.5.6([3 x i8]* align 512 %_01, [3 x i8]* align 512 %_12, [3 x i8]* align 512 %_23, [3 x [3 x i8]]* %1)
  call fastcc void @onebyonecpy_hls.p0a3a3i16([3 x [3 x i16]]* align 512 %3, [3 x [3 x i16]]* %2)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a3a3i8.11.12([3 x [3 x i8]]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0", [3 x i8]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_0, [3 x i8]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_1, [3 x i8]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_2) #2 {
entry:
  %1 = icmp eq [3 x [3 x i8]]* %0, null
  %2 = icmp eq [3 x i8]* %_0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop.split, %copy
  %for.loop.idx10 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop.split ]
  %src.addr68_0 = getelementptr [3 x i8], [3 x i8]* %_0, i64 0, i64 %for.loop.idx10
  %src.addr68_1 = getelementptr [3 x i8], [3 x i8]* %_1, i64 0, i64 %for.loop.idx10
  %src.addr68_2 = getelementptr [3 x i8], [3 x i8]* %_2, i64 0, i64 %for.loop.idx10
  br label %for.loop2

for.loop2:                                        ; preds = %src.addr68.exit, %for.loop
  %for.loop.idx39 = phi i64 [ 0, %for.loop ], [ %for.loop.idx3.next, %src.addr68.exit ]
  %dst.addr57 = getelementptr [3 x [3 x i8]], [3 x [3 x i8]]* %0, i64 0, i64 %for.loop.idx10, i64 %for.loop.idx39
  %4 = trunc i64 %for.loop.idx39 to i2
  switch i2 %4, label %src.addr68.case.2 [
    i2 0, label %src.addr68.case.0
    i2 1, label %src.addr68.case.1
  ]

src.addr68.case.0:                                ; preds = %for.loop2
  %_01 = load i8, i8* %src.addr68_0, align 1
  br label %src.addr68.exit

src.addr68.case.1:                                ; preds = %for.loop2
  %_12 = load i8, i8* %src.addr68_1, align 1
  br label %src.addr68.exit

src.addr68.case.2:                                ; preds = %for.loop2
  %5 = icmp eq i2 %4, -2
  call void @llvm.assume(i1 %5)
  %_23 = load i8, i8* %src.addr68_2, align 1
  br label %src.addr68.exit

src.addr68.exit:                                  ; preds = %src.addr68.case.2, %src.addr68.case.1, %src.addr68.case.0
  %6 = phi i8 [ %_01, %src.addr68.case.0 ], [ %_12, %src.addr68.case.1 ], [ %_23, %src.addr68.case.2 ]
  store i8 %6, i8* %dst.addr57, align 1
  %for.loop.idx3.next = add nuw nsw i64 %for.loop.idx39, 1
  %exitcond = icmp ne i64 %for.loop.idx3.next, 3
  br i1 %exitcond, label %for.loop2, label %for.loop.split

for.loop.split:                                   ; preds = %src.addr68.exit
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx10, 1
  %exitcond11 = icmp ne i64 %for.loop.idx.next, 3
  br i1 %exitcond11, label %for.loop, label %ret

ret:                                              ; preds = %for.loop.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a3a3i8.13.14([3 x [3 x i8]]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0", [3 x i8]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_0, [3 x i8]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_1, [3 x i8]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_2) #2 {
entry:
  %1 = icmp eq [3 x [3 x i8]]* %0, null
  %2 = icmp eq [3 x i8]* %_0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop.split, %copy
  %for.loop.idx10 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop.split ]
  %4 = trunc i64 %for.loop.idx10 to i2
  %5 = icmp eq i2 %4, -2
  br label %for.loop2

for.loop2:                                        ; preds = %src.addr68.exit, %for.loop
  %for.loop.idx39 = phi i64 [ 0, %for.loop ], [ %for.loop.idx3.next, %src.addr68.exit ]
  %dst.addr57 = getelementptr [3 x [3 x i8]], [3 x [3 x i8]]* %0, i64 0, i64 %for.loop.idx10, i64 %for.loop.idx39
  %src.addr68_0 = getelementptr [3 x i8], [3 x i8]* %_0, i64 0, i64 %for.loop.idx39
  %src.addr68_1 = getelementptr [3 x i8], [3 x i8]* %_1, i64 0, i64 %for.loop.idx39
  %src.addr68_2 = getelementptr [3 x i8], [3 x i8]* %_2, i64 0, i64 %for.loop.idx39
  switch i2 %4, label %src.addr68.case.2 [
    i2 0, label %src.addr68.case.0
    i2 1, label %src.addr68.case.1
  ]

src.addr68.case.0:                                ; preds = %for.loop2
  %_01 = load i8, i8* %src.addr68_0, align 1
  br label %src.addr68.exit

src.addr68.case.1:                                ; preds = %for.loop2
  %_12 = load i8, i8* %src.addr68_1, align 1
  br label %src.addr68.exit

src.addr68.case.2:                                ; preds = %for.loop2
  call void @llvm.assume(i1 %5)
  %_23 = load i8, i8* %src.addr68_2, align 1
  br label %src.addr68.exit

src.addr68.exit:                                  ; preds = %src.addr68.case.2, %src.addr68.case.1, %src.addr68.case.0
  %6 = phi i8 [ %_01, %src.addr68.case.0 ], [ %_12, %src.addr68.case.1 ], [ %_23, %src.addr68.case.2 ]
  store i8 %6, i8* %dst.addr57, align 1
  %for.loop.idx3.next = add nuw nsw i64 %for.loop.idx39, 1
  %exitcond = icmp ne i64 %for.loop.idx3.next, 3
  br i1 %exitcond, label %for.loop2, label %for.loop.split

for.loop.split:                                   ; preds = %src.addr68.exit
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx10, 1
  %exitcond11 = icmp ne i64 %for.loop.idx.next, 3
  br i1 %exitcond11, label %for.loop, label %ret

ret:                                              ; preds = %for.loop.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @copy_out([3 x [3 x i8]]* noalias "orig.arg.no"="0", [3 x i8]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_0, [3 x i8]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_1, [3 x i8]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_2, [3 x [3 x i8]]* noalias "orig.arg.no"="2", [3 x i8]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_01, [3 x i8]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_12, [3 x i8]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_23, [3 x [3 x i16]]* noalias "orig.arg.no"="4", [3 x [3 x i16]]* noalias readonly align 512 "orig.arg.no"="5") #5 {
entry:
  call void @onebyonecpy_hls.p0a3a3i8.11.12([3 x [3 x i8]]* %0, [3 x i8]* align 512 %_0, [3 x i8]* align 512 %_1, [3 x i8]* align 512 %_2)
  call void @onebyonecpy_hls.p0a3a3i8.13.14([3 x [3 x i8]]* %1, [3 x i8]* align 512 %_01, [3 x i8]* align 512 %_12, [3 x i8]* align 512 %_23)
  call fastcc void @onebyonecpy_hls.p0a3a3i16([3 x [3 x i16]]* %2, [3 x [3 x i16]]* align 512 %3)
  ret void
}

declare void @apatb_matrixmul_hw([3 x i8]*, [3 x i8]*, [3 x i8]*, [3 x i8]*, [3 x i8]*, [3 x i8]*, [3 x i16]*)

; Function Attrs: argmemonly noinline norecurse
define internal void @copy_back([3 x [3 x i8]]* noalias "orig.arg.no"="0", [3 x i8]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_0, [3 x i8]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_1, [3 x i8]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_2, [3 x [3 x i8]]* noalias "orig.arg.no"="2", [3 x i8]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_01, [3 x i8]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_12, [3 x i8]* noalias readonly align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_23, [3 x [3 x i16]]* noalias "orig.arg.no"="4", [3 x [3 x i16]]* noalias readonly align 512 "orig.arg.no"="5") #5 {
entry:
  call fastcc void @onebyonecpy_hls.p0a3a3i16([3 x [3 x i16]]* %2, [3 x [3 x i16]]* align 512 %3)
  ret void
}

define void @matrixmul_hw_stub_wrapper([3 x i8]*, [3 x i8]*, [3 x i8]*, [3 x i8]*, [3 x i8]*, [3 x i8]*, [3 x i16]*) #6 {
entry:
  %7 = alloca [3 x [3 x i8]]
  %8 = alloca [3 x [3 x i8]]
  %9 = bitcast [3 x i16]* %6 to [3 x [3 x i16]]*
  call void @copy_out([3 x [3 x i8]]* %7, [3 x i8]* %0, [3 x i8]* %1, [3 x i8]* %2, [3 x [3 x i8]]* %8, [3 x i8]* %3, [3 x i8]* %4, [3 x i8]* %5, [3 x [3 x i16]]* null, [3 x [3 x i16]]* %9)
  %10 = bitcast [3 x [3 x i8]]* %7 to [3 x i8]*
  %11 = bitcast [3 x [3 x i8]]* %8 to [3 x i8]*
  %12 = bitcast [3 x [3 x i16]]* %9 to [3 x i16]*
  call void @matrixmul_hw_stub([3 x i8]* %10, [3 x i8]* %11, [3 x i16]* %12)
  call void @copy_in([3 x [3 x i8]]* %7, [3 x i8]* %0, [3 x i8]* %1, [3 x i8]* %2, [3 x [3 x i8]]* %8, [3 x i8]* %3, [3 x i8]* %4, [3 x i8]* %5, [3 x [3 x i16]]* null, [3 x [3 x i16]]* %9)
  ret void
}

declare void @matrixmul_hw_stub([3 x i8]*, [3 x i8]*, [3 x i16]*)

attributes #0 = { inaccessiblememonly nounwind }
attributes #1 = { inaccessiblemem_or_argmemonly noinline "fpga.wrapper.func"="wrapper" }
attributes #2 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyin" }
attributes #5 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyout" }
attributes #6 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
!5 = !DILocation(line: 10, column: 9, scope: !6)
!6 = !DILexicalBlockFile(scope: !8, file: !7, discriminator: 0)
!7 = !DIFile(filename: "C:/Users/ShaneWu/OneDrive/Desktop/Documents/NTU/HLS/labA/hls_matrixmul_prj/solution5/directives.tcl", directory: "C:\5CUsers\5CShaneWu\5COneDrive\5CDesktop\5CDocuments\5CNTU\5CHLS\5ClabA")
!8 = distinct !DISubprogram(name: "matrixmul", linkageName: "_Z9matrixmulPA3_cS0_PA3_s", scope: !9, file: !9, line: 48, type: !10, isLocal: false, isDefinition: true, scopeLine: 52, flags: DIFlagPrototyped, isOptimized: false, unit: !26, variables: !4)
!9 = !DIFile(filename: "../110061901_lab_a/Design_Optimization_Source_Code/lab1/matrixmul.cpp", directory: "C:\5CUsers\5CShaneWu\5COneDrive\5CDesktop\5CDocuments\5CNTU\5CHLS\5ClabA")
!10 = !DISubroutineType(types: !11)
!11 = !{null, !12, !19, !22}
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 24, elements: !17)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "mat_a_t", file: !15, line: 60, baseType: !16)
!15 = !DIFile(filename: "../110061901_lab_a/Design_Optimization_Source_Code/lab1/matrixmul.h", directory: "C:\5CUsers\5CShaneWu\5COneDrive\5CDesktop\5CDocuments\5CNTU\5CHLS\5ClabA")
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !{!18}
!18 = !DISubrange(count: 3)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 24, elements: !17)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "mat_b_t", file: !15, line: 61, baseType: !16)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 48, elements: !17)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "result_t", file: !15, line: 62, baseType: !25)
!25 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!26 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !27, producer: "clang version 7.0.0 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, imports: !28)
!27 = !DIFile(filename: "C:/Users/ShaneWu/OneDrive/Desktop/Documents/NTU/HLS/labA/hls_matrixmul_prj/solution5/.autopilot/db\5Cmatrixmul.pp.0.cpp", directory: "C:\5CUsers\5CShaneWu\5COneDrive\5CDesktop\5CDocuments\5CNTU\5CHLS\5ClabA")
!28 = !{!29, !37, !43, !45, !47, !51, !53, !55, !57, !59, !61, !63, !65, !70, !74, !76, !78, !83, !85, !87, !89, !91, !93, !95, !97, !100, !102, !106, !111, !113, !115, !117, !119, !121, !123, !125, !127, !129, !131, !135, !139, !141, !143, !145, !147, !149, !151, !153, !155, !157, !159, !161, !163, !165, !167, !169, !173, !177, !181, !183, !185, !187, !189, !191, !193, !195, !197, !199, !203, !207, !211, !213, !215, !217, !222, !226, !230, !232, !234, !236, !238, !240, !242, !244, !246, !248, !250, !252, !254, !259, !263, !267, !269, !271, !273, !279, !283, !287, !289, !291, !293, !295, !297, !299, !303, !307, !309, !311, !313, !315, !319, !323, !327, !329, !331, !333, !335, !337, !339, !343, !347, !351, !353, !357, !361, !363, !365, !367, !369, !371, !373}
!29 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !31, file: !36, line: 52)
!30 = !DINamespace(name: "std", scope: null)
!31 = !DISubprogram(name: "abs", scope: !32, file: !32, line: 254, type: !33, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!32 = !DIFile(filename: "E:/Xilinx/Vitis_HLS/2022.1/tps/mingw/8.3.0/win64.o/nt\5Cx86_64-w64-mingw32\5Cinclude\5Cmath.h", directory: "C:\5CUsers\5CShaneWu\5COneDrive\5CDesktop\5CDocuments\5CNTU\5CHLS\5ClabA")
!33 = !DISubroutineType(types: !34)
!34 = !{!35, !35}
!35 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!36 = !DIFile(filename: "E:/Xilinx/Vitis_HLS/2022.1/tps/mingw/8.3.0/win64.o/nt\5Clib\5Cgcc\5Cx86_64-w64-mingw32\5C8.3.0\5Cinclude\5Cc++\5Cbits/std_abs.h", directory: "C:\5CUsers\5CShaneWu\5COneDrive\5CDesktop\5CDocuments\5CNTU\5CHLS\5ClabA")
!37 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !38, file: !42, line: 83)
!38 = !DISubprogram(name: "acos", scope: !32, file: !32, line: 190, type: !39, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!39 = !DISubroutineType(types: !40)
!40 = !{!41, !41}
!41 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!42 = !DIFile(filename: "E:/Xilinx/Vitis_HLS/2022.1/tps/mingw/8.3.0/win64.o/nt\5Clib\5Cgcc\5Cx86_64-w64-mingw32\5C8.3.0\5Cinclude\5Cc++\5Ccmath", directory: "C:\5CUsers\5CShaneWu\5COneDrive\5CDesktop\5CDocuments\5CNTU\5CHLS\5ClabA")
!43 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !44, file: !42, line: 102)
!44 = !DISubprogram(name: "asin", scope: !32, file: !32, line: 189, type: !39, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!45 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !46, file: !42, line: 121)
!46 = !DISubprogram(name: "atan", scope: !32, file: !32, line: 191, type: !39, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!47 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !48, file: !42, line: 140)
!48 = !DISubprogram(name: "atan2", scope: !32, file: !32, line: 192, type: !49, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!49 = !DISubroutineType(types: !50)
!50 = !{!41, !41, !41}
!51 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !52, file: !42, line: 161)
!52 = !DISubprogram(name: "ceil", scope: !32, file: !32, line: 198, type: !39, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!53 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !54, file: !42, line: 180)
!54 = !DISubprogram(name: "cos", scope: !32, file: !32, line: 184, type: !39, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!55 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !56, file: !42, line: 199)
!56 = !DISubprogram(name: "cosh", scope: !32, file: !32, line: 187, type: !39, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!57 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !58, file: !42, line: 218)
!58 = !DISubprogram(name: "exp", scope: !32, file: !32, line: 193, type: !39, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!59 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !60, file: !42, line: 237)
!60 = !DISubprogram(name: "fabs", scope: !32, file: !32, line: 204, type: !39, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!61 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !62, file: !42, line: 256)
!62 = !DISubprogram(name: "floor", scope: !32, file: !32, line: 199, type: !39, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!63 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !64, file: !42, line: 275)
!64 = !DISubprogram(name: "fmod", scope: !32, file: !32, line: 246, type: !49, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!65 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !66, file: !42, line: 296)
!66 = !DISubprogram(name: "frexp", scope: !32, file: !32, line: 244, type: !67, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!67 = !DISubroutineType(types: !68)
!68 = !{!41, !41, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!70 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !71, file: !42, line: 315)
!71 = !DISubprogram(name: "ldexp", scope: !32, file: !32, line: 243, type: !72, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!72 = !DISubroutineType(types: !73)
!73 = !{!41, !41, !35}
!74 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !75, file: !42, line: 334)
!75 = !DISubprogram(name: "log", scope: !32, file: !32, line: 194, type: !39, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!76 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !77, file: !42, line: 353)
!77 = !DISubprogram(name: "log10", scope: !32, file: !32, line: 195, type: !39, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!78 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !79, file: !42, line: 372)
!79 = !DISubprogram(name: "modf", scope: !32, file: !32, line: 245, type: !80, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!80 = !DISubroutineType(types: !81)
!81 = !{!41, !41, !82}
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!83 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !84, file: !42, line: 384)
!84 = !DISubprogram(name: "pow", scope: !32, file: !32, line: 196, type: !49, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!85 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !86, file: !42, line: 421)
!86 = !DISubprogram(name: "sin", scope: !32, file: !32, line: 183, type: !39, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!87 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !88, file: !42, line: 440)
!88 = !DISubprogram(name: "sinh", scope: !32, file: !32, line: 186, type: !39, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!89 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !90, file: !42, line: 459)
!90 = !DISubprogram(name: "sqrt", scope: !32, file: !32, line: 197, type: !39, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!91 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !92, file: !42, line: 478)
!92 = !DISubprogram(name: "tan", scope: !32, file: !32, line: 185, type: !39, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!93 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !94, file: !42, line: 497)
!94 = !DISubprogram(name: "tanh", scope: !32, file: !32, line: 188, type: !39, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!95 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !96, file: !42, line: 1065)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !32, line: 373, baseType: !41)
!97 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !98, file: !42, line: 1066)
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !32, line: 372, baseType: !99)
!99 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!100 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !101, file: !42, line: 1069)
!101 = !DISubprogram(name: "acosh", scope: !32, file: !32, line: 705, type: !39, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!102 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !103, file: !42, line: 1070)
!103 = !DISubprogram(name: "acoshf", scope: !32, file: !32, line: 706, type: !104, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!104 = !DISubroutineType(types: !105)
!105 = !{!99, !99}
!106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !107, file: !42, line: 1071)
!107 = !DISubprogram(name: "acoshl", scope: !32, file: !32, line: 707, type: !108, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!108 = !DISubroutineType(types: !109)
!109 = !{!110, !110}
!110 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !112, file: !42, line: 1073)
!112 = !DISubprogram(name: "asinh", scope: !32, file: !32, line: 710, type: !39, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !114, file: !42, line: 1074)
!114 = !DISubprogram(name: "asinhf", scope: !32, file: !32, line: 711, type: !104, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !116, file: !42, line: 1075)
!116 = !DISubprogram(name: "asinhl", scope: !32, file: !32, line: 712, type: !108, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !118, file: !42, line: 1077)
!118 = !DISubprogram(name: "atanh", scope: !32, file: !32, line: 715, type: !39, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !120, file: !42, line: 1078)
!120 = !DISubprogram(name: "atanhf", scope: !32, file: !32, line: 716, type: !104, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !122, file: !42, line: 1079)
!122 = !DISubprogram(name: "atanhl", scope: !32, file: !32, line: 717, type: !108, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !124, file: !42, line: 1081)
!124 = !DISubprogram(name: "cbrt", scope: !32, file: !32, line: 877, type: !39, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !126, file: !42, line: 1082)
!126 = !DISubprogram(name: "cbrtf", scope: !32, file: !32, line: 878, type: !104, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !128, file: !42, line: 1083)
!128 = !DISubprogram(name: "cbrtl", scope: !32, file: !32, line: 879, type: !108, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !130, file: !42, line: 1085)
!130 = !DISubprogram(name: "copysign", scope: !32, file: !32, line: 1063, type: !49, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !132, file: !42, line: 1086)
!132 = !DISubprogram(name: "copysignf", scope: !32, file: !32, line: 1064, type: !133, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!133 = !DISubroutineType(types: !134)
!134 = !{!99, !99, !99}
!135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !136, file: !42, line: 1087)
!136 = !DISubprogram(name: "copysignl", scope: !32, file: !32, line: 1065, type: !137, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!137 = !DISubroutineType(types: !138)
!138 = !{!110, !110, !110}
!139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !140, file: !42, line: 1089)
!140 = !DISubprogram(name: "erf", scope: !32, file: !32, line: 901, type: !39, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !142, file: !42, line: 1090)
!142 = !DISubprogram(name: "erff", scope: !32, file: !32, line: 902, type: !104, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !144, file: !42, line: 1091)
!144 = !DISubprogram(name: "erfl", scope: !32, file: !32, line: 903, type: !108, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !146, file: !42, line: 1093)
!146 = !DISubprogram(name: "erfc", scope: !32, file: !32, line: 906, type: !39, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !148, file: !42, line: 1094)
!148 = !DISubprogram(name: "erfcf", scope: !32, file: !32, line: 907, type: !104, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !150, file: !42, line: 1095)
!150 = !DISubprogram(name: "erfcl", scope: !32, file: !32, line: 908, type: !108, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !152, file: !42, line: 1097)
!152 = !DISubprogram(name: "exp2", scope: !32, file: !32, line: 728, type: !39, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !154, file: !42, line: 1098)
!154 = !DISubprogram(name: "exp2f", scope: !32, file: !32, line: 729, type: !104, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !156, file: !42, line: 1099)
!156 = !DISubprogram(name: "exp2l", scope: !32, file: !32, line: 730, type: !108, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !158, file: !42, line: 1101)
!158 = !DISubprogram(name: "expm1", scope: !32, file: !32, line: 734, type: !39, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !160, file: !42, line: 1102)
!160 = !DISubprogram(name: "expm1f", scope: !32, file: !32, line: 735, type: !104, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !162, file: !42, line: 1103)
!162 = !DISubprogram(name: "expm1l", scope: !32, file: !32, line: 736, type: !108, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !164, file: !42, line: 1105)
!164 = !DISubprogram(name: "fdim", scope: !32, file: !32, line: 1109, type: !49, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !166, file: !42, line: 1106)
!166 = !DISubprogram(name: "fdimf", scope: !32, file: !32, line: 1110, type: !133, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!167 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !168, file: !42, line: 1107)
!168 = !DISubprogram(name: "fdiml", scope: !32, file: !32, line: 1111, type: !137, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !170, file: !42, line: 1109)
!170 = !DISubprogram(name: "fma", scope: !32, file: !32, line: 1130, type: !171, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!171 = !DISubroutineType(types: !172)
!172 = !{!41, !41, !41, !41}
!173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !174, file: !42, line: 1110)
!174 = !DISubprogram(name: "fmaf", scope: !32, file: !32, line: 1131, type: !175, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!175 = !DISubroutineType(types: !176)
!176 = !{!99, !99, !99, !99}
!177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !178, file: !42, line: 1111)
!178 = !DISubprogram(name: "fmal", scope: !32, file: !32, line: 1132, type: !179, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!179 = !DISubroutineType(types: !180)
!180 = !{!110, !110, !110, !110}
!181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !182, file: !42, line: 1113)
!182 = !DISubprogram(name: "fmax", scope: !32, file: !32, line: 1119, type: !49, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !184, file: !42, line: 1114)
!184 = !DISubprogram(name: "fmaxf", scope: !32, file: !32, line: 1120, type: !133, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !186, file: !42, line: 1115)
!186 = !DISubprogram(name: "fmaxl", scope: !32, file: !32, line: 1121, type: !137, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !188, file: !42, line: 1117)
!188 = !DISubprogram(name: "fmin", scope: !32, file: !32, line: 1124, type: !49, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !190, file: !42, line: 1118)
!190 = !DISubprogram(name: "fminf", scope: !32, file: !32, line: 1125, type: !133, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !192, file: !42, line: 1119)
!192 = !DISubprogram(name: "fminl", scope: !32, file: !32, line: 1126, type: !137, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !194, file: !42, line: 1121)
!194 = !DISubprogram(name: "hypot", scope: !32, file: !32, line: 882, type: !49, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !196, file: !42, line: 1122)
!196 = !DISubprogram(name: "hypotf", scope: !32, file: !32, line: 883, type: !133, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !198, file: !42, line: 1123)
!198 = !DISubprogram(name: "hypotl", scope: !32, file: !32, line: 887, type: !137, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !200, file: !42, line: 1125)
!200 = !DISubprogram(name: "ilogb", scope: !32, file: !32, line: 748, type: !201, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!201 = !DISubroutineType(types: !202)
!202 = !{!35, !41}
!203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !204, file: !42, line: 1126)
!204 = !DISubprogram(name: "ilogbf", scope: !32, file: !32, line: 749, type: !205, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!205 = !DISubroutineType(types: !206)
!206 = !{!35, !99}
!207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !208, file: !42, line: 1127)
!208 = !DISubprogram(name: "ilogbl", scope: !32, file: !32, line: 750, type: !209, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!209 = !DISubroutineType(types: !210)
!210 = !{!35, !110}
!211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !212, file: !42, line: 1129)
!212 = !DISubprogram(name: "lgamma", scope: !32, file: !32, line: 911, type: !39, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !214, file: !42, line: 1130)
!214 = !DISubprogram(name: "lgammaf", scope: !32, file: !32, line: 912, type: !104, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !216, file: !42, line: 1131)
!216 = !DISubprogram(name: "lgammal", scope: !32, file: !32, line: 913, type: !108, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !218, file: !42, line: 1134)
!218 = !DISubprogram(name: "llrint", scope: !32, file: !32, line: 946, type: !219, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!219 = !DISubroutineType(types: !220)
!220 = !{!221, !41}
!221 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !223, file: !42, line: 1135)
!223 = !DISubprogram(name: "llrintf", scope: !32, file: !32, line: 947, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!224 = !DISubroutineType(types: !225)
!225 = !{!221, !99}
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !227, file: !42, line: 1136)
!227 = !DISubprogram(name: "llrintl", scope: !32, file: !32, line: 948, type: !228, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!228 = !DISubroutineType(types: !229)
!229 = !{!221, !110}
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !231, file: !42, line: 1138)
!231 = !DISubprogram(name: "llround", scope: !32, file: !32, line: 1038, type: !219, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !233, file: !42, line: 1139)
!233 = !DISubprogram(name: "llroundf", scope: !32, file: !32, line: 1039, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !235, file: !42, line: 1140)
!235 = !DISubprogram(name: "llroundl", scope: !32, file: !32, line: 1040, type: !228, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !237, file: !42, line: 1143)
!237 = !DISubprogram(name: "log1p", scope: !32, file: !32, line: 768, type: !39, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !239, file: !42, line: 1144)
!239 = !DISubprogram(name: "log1pf", scope: !32, file: !32, line: 769, type: !104, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !241, file: !42, line: 1145)
!241 = !DISubprogram(name: "log1pl", scope: !32, file: !32, line: 770, type: !108, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !243, file: !42, line: 1147)
!243 = !DISubprogram(name: "log2", scope: !32, file: !32, line: 773, type: !39, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !245, file: !42, line: 1148)
!245 = !DISubprogram(name: "log2f", scope: !32, file: !32, line: 774, type: !104, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !247, file: !42, line: 1149)
!247 = !DISubprogram(name: "log2l", scope: !32, file: !32, line: 775, type: !108, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !249, file: !42, line: 1151)
!249 = !DISubprogram(name: "logb", scope: !32, file: !32, line: 778, type: !39, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !251, file: !42, line: 1152)
!251 = !DISubprogram(name: "logbf", scope: !32, file: !32, line: 779, type: !104, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !253, file: !42, line: 1153)
!253 = !DISubprogram(name: "logbl", scope: !32, file: !32, line: 780, type: !108, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !255, file: !42, line: 1155)
!255 = !DISubprogram(name: "lrint", scope: !32, file: !32, line: 942, type: !256, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!256 = !DISubroutineType(types: !257)
!257 = !{!258, !41}
!258 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !260, file: !42, line: 1156)
!260 = !DISubprogram(name: "lrintf", scope: !32, file: !32, line: 943, type: !261, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!261 = !DISubroutineType(types: !262)
!262 = !{!258, !99}
!263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !264, file: !42, line: 1157)
!264 = !DISubprogram(name: "lrintl", scope: !32, file: !32, line: 944, type: !265, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!265 = !DISubroutineType(types: !266)
!266 = !{!258, !110}
!267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !268, file: !42, line: 1159)
!268 = !DISubprogram(name: "lround", scope: !32, file: !32, line: 1035, type: !256, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !270, file: !42, line: 1160)
!270 = !DISubprogram(name: "lroundf", scope: !32, file: !32, line: 1036, type: !261, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !272, file: !42, line: 1161)
!272 = !DISubprogram(name: "lroundl", scope: !32, file: !32, line: 1037, type: !265, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !274, file: !42, line: 1163)
!274 = !DISubprogram(name: "nan", scope: !32, file: !32, line: 1087, type: !275, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!275 = !DISubroutineType(types: !276)
!276 = !{!41, !277}
!277 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !278, size: 64)
!278 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !16)
!279 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !280, file: !42, line: 1164)
!280 = !DISubprogram(name: "nanf", scope: !32, file: !32, line: 1088, type: !281, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!281 = !DISubroutineType(types: !282)
!282 = !{!99, !277}
!283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !284, file: !42, line: 1165)
!284 = !DISubprogram(name: "nanl", scope: !32, file: !32, line: 1089, type: !285, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!285 = !DISubroutineType(types: !286)
!286 = !{!110, !277}
!287 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !288, file: !42, line: 1167)
!288 = !DISubprogram(name: "nearbyint", scope: !32, file: !32, line: 931, type: !39, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !290, file: !42, line: 1168)
!290 = !DISubprogram(name: "nearbyintf", scope: !32, file: !32, line: 932, type: !104, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!291 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !292, file: !42, line: 1169)
!292 = !DISubprogram(name: "nearbyintl", scope: !32, file: !32, line: 933, type: !108, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!293 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !294, file: !42, line: 1171)
!294 = !DISubprogram(name: "nextafter", scope: !32, file: !32, line: 1098, type: !49, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!295 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !296, file: !42, line: 1172)
!296 = !DISubprogram(name: "nextafterf", scope: !32, file: !32, line: 1099, type: !133, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !298, file: !42, line: 1173)
!298 = !DISubprogram(name: "nextafterl", scope: !32, file: !32, line: 1100, type: !137, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!299 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !300, file: !42, line: 1175)
!300 = !DISubprogram(name: "nexttoward", scope: !32, file: !32, line: 1103, type: !301, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!301 = !DISubroutineType(types: !302)
!302 = !{!41, !41, !110}
!303 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !304, file: !42, line: 1176)
!304 = !DISubprogram(name: "nexttowardf", scope: !32, file: !32, line: 1104, type: !305, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!305 = !DISubroutineType(types: !306)
!306 = !{!99, !99, !110}
!307 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !308, file: !42, line: 1177)
!308 = !DISubprogram(name: "nexttowardl", scope: !32, file: !32, line: 1105, type: !137, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!309 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !310, file: !42, line: 1179)
!310 = !DISubprogram(name: "remainder", scope: !32, file: !32, line: 1053, type: !49, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !312, file: !42, line: 1180)
!312 = !DISubprogram(name: "remainderf", scope: !32, file: !32, line: 1054, type: !133, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!313 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !314, file: !42, line: 1181)
!314 = !DISubprogram(name: "remainderl", scope: !32, file: !32, line: 1055, type: !137, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!315 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !316, file: !42, line: 1183)
!316 = !DISubprogram(name: "remquo", scope: !32, file: !32, line: 1058, type: !317, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!317 = !DISubroutineType(types: !318)
!318 = !{!41, !41, !41, !69}
!319 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !320, file: !42, line: 1184)
!320 = !DISubprogram(name: "remquof", scope: !32, file: !32, line: 1059, type: !321, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!321 = !DISubroutineType(types: !322)
!322 = !{!99, !99, !99, !69}
!323 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !324, file: !42, line: 1185)
!324 = !DISubprogram(name: "remquol", scope: !32, file: !32, line: 1060, type: !325, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!325 = !DISubroutineType(types: !326)
!326 = !{!110, !110, !110, !69}
!327 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !328, file: !42, line: 1187)
!328 = !DISubprogram(name: "rint", scope: !32, file: !32, line: 937, type: !39, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !330, file: !42, line: 1188)
!330 = !DISubprogram(name: "rintf", scope: !32, file: !32, line: 938, type: !104, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!331 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !332, file: !42, line: 1189)
!332 = !DISubprogram(name: "rintl", scope: !32, file: !32, line: 939, type: !108, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !334, file: !42, line: 1191)
!334 = !DISubprogram(name: "round", scope: !32, file: !32, line: 1030, type: !39, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!335 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !336, file: !42, line: 1192)
!336 = !DISubprogram(name: "roundf", scope: !32, file: !32, line: 1031, type: !104, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!337 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !338, file: !42, line: 1193)
!338 = !DISubprogram(name: "roundl", scope: !32, file: !32, line: 1032, type: !108, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!339 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !340, file: !42, line: 1195)
!340 = !DISubprogram(name: "scalbln", scope: !32, file: !32, line: 871, type: !341, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!341 = !DISubroutineType(types: !342)
!342 = !{!41, !41, !258}
!343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !344, file: !42, line: 1196)
!344 = !DISubprogram(name: "scalblnf", scope: !32, file: !32, line: 872, type: !345, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!345 = !DISubroutineType(types: !346)
!346 = !{!99, !99, !258}
!347 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !348, file: !42, line: 1197)
!348 = !DISubprogram(name: "scalblnl", scope: !32, file: !32, line: 873, type: !349, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!349 = !DISubroutineType(types: !350)
!350 = !{!110, !110, !258}
!351 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !352, file: !42, line: 1199)
!352 = !DISubprogram(name: "scalbn", scope: !32, file: !32, line: 867, type: !72, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!353 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !354, file: !42, line: 1200)
!354 = !DISubprogram(name: "scalbnf", scope: !32, file: !32, line: 868, type: !355, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!355 = !DISubroutineType(types: !356)
!356 = !{!99, !99, !35}
!357 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !358, file: !42, line: 1201)
!358 = !DISubprogram(name: "scalbnl", scope: !32, file: !32, line: 869, type: !359, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!359 = !DISubroutineType(types: !360)
!360 = !{!110, !110, !35}
!361 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !362, file: !42, line: 1203)
!362 = !DISubprogram(name: "tgamma", scope: !32, file: !32, line: 918, type: !39, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!363 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !364, file: !42, line: 1204)
!364 = !DISubprogram(name: "tgammaf", scope: !32, file: !32, line: 919, type: !104, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!365 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !366, file: !42, line: 1205)
!366 = !DISubprogram(name: "tgammal", scope: !32, file: !32, line: 920, type: !108, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!367 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !368, file: !42, line: 1207)
!368 = !DISubprogram(name: "trunc", scope: !32, file: !32, line: 1044, type: !39, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!369 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !370, file: !42, line: 1208)
!370 = !DISubprogram(name: "truncf", scope: !32, file: !32, line: 1045, type: !104, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!371 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !30, entity: !372, file: !42, line: 1209)
!372 = !DISubprogram(name: "truncl", scope: !32, file: !32, line: 1046, type: !108, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!373 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !26, entity: !30, file: !15, line: 50)
!374 = !DILocation(line: 11, column: 9, scope: !6)
