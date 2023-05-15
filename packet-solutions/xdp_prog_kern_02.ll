; ModuleID = 'xdp_prog_kern_02.c'
source_filename = "xdp_prog_kern_02.c"
target datalayout = "e-m:e-p:64:64-i64:64-n32:64-S128"
target triple = "bpf"

%struct.bpf_map_def = type { i32, i32, i32, i32, i32 }
%struct.xdp_md = type { i32, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.hdr_cursor = type { i8* }
%struct.collect_vlans = type { [2 x i16] }
%struct.vlan_hdr = type { i16, i16 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, i32, i32 }
%struct.ipv6hdr = type { i8, [3 x i8], i16, i8, i8, %struct.in6_addr, %struct.in6_addr }
%struct.in6_addr = type { %union.anon }
%union.anon = type { [4 x i32] }
%struct.udphdr = type { i16, i16, i16, i16 }

@xdp_stats_map = dso_local global %struct.bpf_map_def { i32 6, i32 4, i32 16, i32 5, i32 0 }, section "maps", align 4, !dbg !0
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !51
@llvm.used = appending global [5 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_pass_func to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_patch_ports_func to i8*), i8* bitcast (%struct.bpf_map_def* @xdp_stats_map to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_vlan_swap_func to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_patch_ports_func(%struct.xdp_md* nocapture readonly %0) #0 section "xdp_patch_ports" !dbg !92 {
  %2 = alloca i32, align 4
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !96, metadata !DIExpression()), !dbg !204
  call void @llvm.dbg.value(metadata i32 2, metadata !97, metadata !DIExpression()), !dbg !204
  %3 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !205
  %4 = load i32, i32* %3, align 4, !dbg !205, !tbaa !206
  %5 = zext i32 %4 to i64, !dbg !211
  %6 = inttoptr i64 %5 to i8*, !dbg !212
  call void @llvm.dbg.value(metadata i8* %6, metadata !196, metadata !DIExpression()), !dbg !204
  %7 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !213
  %8 = load i32, i32* %7, align 4, !dbg !213, !tbaa !214
  %9 = zext i32 %8 to i64, !dbg !215
  %10 = inttoptr i64 %9 to i8*, !dbg !216
  call void @llvm.dbg.value(metadata i8* %10, metadata !197, metadata !DIExpression()), !dbg !204
  call void @llvm.dbg.value(metadata i8* %10, metadata !198, metadata !DIExpression()), !dbg !204
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !100, metadata !DIExpression(DW_OP_deref)), !dbg !204
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !217, metadata !DIExpression()), !dbg !226
  call void @llvm.dbg.value(metadata i8* %6, metadata !224, metadata !DIExpression()), !dbg !226
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !225, metadata !DIExpression()), !dbg !226
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !228, metadata !DIExpression()), !dbg !253
  call void @llvm.dbg.value(metadata i8* %6, metadata !240, metadata !DIExpression()), !dbg !253
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !241, metadata !DIExpression()), !dbg !253
  call void @llvm.dbg.value(metadata %struct.collect_vlans* null, metadata !242, metadata !DIExpression()), !dbg !253
  call void @llvm.dbg.value(metadata i8* %10, metadata !243, metadata !DIExpression()), !dbg !253
  call void @llvm.dbg.value(metadata i32 14, metadata !244, metadata !DIExpression()), !dbg !253
  %11 = getelementptr i8, i8* %10, i64 14, !dbg !255
  %12 = icmp ugt i8* %11, %6, !dbg !257
  br i1 %12, label %98, label %13, !dbg !258

13:                                               ; preds = %1
  call void @llvm.dbg.value(metadata i8* %10, metadata !243, metadata !DIExpression()), !dbg !253
  call void @llvm.dbg.value(metadata i8* %11, metadata !198, metadata !DIExpression()), !dbg !204
  call void @llvm.dbg.value(metadata i8* %11, metadata !245, metadata !DIExpression()), !dbg !253
  %14 = getelementptr inbounds i8, i8* %10, i64 12, !dbg !259
  %15 = bitcast i8* %14 to i16*, !dbg !259
  call void @llvm.dbg.value(metadata i16 undef, metadata !251, metadata !DIExpression()), !dbg !253
  call void @llvm.dbg.value(metadata i32 0, metadata !252, metadata !DIExpression()), !dbg !253
  %16 = load i16, i16* %15, align 1, !dbg !253, !tbaa !260
  call void @llvm.dbg.value(metadata i16 %16, metadata !251, metadata !DIExpression()), !dbg !253
  %17 = inttoptr i64 %5 to %struct.vlan_hdr*, !dbg !262
  %18 = getelementptr i8, i8* %10, i64 22, !dbg !267
  %19 = bitcast i8* %18 to %struct.vlan_hdr*, !dbg !267
  switch i16 %16, label %34 [
    i16 -22392, label %20
    i16 129, label %20
  ], !dbg !268

20:                                               ; preds = %13, %13
  %21 = getelementptr i8, i8* %10, i64 18, !dbg !269
  %22 = bitcast i8* %21 to %struct.vlan_hdr*, !dbg !269
  %23 = icmp ugt %struct.vlan_hdr* %22, %17, !dbg !270
  br i1 %23, label %34, label %24, !dbg !271

24:                                               ; preds = %20
  call void @llvm.dbg.value(metadata i16 undef, metadata !251, metadata !DIExpression()), !dbg !253
  %25 = getelementptr i8, i8* %10, i64 16, !dbg !272
  %26 = bitcast i8* %25 to i16*, !dbg !272
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %22, metadata !245, metadata !DIExpression()), !dbg !253
  call void @llvm.dbg.value(metadata i32 1, metadata !252, metadata !DIExpression()), !dbg !253
  %27 = load i16, i16* %26, align 1, !dbg !253, !tbaa !260
  call void @llvm.dbg.value(metadata i16 %27, metadata !251, metadata !DIExpression()), !dbg !253
  switch i16 %27, label %34 [
    i16 -22392, label %28
    i16 129, label %28
  ], !dbg !268

28:                                               ; preds = %24, %24
  %29 = icmp ugt %struct.vlan_hdr* %19, %17, !dbg !270
  br i1 %29, label %34, label %30, !dbg !271

30:                                               ; preds = %28
  call void @llvm.dbg.value(metadata i16 undef, metadata !251, metadata !DIExpression()), !dbg !253
  %31 = getelementptr i8, i8* %10, i64 20, !dbg !272
  %32 = bitcast i8* %31 to i16*, !dbg !272
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %19, metadata !245, metadata !DIExpression()), !dbg !253
  call void @llvm.dbg.value(metadata i32 2, metadata !252, metadata !DIExpression()), !dbg !253
  %33 = load i16, i16* %32, align 1, !dbg !253, !tbaa !260
  call void @llvm.dbg.value(metadata i16 %33, metadata !251, metadata !DIExpression()), !dbg !253
  br label %34

34:                                               ; preds = %30, %28, %24, %20, %13
  %35 = phi i8* [ %11, %13 ], [ %11, %20 ], [ %21, %24 ], [ %21, %28 ], [ %18, %30 ], !dbg !253
  %36 = phi i16 [ %16, %13 ], [ %16, %20 ], [ %27, %24 ], [ %27, %28 ], [ %33, %30 ], !dbg !253
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* undef, metadata !245, metadata !DIExpression()), !dbg !253
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* undef, metadata !245, metadata !DIExpression()), !dbg !253
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* undef, metadata !245, metadata !DIExpression()), !dbg !253
  call void @llvm.dbg.value(metadata i8* %35, metadata !198, metadata !DIExpression()), !dbg !204
  call void @llvm.dbg.value(metadata i8* %35, metadata !198, metadata !DIExpression()), !dbg !204
  call void @llvm.dbg.value(metadata i16 %36, metadata !98, metadata !DIExpression()), !dbg !204
  call void @llvm.dbg.value(metadata i16 %36, metadata !98, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_signed, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_stack_value)), !dbg !204
  switch i16 %36, label %98 [
    i16 8, label %37
    i16 -8826, label %49
  ], !dbg !273

37:                                               ; preds = %34
  call void @llvm.dbg.value(metadata %struct.iphdr** undef, metadata !114, metadata !DIExpression(DW_OP_deref)), !dbg !204
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !274, metadata !DIExpression()), !dbg !284
  call void @llvm.dbg.value(metadata i8* %6, metadata !280, metadata !DIExpression()), !dbg !284
  call void @llvm.dbg.value(metadata %struct.iphdr** undef, metadata !281, metadata !DIExpression()), !dbg !284
  call void @llvm.dbg.value(metadata i8* %35, metadata !282, metadata !DIExpression()), !dbg !284
  %38 = getelementptr inbounds i8, i8* %35, i64 20, !dbg !288
  %39 = icmp ugt i8* %38, %6, !dbg !290
  br i1 %39, label %98, label %40, !dbg !291

40:                                               ; preds = %37
  %41 = load i8, i8* %35, align 4, !dbg !292
  %42 = shl i8 %41, 2, !dbg !293
  %43 = and i8 %42, 60, !dbg !293
  call void @llvm.dbg.value(metadata i8 %43, metadata !283, metadata !DIExpression()), !dbg !284
  %44 = icmp ult i8 %43, 20, !dbg !294
  br i1 %44, label %98, label %45, !dbg !296

45:                                               ; preds = %40
  %46 = zext i8 %43 to i64, !dbg !297
  call void @llvm.dbg.value(metadata i64 %46, metadata !283, metadata !DIExpression()), !dbg !284
  %47 = getelementptr i8, i8* %35, i64 %46, !dbg !298
  %48 = icmp ugt i8* %47, %6, !dbg !300
  br i1 %48, label %98, label %54, !dbg !301

49:                                               ; preds = %34
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !302, metadata !DIExpression()), !dbg !311
  call void @llvm.dbg.value(metadata i8* %6, metadata !308, metadata !DIExpression()), !dbg !311
  call void @llvm.dbg.value(metadata i8* %35, metadata !310, metadata !DIExpression()), !dbg !311
  %50 = getelementptr inbounds i8, i8* %35, i64 40, !dbg !315
  %51 = bitcast i8* %50 to %struct.ipv6hdr*, !dbg !315
  %52 = inttoptr i64 %5 to %struct.ipv6hdr*, !dbg !317
  %53 = icmp ugt %struct.ipv6hdr* %51, %52, !dbg !318
  br i1 %53, label %98, label %54, !dbg !319

54:                                               ; preds = %49, %45
  %55 = phi i64 [ 9, %45 ], [ 6, %49 ]
  %56 = phi i8* [ %47, %45 ], [ %50, %49 ], !dbg !320
  %57 = getelementptr inbounds i8, i8* %35, i64 %55, !dbg !321
  %58 = load i8, i8* %57, align 1, !dbg !321, !tbaa !322
  call void @llvm.dbg.value(metadata i8* %56, metadata !198, metadata !DIExpression()), !dbg !204
  call void @llvm.dbg.value(metadata i8 %58, metadata !99, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_signed, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_stack_value)), !dbg !204
  switch i8 %58, label %98 [
    i8 17, label %59
    i8 6, label %77
  ], !dbg !323

59:                                               ; preds = %54
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !324, metadata !DIExpression()) #4, !dbg !334
  call void @llvm.dbg.value(metadata i8* %6, metadata !330, metadata !DIExpression()) #4, !dbg !334
  call void @llvm.dbg.value(metadata i8* %56, metadata !333, metadata !DIExpression()) #4, !dbg !334
  %60 = getelementptr inbounds i8, i8* %56, i64 8, !dbg !339
  %61 = bitcast i8* %60 to %struct.udphdr*, !dbg !339
  %62 = inttoptr i64 %5 to %struct.udphdr*, !dbg !341
  %63 = icmp ugt %struct.udphdr* %61, %62, !dbg !342
  br i1 %63, label %98, label %64, !dbg !343

64:                                               ; preds = %59
  call void @llvm.dbg.value(metadata %struct.udphdr* %61, metadata !198, metadata !DIExpression()), !dbg !204
  %65 = getelementptr inbounds i8, i8* %56, i64 4, !dbg !344
  %66 = bitcast i8* %65 to i16*, !dbg !344
  %67 = load i16, i16* %66, align 2, !dbg !344, !tbaa !345
  %68 = tail call i16 @llvm.bswap.i16(i16 %67) #4
  call void @llvm.dbg.value(metadata i16 %68, metadata !332, metadata !DIExpression(DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value)) #4, !dbg !334
  %69 = icmp ult i16 %68, 8, !dbg !347
  br i1 %69, label %98, label %70, !dbg !349

70:                                               ; preds = %64
  call void @llvm.dbg.value(metadata i16 %68, metadata !332, metadata !DIExpression(DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value)) #4, !dbg !334
  call void @llvm.dbg.value(metadata i8* %56, metadata !165, metadata !DIExpression()), !dbg !204
  %71 = getelementptr inbounds i8, i8* %56, i64 2, !dbg !350
  %72 = bitcast i8* %71 to i16*, !dbg !350
  %73 = load i16, i16* %72, align 2, !dbg !350, !tbaa !351
  %74 = tail call i16 @llvm.bswap.i16(i16 %73)
  %75 = add i16 %74, -1, !dbg !350
  %76 = tail call i16 @llvm.bswap.i16(i16 %75), !dbg !350
  store i16 %76, i16* %72, align 2, !dbg !352, !tbaa !351
  br label %98, !dbg !353

77:                                               ; preds = %54
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !354, metadata !DIExpression()), !dbg !364
  call void @llvm.dbg.value(metadata i8* %6, metadata !360, metadata !DIExpression()), !dbg !364
  call void @llvm.dbg.value(metadata i8* %56, metadata !363, metadata !DIExpression()), !dbg !364
  %78 = getelementptr inbounds i8, i8* %56, i64 20, !dbg !369
  %79 = icmp ugt i8* %78, %6, !dbg !371
  br i1 %79, label %98, label %80, !dbg !372

80:                                               ; preds = %77
  %81 = getelementptr inbounds i8, i8* %56, i64 12, !dbg !373
  %82 = bitcast i8* %81 to i16*, !dbg !373
  %83 = load i16, i16* %82, align 4, !dbg !373
  %84 = lshr i16 %83, 2, !dbg !374
  %85 = and i16 %84, 60, !dbg !374
  call void @llvm.dbg.value(metadata i16 %85, metadata !362, metadata !DIExpression()), !dbg !364
  %86 = icmp ult i16 %85, 20, !dbg !375
  br i1 %86, label %98, label %87, !dbg !377

87:                                               ; preds = %80
  %88 = zext i16 %85 to i64, !dbg !378
  %89 = getelementptr i8, i8* %56, i64 %88, !dbg !379
  %90 = icmp ugt i8* %89, %6, !dbg !381
  br i1 %90, label %98, label %91, !dbg !382

91:                                               ; preds = %87
  call void @llvm.dbg.value(metadata i8* %89, metadata !198, metadata !DIExpression()), !dbg !204
  call void @llvm.dbg.value(metadata i8* %56, metadata !174, metadata !DIExpression()), !dbg !204
  %92 = getelementptr inbounds i8, i8* %56, i64 2, !dbg !383
  %93 = bitcast i8* %92 to i16*, !dbg !383
  %94 = load i16, i16* %93, align 2, !dbg !383, !tbaa !384
  %95 = tail call i16 @llvm.bswap.i16(i16 %94)
  %96 = add i16 %95, -1, !dbg !383
  %97 = tail call i16 @llvm.bswap.i16(i16 %96), !dbg !383
  store i16 %97, i16* %93, align 2, !dbg !386, !tbaa !384
  br label %98, !dbg !387

98:                                               ; preds = %87, %80, %77, %64, %59, %49, %45, %40, %37, %1, %54, %34, %70, %91
  %99 = phi i32 [ 2, %70 ], [ 2, %91 ], [ 2, %34 ], [ 2, %54 ], [ 0, %1 ], [ 2, %37 ], [ 2, %40 ], [ 2, %45 ], [ 2, %49 ], [ 0, %59 ], [ 0, %64 ], [ 0, %77 ], [ 0, %80 ], [ 0, %87 ], !dbg !204
  call void @llvm.dbg.value(metadata i32 %99, metadata !97, metadata !DIExpression()), !dbg !204
  call void @llvm.dbg.label(metadata !203), !dbg !388
  %100 = bitcast i32* %2 to i8*, !dbg !389
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %100), !dbg !389
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !394, metadata !DIExpression()) #4, !dbg !389
  call void @llvm.dbg.value(metadata i32 %99, metadata !395, metadata !DIExpression()) #4, !dbg !389
  store i32 %99, i32* %2, align 4, !tbaa !406
  call void @llvm.dbg.value(metadata i32* %2, metadata !395, metadata !DIExpression(DW_OP_deref)) #4, !dbg !389
  %101 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @xdp_stats_map to i8*), i8* nonnull %100) #4, !dbg !407
  call void @llvm.dbg.value(metadata i8* %101, metadata !396, metadata !DIExpression()) #4, !dbg !389
  %102 = icmp eq i8* %101, null, !dbg !408
  br i1 %102, label %116, label %103, !dbg !410

103:                                              ; preds = %98
  call void @llvm.dbg.value(metadata i8* %101, metadata !396, metadata !DIExpression()) #4, !dbg !389
  %104 = bitcast i8* %101 to i64*, !dbg !411
  %105 = load i64, i64* %104, align 8, !dbg !412, !tbaa !413
  %106 = add i64 %105, 1, !dbg !412
  store i64 %106, i64* %104, align 8, !dbg !412, !tbaa !413
  %107 = load i32, i32* %3, align 4, !dbg !416, !tbaa !206
  %108 = load i32, i32* %7, align 4, !dbg !417, !tbaa !214
  %109 = sub i32 %107, %108, !dbg !418
  %110 = zext i32 %109 to i64, !dbg !419
  %111 = getelementptr inbounds i8, i8* %101, i64 8, !dbg !420
  %112 = bitcast i8* %111 to i64*, !dbg !420
  %113 = load i64, i64* %112, align 8, !dbg !421, !tbaa !422
  %114 = add i64 %113, %110, !dbg !421
  store i64 %114, i64* %112, align 8, !dbg !421, !tbaa !422
  %115 = load i32, i32* %2, align 4, !dbg !423, !tbaa !406
  call void @llvm.dbg.value(metadata i32 %115, metadata !395, metadata !DIExpression()) #4, !dbg !389
  br label %116, !dbg !424

116:                                              ; preds = %98, %103
  %117 = phi i32 [ %115, %103 ], [ 0, %98 ], !dbg !389
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %100), !dbg !425
  ret i32 %117, !dbg !426
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind
define dso_local i32 @xdp_vlan_swap_func(%struct.xdp_md* %0) #0 section "xdp_vlan_swap" !dbg !427 {
  %2 = alloca %struct.ethhdr, align 1
  call void @llvm.dbg.declare(metadata %struct.ethhdr* %2, metadata !435, metadata !DIExpression()), !dbg !447
  %3 = alloca %struct.ethhdr, align 1
  call void @llvm.dbg.declare(metadata %struct.ethhdr* %3, metadata !450, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !429, metadata !DIExpression()), !dbg !462
  %4 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !463
  %5 = load i32, i32* %4, align 4, !dbg !463, !tbaa !206
  %6 = zext i32 %5 to i64, !dbg !464
  %7 = inttoptr i64 %6 to i8*, !dbg !465
  call void @llvm.dbg.value(metadata i8* %7, metadata !430, metadata !DIExpression()), !dbg !462
  %8 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !466
  %9 = load i32, i32* %8, align 4, !dbg !466, !tbaa !214
  %10 = zext i32 %9 to i64, !dbg !467
  %11 = inttoptr i64 %10 to i8*, !dbg !468
  call void @llvm.dbg.value(metadata i8* %11, metadata !431, metadata !DIExpression()), !dbg !462
  call void @llvm.dbg.value(metadata i8* %11, metadata !432, metadata !DIExpression()), !dbg !462
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !217, metadata !DIExpression()), !dbg !469
  call void @llvm.dbg.value(metadata i8* %7, metadata !224, metadata !DIExpression()), !dbg !469
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !228, metadata !DIExpression()), !dbg !471
  call void @llvm.dbg.value(metadata i8* %7, metadata !240, metadata !DIExpression()), !dbg !471
  call void @llvm.dbg.value(metadata %struct.collect_vlans* null, metadata !242, metadata !DIExpression()), !dbg !471
  call void @llvm.dbg.value(metadata i8* %11, metadata !243, metadata !DIExpression()), !dbg !471
  call void @llvm.dbg.value(metadata i32 14, metadata !244, metadata !DIExpression()), !dbg !471
  %12 = getelementptr i8, i8* %11, i64 14, !dbg !473
  %13 = icmp ugt i8* %12, %7, !dbg !474
  br i1 %13, label %72, label %14, !dbg !475

14:                                               ; preds = %1
  call void @llvm.dbg.value(metadata i8* %11, metadata !243, metadata !DIExpression()), !dbg !471
  call void @llvm.dbg.value(metadata i8* %12, metadata !432, metadata !DIExpression()), !dbg !462
  %15 = inttoptr i64 %10 to %struct.ethhdr*, !dbg !476
  call void @llvm.dbg.value(metadata i8* %12, metadata !245, metadata !DIExpression()), !dbg !471
  call void @llvm.dbg.value(metadata i16 undef, metadata !251, metadata !DIExpression()), !dbg !471
  call void @llvm.dbg.value(metadata i32 0, metadata !252, metadata !DIExpression()), !dbg !471
  call void @llvm.dbg.value(metadata i16 undef, metadata !251, metadata !DIExpression()), !dbg !471
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* undef, metadata !245, metadata !DIExpression()), !dbg !471
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* undef, metadata !432, metadata !DIExpression()), !dbg !462
  call void @llvm.dbg.value(metadata i16 undef, metadata !433, metadata !DIExpression()), !dbg !462
  call void @llvm.dbg.value(metadata %struct.ethhdr* %15, metadata !434, metadata !DIExpression()), !dbg !462
  %16 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %15, i64 0, i32 2, !dbg !477
  %17 = load i16, i16* %16, align 1, !dbg !477, !tbaa !478
  switch i16 %17, label %45 [
    i16 -22392, label %18
    i16 129, label %18
  ], !dbg !480

18:                                               ; preds = %14, %14
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !441, metadata !DIExpression()) #4, !dbg !481
  call void @llvm.dbg.value(metadata %struct.ethhdr* %15, metadata !442, metadata !DIExpression()) #4, !dbg !481
  call void @llvm.dbg.value(metadata i32 %5, metadata !443, metadata !DIExpression()) #4, !dbg !481
  %19 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %2, i64 0, i32 0, i64 0, !dbg !482
  call void @llvm.lifetime.start.p0i8(i64 14, i8* nonnull %19), !dbg !482
  switch i16 %17, label %44 [
    i16 -22392, label %20
    i16 129, label %20
  ], !dbg !483

20:                                               ; preds = %18, %18
  call void @llvm.dbg.value(metadata i64 %6, metadata !443, metadata !DIExpression()) #4, !dbg !481
  call void @llvm.dbg.value(metadata i64 %6, metadata !443, metadata !DIExpression()) #4, !dbg !481
  call void @llvm.dbg.value(metadata %struct.ethhdr* %15, metadata !444, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)) #4, !dbg !481
  %21 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %15, i64 1, i32 0, i64 4, !dbg !484
  %22 = bitcast i8* %21 to %struct.vlan_hdr*, !dbg !484
  %23 = inttoptr i64 %6 to %struct.vlan_hdr*, !dbg !486
  %24 = icmp ugt %struct.vlan_hdr* %22, %23, !dbg !487
  br i1 %24, label %44, label %25, !dbg !488

25:                                               ; preds = %20
  call void @llvm.dbg.value(metadata i32 undef, metadata !446, metadata !DIExpression()) #4, !dbg !481
  %26 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %15, i64 1, i32 0, i64 2, !dbg !489
  %27 = bitcast i8* %26 to i16*, !dbg !489
  %28 = load i16, i16* %27, align 2, !dbg !489, !tbaa !490
  call void @llvm.dbg.value(metadata i16 %28, metadata !445, metadata !DIExpression()) #4, !dbg !481
  %29 = getelementptr %struct.ethhdr, %struct.ethhdr* %15, i64 0, i32 0, i64 0, !dbg !492
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(14) %19, i8* nonnull align 1 dereferenceable(14) %29, i64 14, i1 false) #4, !dbg !492
  %30 = tail call i32 inttoptr (i64 44 to i32 (%struct.xdp_md*, i32)*)(%struct.xdp_md* nonnull %0, i32 4) #4, !dbg !493
  %31 = icmp eq i32 %30, 0, !dbg !493
  br i1 %31, label %32, label %44, !dbg !495

32:                                               ; preds = %25
  %33 = load i32, i32* %8, align 4, !dbg !496, !tbaa !214
  %34 = zext i32 %33 to i64, !dbg !497
  %35 = inttoptr i64 %34 to %struct.ethhdr*, !dbg !498
  call void @llvm.dbg.value(metadata %struct.ethhdr* %35, metadata !442, metadata !DIExpression()) #4, !dbg !481
  %36 = load i32, i32* %4, align 4, !dbg !499, !tbaa !206
  %37 = zext i32 %36 to i64, !dbg !500
  call void @llvm.dbg.value(metadata i64 %37, metadata !443, metadata !DIExpression()) #4, !dbg !481
  %38 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %35, i64 1, !dbg !501
  %39 = inttoptr i64 %37 to %struct.ethhdr*, !dbg !503
  %40 = icmp ugt %struct.ethhdr* %38, %39, !dbg !504
  br i1 %40, label %44, label %41, !dbg !505

41:                                               ; preds = %32
  %42 = inttoptr i64 %34 to i8*, !dbg !498
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(14) %42, i8* nonnull align 1 dereferenceable(14) %19, i64 14, i1 false) #4, !dbg !506
  %43 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %35, i64 0, i32 2, !dbg !507
  store i16 %28, i16* %43, align 1, !dbg !508, !tbaa !478
  br label %44, !dbg !509

44:                                               ; preds = %18, %20, %25, %32, %41
  call void @llvm.lifetime.end.p0i8(i64 14, i8* nonnull %19), !dbg !510
  br label %72, !dbg !511

45:                                               ; preds = %14
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !455, metadata !DIExpression()) #4, !dbg !512
  call void @llvm.dbg.value(metadata %struct.ethhdr* %15, metadata !456, metadata !DIExpression()) #4, !dbg !512
  call void @llvm.dbg.value(metadata i32 1, metadata !457, metadata !DIExpression()) #4, !dbg !512
  call void @llvm.dbg.value(metadata i32 undef, metadata !458, metadata !DIExpression()) #4, !dbg !512
  %46 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %3, i64 0, i32 0, i64 0, !dbg !513
  call void @llvm.lifetime.start.p0i8(i64 14, i8* nonnull %46), !dbg !513
  %47 = getelementptr %struct.ethhdr, %struct.ethhdr* %15, i64 0, i32 0, i64 0, !dbg !514
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(14) %46, i8* nonnull align 1 dereferenceable(14) %47, i64 14, i1 false) #4, !dbg !514
  %48 = tail call i32 inttoptr (i64 44 to i32 (%struct.xdp_md*, i32)*)(%struct.xdp_md* nonnull %0, i32 -4) #4, !dbg !515
  %49 = icmp eq i32 %48, 0, !dbg !515
  br i1 %49, label %50, label %71, !dbg !517

50:                                               ; preds = %45
  %51 = load i32, i32* %4, align 4, !dbg !518, !tbaa !206
  %52 = zext i32 %51 to i64, !dbg !519
  call void @llvm.dbg.value(metadata i64 %52, metadata !458, metadata !DIExpression()) #4, !dbg !512
  %53 = load i32, i32* %8, align 4, !dbg !520, !tbaa !214
  %54 = zext i32 %53 to i64, !dbg !521
  %55 = inttoptr i64 %54 to %struct.ethhdr*, !dbg !522
  call void @llvm.dbg.value(metadata %struct.ethhdr* %55, metadata !456, metadata !DIExpression()) #4, !dbg !512
  %56 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %55, i64 1, !dbg !523
  %57 = inttoptr i64 %52 to %struct.ethhdr*, !dbg !525
  %58 = icmp ugt %struct.ethhdr* %56, %57, !dbg !526
  br i1 %58, label %71, label %59, !dbg !527

59:                                               ; preds = %50
  call void @llvm.dbg.value(metadata i64 %52, metadata !458, metadata !DIExpression()) #4, !dbg !512
  %60 = inttoptr i64 %54 to i8*, !dbg !522
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(14) %60, i8* nonnull align 1 dereferenceable(14) %46, i64 14, i1 false) #4, !dbg !528
  call void @llvm.dbg.value(metadata %struct.ethhdr* %56, metadata !459, metadata !DIExpression()) #4, !dbg !512
  %61 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %55, i64 1, i32 0, i64 4, !dbg !529
  %62 = bitcast i8* %61 to %struct.vlan_hdr*, !dbg !529
  %63 = inttoptr i64 %52 to %struct.vlan_hdr*, !dbg !531
  %64 = icmp ugt %struct.vlan_hdr* %62, %63, !dbg !532
  br i1 %64, label %71, label %65, !dbg !533

65:                                               ; preds = %59
  %66 = bitcast %struct.ethhdr* %56 to i16*, !dbg !534
  store i16 256, i16* %66, align 2, !dbg !535, !tbaa !536
  %67 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %55, i64 0, i32 2, !dbg !537
  %68 = load i16, i16* %67, align 1, !dbg !537, !tbaa !478
  %69 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %55, i64 1, i32 0, i64 2, !dbg !538
  %70 = bitcast i8* %69 to i16*, !dbg !538
  store i16 %68, i16* %70, align 2, !dbg !539, !tbaa !490
  store i16 129, i16* %67, align 1, !dbg !540, !tbaa !478
  br label %71, !dbg !541

71:                                               ; preds = %45, %50, %59, %65
  call void @llvm.lifetime.end.p0i8(i64 14, i8* nonnull %46), !dbg !542
  br label %72

72:                                               ; preds = %1, %44, %71
  ret i32 2, !dbg !543
}

; Function Attrs: norecurse nounwind readnone
define dso_local i32 @xdp_pass_func(%struct.xdp_md* nocapture readnone %0) #3 section "xdp_pass" !dbg !544 {
  call void @llvm.dbg.value(metadata %struct.xdp_md* undef, metadata !546, metadata !DIExpression()), !dbg !547
  ret i32 2, !dbg !548
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { norecurse nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!88, !89, !90}
!llvm.ident = !{!91}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "xdp_stats_map", scope: !2, file: !79, line: 16, type: !80, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !43, globals: !50, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "xdp_prog_kern_02.c", directory: "/home/saif/Desktop/xdp-tutorial/packet-solutions")
!4 = !{!5, !14}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 2845, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "../headers/linux/bpf.h", directory: "/home/saif/Desktop/xdp-tutorial/packet-solutions")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13}
!9 = !DIEnumerator(name: "XDP_ABORTED", value: 0, isUnsigned: true)
!10 = !DIEnumerator(name: "XDP_DROP", value: 1, isUnsigned: true)
!11 = !DIEnumerator(name: "XDP_PASS", value: 2, isUnsigned: true)
!12 = !DIEnumerator(name: "XDP_TX", value: 3, isUnsigned: true)
!13 = !DIEnumerator(name: "XDP_REDIRECT", value: 4, isUnsigned: true)
!14 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !15, line: 28, baseType: !7, size: 32, elements: !16)
!15 = !DIFile(filename: "/usr/include/linux/in.h", directory: "")
!16 = !{!17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42}
!17 = !DIEnumerator(name: "IPPROTO_IP", value: 0, isUnsigned: true)
!18 = !DIEnumerator(name: "IPPROTO_ICMP", value: 1, isUnsigned: true)
!19 = !DIEnumerator(name: "IPPROTO_IGMP", value: 2, isUnsigned: true)
!20 = !DIEnumerator(name: "IPPROTO_IPIP", value: 4, isUnsigned: true)
!21 = !DIEnumerator(name: "IPPROTO_TCP", value: 6, isUnsigned: true)
!22 = !DIEnumerator(name: "IPPROTO_EGP", value: 8, isUnsigned: true)
!23 = !DIEnumerator(name: "IPPROTO_PUP", value: 12, isUnsigned: true)
!24 = !DIEnumerator(name: "IPPROTO_UDP", value: 17, isUnsigned: true)
!25 = !DIEnumerator(name: "IPPROTO_IDP", value: 22, isUnsigned: true)
!26 = !DIEnumerator(name: "IPPROTO_TP", value: 29, isUnsigned: true)
!27 = !DIEnumerator(name: "IPPROTO_DCCP", value: 33, isUnsigned: true)
!28 = !DIEnumerator(name: "IPPROTO_IPV6", value: 41, isUnsigned: true)
!29 = !DIEnumerator(name: "IPPROTO_RSVP", value: 46, isUnsigned: true)
!30 = !DIEnumerator(name: "IPPROTO_GRE", value: 47, isUnsigned: true)
!31 = !DIEnumerator(name: "IPPROTO_ESP", value: 50, isUnsigned: true)
!32 = !DIEnumerator(name: "IPPROTO_AH", value: 51, isUnsigned: true)
!33 = !DIEnumerator(name: "IPPROTO_MTP", value: 92, isUnsigned: true)
!34 = !DIEnumerator(name: "IPPROTO_BEETPH", value: 94, isUnsigned: true)
!35 = !DIEnumerator(name: "IPPROTO_ENCAP", value: 98, isUnsigned: true)
!36 = !DIEnumerator(name: "IPPROTO_PIM", value: 103, isUnsigned: true)
!37 = !DIEnumerator(name: "IPPROTO_COMP", value: 108, isUnsigned: true)
!38 = !DIEnumerator(name: "IPPROTO_SCTP", value: 132, isUnsigned: true)
!39 = !DIEnumerator(name: "IPPROTO_UDPLITE", value: 136, isUnsigned: true)
!40 = !DIEnumerator(name: "IPPROTO_MPLS", value: 137, isUnsigned: true)
!41 = !DIEnumerator(name: "IPPROTO_RAW", value: 255, isUnsigned: true)
!42 = !DIEnumerator(name: "IPPROTO_MAX", value: 256, isUnsigned: true)
!43 = !{!44, !45, !46, !49}
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!45 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !47, line: 24, baseType: !48)
!47 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "")
!48 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!49 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!50 = !{!0, !51, !57, !65}
!51 = !DIGlobalVariableExpression(var: !52, expr: !DIExpression())
!52 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 100, type: !53, isLocal: false, isDefinition: true)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !54, size: 32, elements: !55)
!54 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!55 = !{!56}
!56 = !DISubrange(count: 4)
!57 = !DIGlobalVariableExpression(var: !58, expr: !DIExpression())
!58 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !59, line: 33, type: !60, isLocal: true, isDefinition: true)
!59 = !DIFile(filename: "../libbpf/src//build/usr/include/bpf/bpf_helper_defs.h", directory: "/home/saif/Desktop/xdp-tutorial/packet-solutions")
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DISubroutineType(types: !62)
!62 = !{!44, !44, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!65 = !DIGlobalVariableExpression(var: !66, expr: !DIExpression())
!66 = distinct !DIGlobalVariable(name: "bpf_xdp_adjust_head", scope: !2, file: !59, line: 1100, type: !67, isLocal: true, isDefinition: true)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DISubroutineType(types: !69)
!69 = !{!49, !70, !49}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 2856, size: 160, elements: !72)
!72 = !{!73, !75, !76, !77, !78}
!73 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !71, file: !6, line: 2857, baseType: !74, size: 32)
!74 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !47, line: 27, baseType: !7)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !71, file: !6, line: 2858, baseType: !74, size: 32, offset: 32)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !71, file: !6, line: 2859, baseType: !74, size: 32, offset: 64)
!77 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !71, file: !6, line: 2861, baseType: !74, size: 32, offset: 96)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !71, file: !6, line: 2862, baseType: !74, size: 32, offset: 128)
!79 = !DIFile(filename: "./../common/xdp_stats_kern.h", directory: "/home/saif/Desktop/xdp-tutorial/packet-solutions")
!80 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_map_def", file: !81, line: 33, size: 160, elements: !82)
!81 = !DIFile(filename: "../libbpf/src//build/usr/include/bpf/bpf_helpers.h", directory: "/home/saif/Desktop/xdp-tutorial/packet-solutions")
!82 = !{!83, !84, !85, !86, !87}
!83 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !80, file: !81, line: 34, baseType: !7, size: 32)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "key_size", scope: !80, file: !81, line: 35, baseType: !7, size: 32, offset: 32)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "value_size", scope: !80, file: !81, line: 36, baseType: !7, size: 32, offset: 64)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !80, file: !81, line: 37, baseType: !7, size: 32, offset: 96)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !80, file: !81, line: 38, baseType: !7, size: 32, offset: 128)
!88 = !{i32 7, !"Dwarf Version", i32 4}
!89 = !{i32 2, !"Debug Info Version", i32 3}
!90 = !{i32 1, !"wchar_size", i32 4}
!91 = !{!"clang version 10.0.0-4ubuntu1 "}
!92 = distinct !DISubprogram(name: "xdp_patch_ports_func", scope: !3, file: !3, line: 21, type: !93, scopeLine: 22, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !95)
!93 = !DISubroutineType(types: !94)
!94 = !{!49, !70}
!95 = !{!96, !97, !98, !99, !100, !114, !133, !165, !174, !196, !197, !198, !203}
!96 = !DILocalVariable(name: "ctx", arg: 1, scope: !92, file: !3, line: 21, type: !70)
!97 = !DILocalVariable(name: "action", scope: !92, file: !3, line: 23, type: !49)
!98 = !DILocalVariable(name: "eth_type", scope: !92, file: !3, line: 24, type: !49)
!99 = !DILocalVariable(name: "ip_type", scope: !92, file: !3, line: 24, type: !49)
!100 = !DILocalVariable(name: "eth", scope: !92, file: !3, line: 25, type: !101)
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64)
!102 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !103, line: 163, size: 112, elements: !104)
!103 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "")
!104 = !{!105, !110, !111}
!105 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !102, file: !103, line: 164, baseType: !106, size: 48)
!106 = !DICompositeType(tag: DW_TAG_array_type, baseType: !107, size: 48, elements: !108)
!107 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!108 = !{!109}
!109 = !DISubrange(count: 6)
!110 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !102, file: !103, line: 165, baseType: !106, size: 48, offset: 48)
!111 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !102, file: !103, line: 166, baseType: !112, size: 16, offset: 96)
!112 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !113, line: 25, baseType: !46)
!113 = !DIFile(filename: "/usr/include/linux/types.h", directory: "")
!114 = !DILocalVariable(name: "iphdr", scope: !92, file: !3, line: 26, type: !115)
!115 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !116, size: 64)
!116 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !117, line: 86, size: 160, elements: !118)
!117 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "")
!118 = !{!119, !121, !122, !123, !124, !125, !126, !127, !128, !130, !132}
!119 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !116, file: !117, line: 88, baseType: !120, size: 4, flags: DIFlagBitField, extraData: i64 0)
!120 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !47, line: 21, baseType: !107)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !116, file: !117, line: 89, baseType: !120, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !116, file: !117, line: 96, baseType: !120, size: 8, offset: 8)
!123 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !116, file: !117, line: 97, baseType: !112, size: 16, offset: 16)
!124 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !116, file: !117, line: 98, baseType: !112, size: 16, offset: 32)
!125 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !116, file: !117, line: 99, baseType: !112, size: 16, offset: 48)
!126 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !116, file: !117, line: 100, baseType: !120, size: 8, offset: 64)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !116, file: !117, line: 101, baseType: !120, size: 8, offset: 72)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !116, file: !117, line: 102, baseType: !129, size: 16, offset: 80)
!129 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !113, line: 31, baseType: !46)
!130 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !116, file: !117, line: 103, baseType: !131, size: 32, offset: 96)
!131 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !113, line: 27, baseType: !74)
!132 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !116, file: !117, line: 104, baseType: !131, size: 32, offset: 128)
!133 = !DILocalVariable(name: "ipv6hdr", scope: !92, file: !3, line: 27, type: !134)
!134 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !135, size: 64)
!135 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6hdr", file: !136, line: 116, size: 320, elements: !137)
!136 = !DIFile(filename: "/usr/include/linux/ipv6.h", directory: "")
!137 = !{!138, !139, !140, !144, !145, !146, !147, !164}
!138 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !135, file: !136, line: 118, baseType: !120, size: 4, flags: DIFlagBitField, extraData: i64 0)
!139 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !135, file: !136, line: 119, baseType: !120, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!140 = !DIDerivedType(tag: DW_TAG_member, name: "flow_lbl", scope: !135, file: !136, line: 126, baseType: !141, size: 24, offset: 8)
!141 = !DICompositeType(tag: DW_TAG_array_type, baseType: !120, size: 24, elements: !142)
!142 = !{!143}
!143 = !DISubrange(count: 3)
!144 = !DIDerivedType(tag: DW_TAG_member, name: "payload_len", scope: !135, file: !136, line: 128, baseType: !112, size: 16, offset: 32)
!145 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !135, file: !136, line: 129, baseType: !120, size: 8, offset: 48)
!146 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !135, file: !136, line: 130, baseType: !120, size: 8, offset: 56)
!147 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !135, file: !136, line: 132, baseType: !148, size: 128, offset: 64)
!148 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in6_addr", file: !149, line: 33, size: 128, elements: !150)
!149 = !DIFile(filename: "/usr/include/linux/in6.h", directory: "")
!150 = !{!151}
!151 = !DIDerivedType(tag: DW_TAG_member, name: "in6_u", scope: !148, file: !149, line: 40, baseType: !152, size: 128)
!152 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !148, file: !149, line: 34, size: 128, elements: !153)
!153 = !{!154, !158, !162}
!154 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr8", scope: !152, file: !149, line: 35, baseType: !155, size: 128)
!155 = !DICompositeType(tag: DW_TAG_array_type, baseType: !120, size: 128, elements: !156)
!156 = !{!157}
!157 = !DISubrange(count: 16)
!158 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr16", scope: !152, file: !149, line: 37, baseType: !159, size: 128)
!159 = !DICompositeType(tag: DW_TAG_array_type, baseType: !112, size: 128, elements: !160)
!160 = !{!161}
!161 = !DISubrange(count: 8)
!162 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr32", scope: !152, file: !149, line: 38, baseType: !163, size: 128)
!163 = !DICompositeType(tag: DW_TAG_array_type, baseType: !131, size: 128, elements: !55)
!164 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !135, file: !136, line: 133, baseType: !148, size: 128, offset: 192)
!165 = !DILocalVariable(name: "udphdr", scope: !92, file: !3, line: 28, type: !166)
!166 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !167, size: 64)
!167 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "udphdr", file: !168, line: 23, size: 64, elements: !169)
!168 = !DIFile(filename: "/usr/include/linux/udp.h", directory: "")
!169 = !{!170, !171, !172, !173}
!170 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !167, file: !168, line: 24, baseType: !112, size: 16)
!171 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !167, file: !168, line: 25, baseType: !112, size: 16, offset: 16)
!172 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !167, file: !168, line: 26, baseType: !112, size: 16, offset: 32)
!173 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !167, file: !168, line: 27, baseType: !129, size: 16, offset: 48)
!174 = !DILocalVariable(name: "tcphdr", scope: !92, file: !3, line: 29, type: !175)
!175 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !176, size: 64)
!176 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tcphdr", file: !177, line: 25, size: 160, elements: !178)
!177 = !DIFile(filename: "/usr/include/linux/tcp.h", directory: "")
!178 = !{!179, !180, !181, !182, !183, !184, !185, !186, !187, !188, !189, !190, !191, !192, !193, !194, !195}
!179 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !176, file: !177, line: 26, baseType: !112, size: 16)
!180 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !176, file: !177, line: 27, baseType: !112, size: 16, offset: 16)
!181 = !DIDerivedType(tag: DW_TAG_member, name: "seq", scope: !176, file: !177, line: 28, baseType: !131, size: 32, offset: 32)
!182 = !DIDerivedType(tag: DW_TAG_member, name: "ack_seq", scope: !176, file: !177, line: 29, baseType: !131, size: 32, offset: 64)
!183 = !DIDerivedType(tag: DW_TAG_member, name: "res1", scope: !176, file: !177, line: 31, baseType: !46, size: 4, offset: 96, flags: DIFlagBitField, extraData: i64 96)
!184 = !DIDerivedType(tag: DW_TAG_member, name: "doff", scope: !176, file: !177, line: 32, baseType: !46, size: 4, offset: 100, flags: DIFlagBitField, extraData: i64 96)
!185 = !DIDerivedType(tag: DW_TAG_member, name: "fin", scope: !176, file: !177, line: 33, baseType: !46, size: 1, offset: 104, flags: DIFlagBitField, extraData: i64 96)
!186 = !DIDerivedType(tag: DW_TAG_member, name: "syn", scope: !176, file: !177, line: 34, baseType: !46, size: 1, offset: 105, flags: DIFlagBitField, extraData: i64 96)
!187 = !DIDerivedType(tag: DW_TAG_member, name: "rst", scope: !176, file: !177, line: 35, baseType: !46, size: 1, offset: 106, flags: DIFlagBitField, extraData: i64 96)
!188 = !DIDerivedType(tag: DW_TAG_member, name: "psh", scope: !176, file: !177, line: 36, baseType: !46, size: 1, offset: 107, flags: DIFlagBitField, extraData: i64 96)
!189 = !DIDerivedType(tag: DW_TAG_member, name: "ack", scope: !176, file: !177, line: 37, baseType: !46, size: 1, offset: 108, flags: DIFlagBitField, extraData: i64 96)
!190 = !DIDerivedType(tag: DW_TAG_member, name: "urg", scope: !176, file: !177, line: 38, baseType: !46, size: 1, offset: 109, flags: DIFlagBitField, extraData: i64 96)
!191 = !DIDerivedType(tag: DW_TAG_member, name: "ece", scope: !176, file: !177, line: 39, baseType: !46, size: 1, offset: 110, flags: DIFlagBitField, extraData: i64 96)
!192 = !DIDerivedType(tag: DW_TAG_member, name: "cwr", scope: !176, file: !177, line: 40, baseType: !46, size: 1, offset: 111, flags: DIFlagBitField, extraData: i64 96)
!193 = !DIDerivedType(tag: DW_TAG_member, name: "window", scope: !176, file: !177, line: 55, baseType: !112, size: 16, offset: 112)
!194 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !176, file: !177, line: 56, baseType: !129, size: 16, offset: 128)
!195 = !DIDerivedType(tag: DW_TAG_member, name: "urg_ptr", scope: !176, file: !177, line: 57, baseType: !112, size: 16, offset: 144)
!196 = !DILocalVariable(name: "data_end", scope: !92, file: !3, line: 30, type: !44)
!197 = !DILocalVariable(name: "data", scope: !92, file: !3, line: 31, type: !44)
!198 = !DILocalVariable(name: "nh", scope: !92, file: !3, line: 32, type: !199)
!199 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !200, line: 33, size: 64, elements: !201)
!200 = !DIFile(filename: "./../common/parsing_helpers.h", directory: "/home/saif/Desktop/xdp-tutorial/packet-solutions")
!201 = !{!202}
!202 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !199, file: !200, line: 34, baseType: !44, size: 64)
!203 = !DILabel(scope: !92, name: "out", file: !3, line: 62)
!204 = !DILocation(line: 0, scope: !92)
!205 = !DILocation(line: 30, column: 38, scope: !92)
!206 = !{!207, !208, i64 4}
!207 = !{!"xdp_md", !208, i64 0, !208, i64 4, !208, i64 8, !208, i64 12, !208, i64 16}
!208 = !{!"int", !209, i64 0}
!209 = !{!"omnipotent char", !210, i64 0}
!210 = !{!"Simple C/C++ TBAA"}
!211 = !DILocation(line: 30, column: 27, scope: !92)
!212 = !DILocation(line: 30, column: 19, scope: !92)
!213 = !DILocation(line: 31, column: 34, scope: !92)
!214 = !{!207, !208, i64 0}
!215 = !DILocation(line: 31, column: 23, scope: !92)
!216 = !DILocation(line: 31, column: 15, scope: !92)
!217 = !DILocalVariable(name: "nh", arg: 1, scope: !218, file: !200, line: 124, type: !221)
!218 = distinct !DISubprogram(name: "parse_ethhdr", scope: !200, file: !200, line: 124, type: !219, scopeLine: 127, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !223)
!219 = !DISubroutineType(types: !220)
!220 = !{!49, !221, !44, !222}
!221 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !199, size: 64)
!222 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!223 = !{!217, !224, !225}
!224 = !DILocalVariable(name: "data_end", arg: 2, scope: !218, file: !200, line: 125, type: !44)
!225 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !218, file: !200, line: 126, type: !222)
!226 = !DILocation(line: 0, scope: !218, inlinedAt: !227)
!227 = distinct !DILocation(line: 34, column: 13, scope: !92)
!228 = !DILocalVariable(name: "nh", arg: 1, scope: !229, file: !200, line: 79, type: !221)
!229 = distinct !DISubprogram(name: "parse_ethhdr_vlan", scope: !200, file: !200, line: 79, type: !230, scopeLine: 83, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !239)
!230 = !DISubroutineType(types: !231)
!231 = !{!49, !221, !44, !222, !232}
!232 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !233, size: 64)
!233 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "collect_vlans", file: !200, line: 64, size: 32, elements: !234)
!234 = !{!235}
!235 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !233, file: !200, line: 65, baseType: !236, size: 32)
!236 = !DICompositeType(tag: DW_TAG_array_type, baseType: !46, size: 32, elements: !237)
!237 = !{!238}
!238 = !DISubrange(count: 2)
!239 = !{!228, !240, !241, !242, !243, !244, !245, !251, !252}
!240 = !DILocalVariable(name: "data_end", arg: 2, scope: !229, file: !200, line: 80, type: !44)
!241 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !229, file: !200, line: 81, type: !222)
!242 = !DILocalVariable(name: "vlans", arg: 4, scope: !229, file: !200, line: 82, type: !232)
!243 = !DILocalVariable(name: "eth", scope: !229, file: !200, line: 84, type: !101)
!244 = !DILocalVariable(name: "hdrsize", scope: !229, file: !200, line: 85, type: !49)
!245 = !DILocalVariable(name: "vlh", scope: !229, file: !200, line: 86, type: !246)
!246 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !247, size: 64)
!247 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlan_hdr", file: !200, line: 42, size: 32, elements: !248)
!248 = !{!249, !250}
!249 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !247, file: !200, line: 43, baseType: !112, size: 16)
!250 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !247, file: !200, line: 44, baseType: !112, size: 16, offset: 16)
!251 = !DILocalVariable(name: "h_proto", scope: !229, file: !200, line: 87, type: !46)
!252 = !DILocalVariable(name: "i", scope: !229, file: !200, line: 88, type: !49)
!253 = !DILocation(line: 0, scope: !229, inlinedAt: !254)
!254 = distinct !DILocation(line: 129, column: 9, scope: !218, inlinedAt: !227)
!255 = !DILocation(line: 93, column: 14, scope: !256, inlinedAt: !254)
!256 = distinct !DILexicalBlock(scope: !229, file: !200, line: 93, column: 6)
!257 = !DILocation(line: 93, column: 24, scope: !256, inlinedAt: !254)
!258 = !DILocation(line: 93, column: 6, scope: !229, inlinedAt: !254)
!259 = !DILocation(line: 99, column: 17, scope: !229, inlinedAt: !254)
!260 = !{!261, !261, i64 0}
!261 = !{!"short", !209, i64 0}
!262 = !DILocation(line: 0, scope: !263, inlinedAt: !254)
!263 = distinct !DILexicalBlock(scope: !264, file: !200, line: 109, column: 7)
!264 = distinct !DILexicalBlock(scope: !265, file: !200, line: 105, column: 39)
!265 = distinct !DILexicalBlock(scope: !266, file: !200, line: 105, column: 2)
!266 = distinct !DILexicalBlock(scope: !229, file: !200, line: 105, column: 2)
!267 = !DILocation(line: 105, column: 2, scope: !266, inlinedAt: !254)
!268 = !DILocation(line: 106, column: 7, scope: !264, inlinedAt: !254)
!269 = !DILocation(line: 109, column: 11, scope: !263, inlinedAt: !254)
!270 = !DILocation(line: 109, column: 15, scope: !263, inlinedAt: !254)
!271 = !DILocation(line: 109, column: 7, scope: !264, inlinedAt: !254)
!272 = !DILocation(line: 112, column: 18, scope: !264, inlinedAt: !254)
!273 = !DILocation(line: 40, column: 6, scope: !92)
!274 = !DILocalVariable(name: "nh", arg: 1, scope: !275, file: !200, line: 151, type: !221)
!275 = distinct !DISubprogram(name: "parse_iphdr", scope: !200, file: !200, line: 151, type: !276, scopeLine: 154, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !279)
!276 = !DISubroutineType(types: !277)
!277 = !{!49, !221, !44, !278}
!278 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !115, size: 64)
!279 = !{!274, !280, !281, !282, !283}
!280 = !DILocalVariable(name: "data_end", arg: 2, scope: !275, file: !200, line: 152, type: !44)
!281 = !DILocalVariable(name: "iphdr", arg: 3, scope: !275, file: !200, line: 153, type: !278)
!282 = !DILocalVariable(name: "iph", scope: !275, file: !200, line: 155, type: !115)
!283 = !DILocalVariable(name: "hdrsize", scope: !275, file: !200, line: 156, type: !49)
!284 = !DILocation(line: 0, scope: !275, inlinedAt: !285)
!285 = distinct !DILocation(line: 41, column: 13, scope: !286)
!286 = distinct !DILexicalBlock(scope: !287, file: !3, line: 40, column: 39)
!287 = distinct !DILexicalBlock(scope: !92, file: !3, line: 40, column: 6)
!288 = !DILocation(line: 158, column: 10, scope: !289, inlinedAt: !285)
!289 = distinct !DILexicalBlock(scope: !275, file: !200, line: 158, column: 6)
!290 = !DILocation(line: 158, column: 14, scope: !289, inlinedAt: !285)
!291 = !DILocation(line: 158, column: 6, scope: !275, inlinedAt: !285)
!292 = !DILocation(line: 161, column: 17, scope: !275, inlinedAt: !285)
!293 = !DILocation(line: 161, column: 21, scope: !275, inlinedAt: !285)
!294 = !DILocation(line: 163, column: 13, scope: !295, inlinedAt: !285)
!295 = distinct !DILexicalBlock(scope: !275, file: !200, line: 163, column: 5)
!296 = !DILocation(line: 163, column: 5, scope: !275, inlinedAt: !285)
!297 = !DILocation(line: 163, column: 5, scope: !295, inlinedAt: !285)
!298 = !DILocation(line: 167, column: 14, scope: !299, inlinedAt: !285)
!299 = distinct !DILexicalBlock(scope: !275, file: !200, line: 167, column: 6)
!300 = !DILocation(line: 167, column: 24, scope: !299, inlinedAt: !285)
!301 = !DILocation(line: 167, column: 6, scope: !275, inlinedAt: !285)
!302 = !DILocalVariable(name: "nh", arg: 1, scope: !303, file: !200, line: 132, type: !221)
!303 = distinct !DISubprogram(name: "parse_ip6hdr", scope: !200, file: !200, line: 132, type: !304, scopeLine: 135, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !307)
!304 = !DISubroutineType(types: !305)
!305 = !{!49, !221, !44, !306}
!306 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !134, size: 64)
!307 = !{!302, !308, !309, !310}
!308 = !DILocalVariable(name: "data_end", arg: 2, scope: !303, file: !200, line: 133, type: !44)
!309 = !DILocalVariable(name: "ip6hdr", arg: 3, scope: !303, file: !200, line: 134, type: !306)
!310 = !DILocalVariable(name: "ip6h", scope: !303, file: !200, line: 136, type: !134)
!311 = !DILocation(line: 0, scope: !303, inlinedAt: !312)
!312 = distinct !DILocation(line: 43, column: 13, scope: !313)
!313 = distinct !DILexicalBlock(scope: !314, file: !3, line: 42, column: 48)
!314 = distinct !DILexicalBlock(scope: !287, file: !3, line: 42, column: 13)
!315 = !DILocation(line: 142, column: 11, scope: !316, inlinedAt: !312)
!316 = distinct !DILexicalBlock(scope: !303, file: !200, line: 142, column: 6)
!317 = !DILocation(line: 142, column: 17, scope: !316, inlinedAt: !312)
!318 = !DILocation(line: 142, column: 15, scope: !316, inlinedAt: !312)
!319 = !DILocation(line: 142, column: 6, scope: !303, inlinedAt: !312)
!320 = !DILocation(line: 32, column: 25, scope: !92)
!321 = !DILocation(line: 0, scope: !287)
!322 = !{!209, !209, i64 0}
!323 = !DILocation(line: 48, column: 6, scope: !92)
!324 = !DILocalVariable(name: "nh", arg: 1, scope: !325, file: !200, line: 224, type: !221)
!325 = distinct !DISubprogram(name: "parse_udphdr", scope: !200, file: !200, line: 224, type: !326, scopeLine: 227, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !329)
!326 = !DISubroutineType(types: !327)
!327 = !{!49, !221, !44, !328}
!328 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !166, size: 64)
!329 = !{!324, !330, !331, !332, !333}
!330 = !DILocalVariable(name: "data_end", arg: 2, scope: !325, file: !200, line: 225, type: !44)
!331 = !DILocalVariable(name: "udphdr", arg: 3, scope: !325, file: !200, line: 226, type: !328)
!332 = !DILocalVariable(name: "len", scope: !325, file: !200, line: 228, type: !49)
!333 = !DILocalVariable(name: "h", scope: !325, file: !200, line: 229, type: !166)
!334 = !DILocation(line: 0, scope: !325, inlinedAt: !335)
!335 = distinct !DILocation(line: 49, column: 7, scope: !336)
!336 = distinct !DILexicalBlock(scope: !337, file: !3, line: 49, column: 7)
!337 = distinct !DILexicalBlock(scope: !338, file: !3, line: 48, column: 30)
!338 = distinct !DILexicalBlock(scope: !92, file: !3, line: 48, column: 6)
!339 = !DILocation(line: 231, column: 8, scope: !340, inlinedAt: !335)
!340 = distinct !DILexicalBlock(scope: !325, file: !200, line: 231, column: 6)
!341 = !DILocation(line: 231, column: 14, scope: !340, inlinedAt: !335)
!342 = !DILocation(line: 231, column: 12, scope: !340, inlinedAt: !335)
!343 = !DILocation(line: 231, column: 6, scope: !325, inlinedAt: !335)
!344 = !DILocation(line: 237, column: 8, scope: !325, inlinedAt: !335)
!345 = !{!346, !261, i64 4}
!346 = !{!"udphdr", !261, i64 0, !261, i64 2, !261, i64 4, !261, i64 6}
!347 = !DILocation(line: 238, column: 10, scope: !348, inlinedAt: !335)
!348 = distinct !DILexicalBlock(scope: !325, file: !200, line: 238, column: 6)
!349 = !DILocation(line: 238, column: 6, scope: !325, inlinedAt: !335)
!350 = !DILocation(line: 53, column: 18, scope: !337)
!351 = !{!346, !261, i64 2}
!352 = !DILocation(line: 53, column: 16, scope: !337)
!353 = !DILocation(line: 54, column: 2, scope: !337)
!354 = !DILocalVariable(name: "nh", arg: 1, scope: !355, file: !200, line: 247, type: !221)
!355 = distinct !DISubprogram(name: "parse_tcphdr", scope: !200, file: !200, line: 247, type: !356, scopeLine: 250, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !359)
!356 = !DISubroutineType(types: !357)
!357 = !{!49, !221, !44, !358}
!358 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !175, size: 64)
!359 = !{!354, !360, !361, !362, !363}
!360 = !DILocalVariable(name: "data_end", arg: 2, scope: !355, file: !200, line: 248, type: !44)
!361 = !DILocalVariable(name: "tcphdr", arg: 3, scope: !355, file: !200, line: 249, type: !358)
!362 = !DILocalVariable(name: "len", scope: !355, file: !200, line: 251, type: !49)
!363 = !DILocalVariable(name: "h", scope: !355, file: !200, line: 252, type: !175)
!364 = !DILocation(line: 0, scope: !355, inlinedAt: !365)
!365 = distinct !DILocation(line: 55, column: 7, scope: !366)
!366 = distinct !DILexicalBlock(scope: !367, file: !3, line: 55, column: 7)
!367 = distinct !DILexicalBlock(scope: !368, file: !3, line: 54, column: 37)
!368 = distinct !DILexicalBlock(scope: !338, file: !3, line: 54, column: 13)
!369 = !DILocation(line: 254, column: 8, scope: !370, inlinedAt: !365)
!370 = distinct !DILexicalBlock(scope: !355, file: !200, line: 254, column: 6)
!371 = !DILocation(line: 254, column: 12, scope: !370, inlinedAt: !365)
!372 = !DILocation(line: 254, column: 6, scope: !355, inlinedAt: !365)
!373 = !DILocation(line: 257, column: 11, scope: !355, inlinedAt: !365)
!374 = !DILocation(line: 257, column: 16, scope: !355, inlinedAt: !365)
!375 = !DILocation(line: 259, column: 9, scope: !376, inlinedAt: !365)
!376 = distinct !DILexicalBlock(scope: !355, file: !200, line: 259, column: 5)
!377 = !DILocation(line: 259, column: 5, scope: !355, inlinedAt: !365)
!378 = !DILocation(line: 259, column: 5, scope: !376, inlinedAt: !365)
!379 = !DILocation(line: 263, column: 14, scope: !380, inlinedAt: !365)
!380 = distinct !DILexicalBlock(scope: !355, file: !200, line: 263, column: 6)
!381 = !DILocation(line: 263, column: 20, scope: !380, inlinedAt: !365)
!382 = !DILocation(line: 263, column: 6, scope: !355, inlinedAt: !365)
!383 = !DILocation(line: 59, column: 18, scope: !367)
!384 = !{!385, !261, i64 2}
!385 = !{!"tcphdr", !261, i64 0, !261, i64 2, !208, i64 4, !208, i64 8, !261, i64 12, !261, i64 12, !261, i64 13, !261, i64 13, !261, i64 13, !261, i64 13, !261, i64 13, !261, i64 13, !261, i64 13, !261, i64 13, !261, i64 14, !261, i64 16, !261, i64 18}
!386 = !DILocation(line: 59, column: 16, scope: !367)
!387 = !DILocation(line: 60, column: 2, scope: !367)
!388 = !DILocation(line: 62, column: 1, scope: !92)
!389 = !DILocation(line: 0, scope: !390, inlinedAt: !405)
!390 = distinct !DISubprogram(name: "xdp_stats_record_action", scope: !79, file: !79, line: 24, type: !391, scopeLine: 25, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !393)
!391 = !DISubroutineType(types: !392)
!392 = !{!74, !70, !74}
!393 = !{!394, !395, !396}
!394 = !DILocalVariable(name: "ctx", arg: 1, scope: !390, file: !79, line: 24, type: !70)
!395 = !DILocalVariable(name: "action", arg: 2, scope: !390, file: !79, line: 24, type: !74)
!396 = !DILocalVariable(name: "rec", scope: !390, file: !79, line: 30, type: !397)
!397 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !398, size: 64)
!398 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "datarec", file: !399, line: 10, size: 128, elements: !400)
!399 = !DIFile(filename: "./../common/xdp_stats_kern_user.h", directory: "/home/saif/Desktop/xdp-tutorial/packet-solutions")
!400 = !{!401, !404}
!401 = !DIDerivedType(tag: DW_TAG_member, name: "rx_packets", scope: !398, file: !399, line: 11, baseType: !402, size: 64)
!402 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !47, line: 31, baseType: !403)
!403 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!404 = !DIDerivedType(tag: DW_TAG_member, name: "rx_bytes", scope: !398, file: !399, line: 12, baseType: !402, size: 64, offset: 64)
!405 = distinct !DILocation(line: 63, column: 9, scope: !92)
!406 = !{!208, !208, i64 0}
!407 = !DILocation(line: 30, column: 24, scope: !390, inlinedAt: !405)
!408 = !DILocation(line: 31, column: 7, scope: !409, inlinedAt: !405)
!409 = distinct !DILexicalBlock(scope: !390, file: !79, line: 31, column: 6)
!410 = !DILocation(line: 31, column: 6, scope: !390, inlinedAt: !405)
!411 = !DILocation(line: 38, column: 7, scope: !390, inlinedAt: !405)
!412 = !DILocation(line: 38, column: 17, scope: !390, inlinedAt: !405)
!413 = !{!414, !415, i64 0}
!414 = !{!"datarec", !415, i64 0, !415, i64 8}
!415 = !{!"long long", !209, i64 0}
!416 = !DILocation(line: 39, column: 25, scope: !390, inlinedAt: !405)
!417 = !DILocation(line: 39, column: 41, scope: !390, inlinedAt: !405)
!418 = !DILocation(line: 39, column: 34, scope: !390, inlinedAt: !405)
!419 = !DILocation(line: 39, column: 19, scope: !390, inlinedAt: !405)
!420 = !DILocation(line: 39, column: 7, scope: !390, inlinedAt: !405)
!421 = !DILocation(line: 39, column: 16, scope: !390, inlinedAt: !405)
!422 = !{!414, !415, i64 8}
!423 = !DILocation(line: 41, column: 9, scope: !390, inlinedAt: !405)
!424 = !DILocation(line: 41, column: 2, scope: !390, inlinedAt: !405)
!425 = !DILocation(line: 42, column: 1, scope: !390, inlinedAt: !405)
!426 = !DILocation(line: 63, column: 2, scope: !92)
!427 = distinct !DISubprogram(name: "xdp_vlan_swap_func", scope: !3, file: !3, line: 71, type: !93, scopeLine: 72, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !428)
!428 = !{!429, !430, !431, !432, !433, !434}
!429 = !DILocalVariable(name: "ctx", arg: 1, scope: !427, file: !3, line: 71, type: !70)
!430 = !DILocalVariable(name: "data_end", scope: !427, file: !3, line: 73, type: !44)
!431 = !DILocalVariable(name: "data", scope: !427, file: !3, line: 74, type: !44)
!432 = !DILocalVariable(name: "nh", scope: !427, file: !3, line: 77, type: !199)
!433 = !DILocalVariable(name: "nh_type", scope: !427, file: !3, line: 78, type: !49)
!434 = !DILocalVariable(name: "eth", scope: !427, file: !3, line: 81, type: !101)
!435 = !DILocalVariable(name: "eth_cpy", scope: !436, file: !437, line: 25, type: !102)
!436 = distinct !DISubprogram(name: "vlan_tag_pop", scope: !437, file: !437, line: 22, type: !438, scopeLine: 23, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !440)
!437 = !DIFile(filename: "./../common/rewrite_helpers.h", directory: "/home/saif/Desktop/xdp-tutorial/packet-solutions")
!438 = !DISubroutineType(types: !439)
!439 = !{!49, !70, !101}
!440 = !{!441, !442, !443, !435, !444, !445, !446}
!441 = !DILocalVariable(name: "ctx", arg: 1, scope: !436, file: !437, line: 22, type: !70)
!442 = !DILocalVariable(name: "eth", arg: 2, scope: !436, file: !437, line: 22, type: !101)
!443 = !DILocalVariable(name: "data_end", scope: !436, file: !437, line: 24, type: !44)
!444 = !DILocalVariable(name: "vlh", scope: !436, file: !437, line: 26, type: !246)
!445 = !DILocalVariable(name: "h_proto", scope: !436, file: !437, line: 27, type: !112)
!446 = !DILocalVariable(name: "vlid", scope: !436, file: !437, line: 28, type: !49)
!447 = !DILocation(line: 25, column: 16, scope: !436, inlinedAt: !448)
!448 = distinct !DILocation(line: 87, column: 3, scope: !449)
!449 = distinct !DILexicalBlock(scope: !427, file: !3, line: 86, column: 6)
!450 = !DILocalVariable(name: "eth_cpy", scope: !451, file: !437, line: 73, type: !102)
!451 = distinct !DISubprogram(name: "vlan_tag_push", scope: !437, file: !437, line: 69, type: !452, scopeLine: 71, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !454)
!452 = !DISubroutineType(types: !453)
!453 = !{!49, !70, !101, !49}
!454 = !{!455, !456, !457, !458, !450, !459}
!455 = !DILocalVariable(name: "ctx", arg: 1, scope: !451, file: !437, line: 69, type: !70)
!456 = !DILocalVariable(name: "eth", arg: 2, scope: !451, file: !437, line: 70, type: !101)
!457 = !DILocalVariable(name: "vlid", arg: 3, scope: !451, file: !437, line: 70, type: !49)
!458 = !DILocalVariable(name: "data_end", scope: !451, file: !437, line: 72, type: !44)
!459 = !DILocalVariable(name: "vlh", scope: !451, file: !437, line: 74, type: !246)
!460 = !DILocation(line: 73, column: 16, scope: !451, inlinedAt: !461)
!461 = distinct !DILocation(line: 89, column: 3, scope: !449)
!462 = !DILocation(line: 0, scope: !427)
!463 = !DILocation(line: 73, column: 38, scope: !427)
!464 = !DILocation(line: 73, column: 27, scope: !427)
!465 = !DILocation(line: 73, column: 19, scope: !427)
!466 = !DILocation(line: 74, column: 34, scope: !427)
!467 = !DILocation(line: 74, column: 23, scope: !427)
!468 = !DILocation(line: 74, column: 15, scope: !427)
!469 = !DILocation(line: 0, scope: !218, inlinedAt: !470)
!470 = distinct !DILocation(line: 82, column: 12, scope: !427)
!471 = !DILocation(line: 0, scope: !229, inlinedAt: !472)
!472 = distinct !DILocation(line: 129, column: 9, scope: !218, inlinedAt: !470)
!473 = !DILocation(line: 93, column: 14, scope: !256, inlinedAt: !472)
!474 = !DILocation(line: 93, column: 24, scope: !256, inlinedAt: !472)
!475 = !DILocation(line: 93, column: 6, scope: !229, inlinedAt: !472)
!476 = !DILocation(line: 97, column: 10, scope: !229, inlinedAt: !472)
!477 = !DILocation(line: 86, column: 25, scope: !449)
!478 = !{!479, !261, i64 12}
!479 = !{!"ethhdr", !209, i64 0, !209, i64 6, !261, i64 12}
!480 = !DILocation(line: 86, column: 6, scope: !427)
!481 = !DILocation(line: 0, scope: !436, inlinedAt: !448)
!482 = !DILocation(line: 25, column: 2, scope: !436, inlinedAt: !448)
!483 = !DILocation(line: 30, column: 6, scope: !436, inlinedAt: !448)
!484 = !DILocation(line: 37, column: 10, scope: !485, inlinedAt: !448)
!485 = distinct !DILexicalBlock(scope: !436, file: !437, line: 37, column: 6)
!486 = !DILocation(line: 37, column: 16, scope: !485, inlinedAt: !448)
!487 = !DILocation(line: 37, column: 14, scope: !485, inlinedAt: !448)
!488 = !DILocation(line: 37, column: 6, scope: !436, inlinedAt: !448)
!489 = !DILocation(line: 42, column: 17, scope: !436, inlinedAt: !448)
!490 = !{!491, !261, i64 2}
!491 = !{!"vlan_hdr", !261, i64 0, !261, i64 2}
!492 = !DILocation(line: 45, column: 2, scope: !436, inlinedAt: !448)
!493 = !DILocation(line: 48, column: 6, scope: !494, inlinedAt: !448)
!494 = distinct !DILexicalBlock(scope: !436, file: !437, line: 48, column: 6)
!495 = !DILocation(line: 48, column: 6, scope: !436, inlinedAt: !448)
!496 = !DILocation(line: 54, column: 27, scope: !436, inlinedAt: !448)
!497 = !DILocation(line: 54, column: 16, scope: !436, inlinedAt: !448)
!498 = !DILocation(line: 54, column: 8, scope: !436, inlinedAt: !448)
!499 = !DILocation(line: 55, column: 32, scope: !436, inlinedAt: !448)
!500 = !DILocation(line: 55, column: 21, scope: !436, inlinedAt: !448)
!501 = !DILocation(line: 56, column: 10, scope: !502, inlinedAt: !448)
!502 = distinct !DILexicalBlock(scope: !436, file: !437, line: 56, column: 6)
!503 = !DILocation(line: 56, column: 16, scope: !502, inlinedAt: !448)
!504 = !DILocation(line: 56, column: 14, scope: !502, inlinedAt: !448)
!505 = !DILocation(line: 56, column: 6, scope: !436, inlinedAt: !448)
!506 = !DILocation(line: 60, column: 2, scope: !436, inlinedAt: !448)
!507 = !DILocation(line: 61, column: 7, scope: !436, inlinedAt: !448)
!508 = !DILocation(line: 61, column: 15, scope: !436, inlinedAt: !448)
!509 = !DILocation(line: 63, column: 2, scope: !436, inlinedAt: !448)
!510 = !DILocation(line: 64, column: 1, scope: !436, inlinedAt: !448)
!511 = !DILocation(line: 87, column: 3, scope: !449)
!512 = !DILocation(line: 0, scope: !451, inlinedAt: !461)
!513 = !DILocation(line: 73, column: 2, scope: !451, inlinedAt: !461)
!514 = !DILocation(line: 77, column: 2, scope: !451, inlinedAt: !461)
!515 = !DILocation(line: 80, column: 6, scope: !516, inlinedAt: !461)
!516 = distinct !DILexicalBlock(scope: !451, file: !437, line: 80, column: 6)
!517 = !DILocation(line: 80, column: 6, scope: !451, inlinedAt: !461)
!518 = !DILocation(line: 87, column: 32, scope: !451, inlinedAt: !461)
!519 = !DILocation(line: 87, column: 21, scope: !451, inlinedAt: !461)
!520 = !DILocation(line: 88, column: 27, scope: !451, inlinedAt: !461)
!521 = !DILocation(line: 88, column: 16, scope: !451, inlinedAt: !461)
!522 = !DILocation(line: 88, column: 8, scope: !451, inlinedAt: !461)
!523 = !DILocation(line: 90, column: 10, scope: !524, inlinedAt: !461)
!524 = distinct !DILexicalBlock(scope: !451, file: !437, line: 90, column: 6)
!525 = !DILocation(line: 90, column: 16, scope: !524, inlinedAt: !461)
!526 = !DILocation(line: 90, column: 14, scope: !524, inlinedAt: !461)
!527 = !DILocation(line: 90, column: 6, scope: !451, inlinedAt: !461)
!528 = !DILocation(line: 96, column: 2, scope: !451, inlinedAt: !461)
!529 = !DILocation(line: 100, column: 10, scope: !530, inlinedAt: !461)
!530 = distinct !DILexicalBlock(scope: !451, file: !437, line: 100, column: 6)
!531 = !DILocation(line: 100, column: 16, scope: !530, inlinedAt: !461)
!532 = !DILocation(line: 100, column: 14, scope: !530, inlinedAt: !461)
!533 = !DILocation(line: 100, column: 6, scope: !451, inlinedAt: !461)
!534 = !DILocation(line: 103, column: 7, scope: !451, inlinedAt: !461)
!535 = !DILocation(line: 103, column: 18, scope: !451, inlinedAt: !461)
!536 = !{!491, !261, i64 0}
!537 = !DILocation(line: 104, column: 40, scope: !451, inlinedAt: !461)
!538 = !DILocation(line: 104, column: 7, scope: !451, inlinedAt: !461)
!539 = !DILocation(line: 104, column: 33, scope: !451, inlinedAt: !461)
!540 = !DILocation(line: 106, column: 15, scope: !451, inlinedAt: !461)
!541 = !DILocation(line: 107, column: 2, scope: !451, inlinedAt: !461)
!542 = !DILocation(line: 108, column: 1, scope: !451, inlinedAt: !461)
!543 = !DILocation(line: 92, column: 1, scope: !427)
!544 = distinct !DISubprogram(name: "xdp_pass_func", scope: !3, file: !3, line: 95, type: !93, scopeLine: 96, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !545)
!545 = !{!546}
!546 = !DILocalVariable(name: "ctx", arg: 1, scope: !544, file: !3, line: 95, type: !70)
!547 = !DILocation(line: 0, scope: !544)
!548 = !DILocation(line: 97, column: 2, scope: !544)
