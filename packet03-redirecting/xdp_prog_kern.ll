; ModuleID = 'xdp_prog_kern.c'
source_filename = "xdp_prog_kern.c"
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
%struct.icmphdr_common = type { i8, i8, i16 }
%struct.bpf_fib_lookup = type { i8, i8, i16, i16, i16, i32, %union.anon.0, %union.anon.1, %union.anon.2, i16, i16, [6 x i8], [6 x i8] }
%union.anon.0 = type { i32 }
%union.anon.1 = type { [4 x i32] }
%union.anon.2 = type { [4 x i32] }

@xdp_stats_map = dso_local global %struct.bpf_map_def { i32 6, i32 4, i32 16, i32 5, i32 0 }, section "maps", align 4, !dbg !0
@tx_port = dso_local global %struct.bpf_map_def { i32 14, i32 4, i32 4, i32 256, i32 0 }, section "maps", align 4, !dbg !50
@redirect_params = dso_local global %struct.bpf_map_def { i32 1, i32 6, i32 6, i32 1, i32 0 }, section "maps", align 4, !dbg !60
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !62
@llvm.used = appending global [9 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.bpf_map_def* @redirect_params to i8*), i8* bitcast (%struct.bpf_map_def* @tx_port to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_icmp_echo_func to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_pass_func to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_redirect_func to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_redirect_map_func to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_router_func to i8*), i8* bitcast (%struct.bpf_map_def* @xdp_stats_map to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_icmp_echo_func(%struct.xdp_md* nocapture readonly %0) #0 section "xdp_icmp_echo" !dbg !133 {
  %2 = alloca i32, align 4
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !145, metadata !DIExpression()), !dbg !224
  %3 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !225
  %4 = load i32, i32* %3, align 4, !dbg !225, !tbaa !226
  %5 = zext i32 %4 to i64, !dbg !231
  %6 = inttoptr i64 %5 to i8*, !dbg !232
  call void @llvm.dbg.value(metadata i8* %6, metadata !146, metadata !DIExpression()), !dbg !224
  %7 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !233
  %8 = load i32, i32* %7, align 4, !dbg !233, !tbaa !234
  %9 = zext i32 %8 to i64, !dbg !235
  %10 = inttoptr i64 %9 to i8*, !dbg !236
  call void @llvm.dbg.value(metadata i8* %10, metadata !147, metadata !DIExpression()), !dbg !224
  call void @llvm.dbg.value(metadata i32 2, metadata !222, metadata !DIExpression()), !dbg !224
  call void @llvm.dbg.value(metadata i8* %10, metadata !148, metadata !DIExpression()), !dbg !224
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !153, metadata !DIExpression(DW_OP_deref)), !dbg !224
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !237, metadata !DIExpression()), !dbg !246
  call void @llvm.dbg.value(metadata i8* %6, metadata !244, metadata !DIExpression()), !dbg !246
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !245, metadata !DIExpression()), !dbg !246
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !248, metadata !DIExpression()), !dbg !273
  call void @llvm.dbg.value(metadata i8* %6, metadata !260, metadata !DIExpression()), !dbg !273
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !261, metadata !DIExpression()), !dbg !273
  call void @llvm.dbg.value(metadata %struct.collect_vlans* null, metadata !262, metadata !DIExpression()), !dbg !273
  call void @llvm.dbg.value(metadata i8* %10, metadata !263, metadata !DIExpression()), !dbg !273
  call void @llvm.dbg.value(metadata i32 14, metadata !264, metadata !DIExpression()), !dbg !273
  %11 = getelementptr i8, i8* %10, i64 14, !dbg !275
  %12 = icmp ugt i8* %11, %6, !dbg !277
  br i1 %12, label %79, label %13, !dbg !278

13:                                               ; preds = %1
  call void @llvm.dbg.value(metadata i8* %10, metadata !263, metadata !DIExpression()), !dbg !273
  call void @llvm.dbg.value(metadata i8* %11, metadata !148, metadata !DIExpression()), !dbg !224
  call void @llvm.dbg.value(metadata i8* %11, metadata !265, metadata !DIExpression()), !dbg !273
  %14 = getelementptr inbounds i8, i8* %10, i64 12, !dbg !279
  %15 = bitcast i8* %14 to i16*, !dbg !279
  call void @llvm.dbg.value(metadata i16 undef, metadata !271, metadata !DIExpression()), !dbg !273
  call void @llvm.dbg.value(metadata i32 0, metadata !272, metadata !DIExpression()), !dbg !273
  %16 = load i16, i16* %15, align 1, !dbg !273, !tbaa !280
  call void @llvm.dbg.value(metadata i16 %16, metadata !271, metadata !DIExpression()), !dbg !273
  %17 = inttoptr i64 %5 to %struct.vlan_hdr*, !dbg !282
  %18 = getelementptr i8, i8* %10, i64 22, !dbg !287
  %19 = bitcast i8* %18 to %struct.vlan_hdr*, !dbg !287
  switch i16 %16, label %34 [
    i16 -22392, label %20
    i16 129, label %20
  ], !dbg !288

20:                                               ; preds = %13, %13
  %21 = getelementptr i8, i8* %10, i64 18, !dbg !289
  %22 = bitcast i8* %21 to %struct.vlan_hdr*, !dbg !289
  %23 = icmp ugt %struct.vlan_hdr* %22, %17, !dbg !290
  br i1 %23, label %34, label %24, !dbg !291

24:                                               ; preds = %20
  call void @llvm.dbg.value(metadata i16 undef, metadata !271, metadata !DIExpression()), !dbg !273
  %25 = getelementptr i8, i8* %10, i64 16, !dbg !292
  %26 = bitcast i8* %25 to i16*, !dbg !292
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %22, metadata !265, metadata !DIExpression()), !dbg !273
  call void @llvm.dbg.value(metadata i32 1, metadata !272, metadata !DIExpression()), !dbg !273
  %27 = load i16, i16* %26, align 1, !dbg !273, !tbaa !280
  call void @llvm.dbg.value(metadata i16 %27, metadata !271, metadata !DIExpression()), !dbg !273
  switch i16 %27, label %34 [
    i16 -22392, label %28
    i16 129, label %28
  ], !dbg !288

28:                                               ; preds = %24, %24
  %29 = icmp ugt %struct.vlan_hdr* %19, %17, !dbg !290
  br i1 %29, label %34, label %30, !dbg !291

30:                                               ; preds = %28
  call void @llvm.dbg.value(metadata i16 undef, metadata !271, metadata !DIExpression()), !dbg !273
  %31 = getelementptr i8, i8* %10, i64 20, !dbg !292
  %32 = bitcast i8* %31 to i16*, !dbg !292
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %19, metadata !265, metadata !DIExpression()), !dbg !273
  call void @llvm.dbg.value(metadata i32 2, metadata !272, metadata !DIExpression()), !dbg !273
  %33 = load i16, i16* %32, align 1, !dbg !273, !tbaa !280
  call void @llvm.dbg.value(metadata i16 %33, metadata !271, metadata !DIExpression()), !dbg !273
  br label %34

34:                                               ; preds = %13, %20, %24, %28, %30
  %35 = phi i8* [ %11, %13 ], [ %11, %20 ], [ %21, %24 ], [ %21, %28 ], [ %18, %30 ], !dbg !273
  %36 = phi i16 [ %16, %13 ], [ %16, %20 ], [ %27, %24 ], [ %27, %28 ], [ %33, %30 ], !dbg !273
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* undef, metadata !265, metadata !DIExpression()), !dbg !273
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* undef, metadata !265, metadata !DIExpression()), !dbg !273
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* undef, metadata !265, metadata !DIExpression()), !dbg !273
  call void @llvm.dbg.value(metadata i8* %35, metadata !148, metadata !DIExpression()), !dbg !224
  call void @llvm.dbg.value(metadata i8* %35, metadata !148, metadata !DIExpression()), !dbg !224
  call void @llvm.dbg.value(metadata i16 %36, metadata !162, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_signed, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_stack_value)), !dbg !224
  switch i16 %36, label %79 [
    i16 8, label %37
    i16 -8826, label %53
  ], !dbg !293

37:                                               ; preds = %34
  call void @llvm.dbg.value(metadata %struct.iphdr** undef, metadata !165, metadata !DIExpression(DW_OP_deref)), !dbg !224
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !294, metadata !DIExpression()), !dbg !304
  call void @llvm.dbg.value(metadata i8* %6, metadata !300, metadata !DIExpression()), !dbg !304
  call void @llvm.dbg.value(metadata %struct.iphdr** undef, metadata !301, metadata !DIExpression()), !dbg !304
  call void @llvm.dbg.value(metadata i8* %35, metadata !302, metadata !DIExpression()), !dbg !304
  %38 = getelementptr inbounds i8, i8* %35, i64 20, !dbg !308
  %39 = icmp ugt i8* %38, %6, !dbg !310
  br i1 %39, label %79, label %40, !dbg !311

40:                                               ; preds = %37
  %41 = load i8, i8* %35, align 4, !dbg !312
  %42 = shl i8 %41, 2, !dbg !313
  %43 = and i8 %42, 60, !dbg !313
  call void @llvm.dbg.value(metadata i8 %43, metadata !303, metadata !DIExpression()), !dbg !304
  %44 = icmp ult i8 %43, 20, !dbg !314
  br i1 %44, label %79, label %45, !dbg !316

45:                                               ; preds = %40
  %46 = zext i8 %43 to i64, !dbg !317
  call void @llvm.dbg.value(metadata i64 %46, metadata !303, metadata !DIExpression()), !dbg !304
  %47 = getelementptr i8, i8* %35, i64 %46, !dbg !318
  %48 = icmp ugt i8* %47, %6, !dbg !320
  br i1 %48, label %79, label %49, !dbg !321

49:                                               ; preds = %45
  call void @llvm.dbg.value(metadata i8* %47, metadata !148, metadata !DIExpression()), !dbg !224
  %50 = getelementptr inbounds i8, i8* %35, i64 9, !dbg !322
  %51 = load i8, i8* %50, align 1, !dbg !322, !tbaa !323
  call void @llvm.dbg.value(metadata i8* %47, metadata !148, metadata !DIExpression()), !dbg !224
  call void @llvm.dbg.value(metadata i8 %51, metadata !163, metadata !DIExpression()), !dbg !224
  %52 = icmp eq i8 %51, 1, !dbg !325
  br i1 %52, label %62, label %79, !dbg !327

53:                                               ; preds = %34
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !328, metadata !DIExpression()), !dbg !337
  call void @llvm.dbg.value(metadata i8* %6, metadata !334, metadata !DIExpression()), !dbg !337
  call void @llvm.dbg.value(metadata i8* %35, metadata !336, metadata !DIExpression()), !dbg !337
  %54 = getelementptr inbounds i8, i8* %35, i64 40, !dbg !341
  %55 = bitcast i8* %54 to %struct.ipv6hdr*, !dbg !341
  %56 = inttoptr i64 %5 to %struct.ipv6hdr*, !dbg !343
  %57 = icmp ugt %struct.ipv6hdr* %55, %56, !dbg !344
  br i1 %57, label %79, label %58, !dbg !345

58:                                               ; preds = %53
  call void @llvm.dbg.value(metadata i8* %35, metadata !336, metadata !DIExpression()), !dbg !337
  call void @llvm.dbg.value(metadata i8* %54, metadata !148, metadata !DIExpression()), !dbg !224
  %59 = getelementptr inbounds i8, i8* %35, i64 6, !dbg !346
  %60 = load i8, i8* %59, align 2, !dbg !346, !tbaa !347
  call void @llvm.dbg.value(metadata i8* %54, metadata !148, metadata !DIExpression()), !dbg !224
  call void @llvm.dbg.value(metadata i8 %60, metadata !163, metadata !DIExpression()), !dbg !224
  %61 = icmp eq i8 %60, 58, !dbg !350
  br i1 %61, label %62, label %79, !dbg !352

62:                                               ; preds = %49, %58
  %63 = phi i1 [ true, %49 ], [ false, %58 ]
  %64 = phi i32 [ 8, %49 ], [ 56710, %58 ]
  %65 = phi i8* [ %47, %49 ], [ %54, %58 ], !dbg !353
  call void @llvm.dbg.value(metadata i8* %65, metadata !148, metadata !DIExpression()), !dbg !224
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !354, metadata !DIExpression()), !dbg !363
  call void @llvm.dbg.value(metadata i8* %6, metadata !360, metadata !DIExpression()), !dbg !363
  call void @llvm.dbg.value(metadata i8* %65, metadata !362, metadata !DIExpression()), !dbg !363
  %66 = getelementptr inbounds i8, i8* %65, i64 4, !dbg !365
  %67 = bitcast i8* %66 to %struct.icmphdr_common*, !dbg !365
  %68 = inttoptr i64 %5 to %struct.icmphdr_common*, !dbg !367
  %69 = icmp ugt %struct.icmphdr_common* %67, %68, !dbg !368
  br i1 %69, label %79, label %70, !dbg !369

70:                                               ; preds = %62
  call void @llvm.dbg.value(metadata i8* %65, metadata !362, metadata !DIExpression()), !dbg !363
  call void @llvm.dbg.value(metadata %struct.icmphdr_common* %67, metadata !148, metadata !DIExpression()), !dbg !224
  %71 = load i8, i8* %65, align 2, !dbg !370, !tbaa !371
  call void @llvm.dbg.value(metadata i8 %71, metadata !164, metadata !DIExpression()), !dbg !224
  %72 = icmp eq i8 %71, 8, !dbg !373
  %73 = and i1 %63, %72, !dbg !375
  br i1 %73, label %78, label %74, !dbg !375

74:                                               ; preds = %70
  call void @llvm.dbg.value(metadata i8 %71, metadata !164, metadata !DIExpression()), !dbg !224
  %75 = icmp eq i32 %64, 56710, !dbg !376
  %76 = icmp eq i8 %71, -128, !dbg !378
  %77 = and i1 %75, %76, !dbg !379
  br i1 %77, label %78, label %79, !dbg !379

78:                                               ; preds = %74, %70
  call void @llvm.dbg.value(metadata %struct.ethhdr* undef, metadata !153, metadata !DIExpression()), !dbg !224
  call void @llvm.dbg.value(metadata i32 3, metadata !222, metadata !DIExpression()), !dbg !224
  br label %79, !dbg !380

79:                                               ; preds = %34, %62, %53, %45, %40, %37, %1, %49, %58, %74, %78
  %80 = phi i32 [ 2, %49 ], [ 3, %78 ], [ 2, %74 ], [ 2, %58 ], [ 2, %1 ], [ 2, %37 ], [ 2, %40 ], [ 2, %45 ], [ 2, %53 ], [ 2, %62 ], [ 2, %34 ], !dbg !224
  call void @llvm.dbg.value(metadata i32 %80, metadata !222, metadata !DIExpression()), !dbg !224
  call void @llvm.dbg.label(metadata !223), !dbg !381
  %81 = bitcast i32* %2 to i8*, !dbg !382
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %81), !dbg !382
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !387, metadata !DIExpression()) #4, !dbg !382
  call void @llvm.dbg.value(metadata i32 %80, metadata !388, metadata !DIExpression()) #4, !dbg !382
  store i32 %80, i32* %2, align 4, !tbaa !397
  call void @llvm.dbg.value(metadata i32* %2, metadata !388, metadata !DIExpression(DW_OP_deref)) #4, !dbg !382
  %82 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @xdp_stats_map to i8*), i8* nonnull %81) #4, !dbg !398
  call void @llvm.dbg.value(metadata i8* %82, metadata !389, metadata !DIExpression()) #4, !dbg !382
  %83 = icmp eq i8* %82, null, !dbg !399
  br i1 %83, label %97, label %84, !dbg !401

84:                                               ; preds = %79
  call void @llvm.dbg.value(metadata i8* %82, metadata !389, metadata !DIExpression()) #4, !dbg !382
  %85 = bitcast i8* %82 to i64*, !dbg !402
  %86 = load i64, i64* %85, align 8, !dbg !403, !tbaa !404
  %87 = add i64 %86, 1, !dbg !403
  store i64 %87, i64* %85, align 8, !dbg !403, !tbaa !404
  %88 = load i32, i32* %3, align 4, !dbg !407, !tbaa !226
  %89 = load i32, i32* %7, align 4, !dbg !408, !tbaa !234
  %90 = sub i32 %88, %89, !dbg !409
  %91 = zext i32 %90 to i64, !dbg !410
  %92 = getelementptr inbounds i8, i8* %82, i64 8, !dbg !411
  %93 = bitcast i8* %92 to i64*, !dbg !411
  %94 = load i64, i64* %93, align 8, !dbg !412, !tbaa !413
  %95 = add i64 %94, %91, !dbg !412
  store i64 %95, i64* %93, align 8, !dbg !412, !tbaa !413
  %96 = load i32, i32* %2, align 4, !dbg !414, !tbaa !397
  call void @llvm.dbg.value(metadata i32 %96, metadata !388, metadata !DIExpression()) #4, !dbg !382
  br label %97, !dbg !415

97:                                               ; preds = %79, %84
  %98 = phi i32 [ %96, %84 ], [ 0, %79 ], !dbg !382
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %81), !dbg !416
  ret i32 %98, !dbg !417
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind
define dso_local i32 @xdp_redirect_func(%struct.xdp_md* nocapture readonly %0) #0 section "xdp_redirect" !dbg !418 {
  %2 = alloca i32, align 4
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !420, metadata !DIExpression()), !dbg !428
  call void @llvm.dbg.value(metadata i32 undef, metadata !421, metadata !DIExpression()), !dbg !428
  call void @llvm.dbg.value(metadata i32 undef, metadata !422, metadata !DIExpression()), !dbg !428
  call void @llvm.dbg.value(metadata i32 2, metadata !426, metadata !DIExpression()), !dbg !428
  call void @llvm.dbg.value(metadata i32 undef, metadata !423, metadata !DIExpression()), !dbg !428
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !424, metadata !DIExpression(DW_OP_deref)), !dbg !428
  call void @llvm.dbg.label(metadata !427), !dbg !429
  %3 = bitcast i32* %2 to i8*, !dbg !430
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %3), !dbg !430
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !387, metadata !DIExpression()) #4, !dbg !430
  call void @llvm.dbg.value(metadata i32 2, metadata !388, metadata !DIExpression()) #4, !dbg !430
  store i32 2, i32* %2, align 4, !tbaa !397
  call void @llvm.dbg.value(metadata i32* %2, metadata !388, metadata !DIExpression(DW_OP_deref)) #4, !dbg !430
  %4 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @xdp_stats_map to i8*), i8* nonnull %3) #4, !dbg !432
  call void @llvm.dbg.value(metadata i8* %4, metadata !389, metadata !DIExpression()) #4, !dbg !430
  %5 = icmp eq i8* %4, null, !dbg !433
  br i1 %5, label %21, label %6, !dbg !434

6:                                                ; preds = %1
  %7 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !435
  %8 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !436
  call void @llvm.dbg.value(metadata i8* %4, metadata !389, metadata !DIExpression()) #4, !dbg !430
  %9 = bitcast i8* %4 to i64*, !dbg !437
  %10 = load i64, i64* %9, align 8, !dbg !438, !tbaa !404
  %11 = add i64 %10, 1, !dbg !438
  store i64 %11, i64* %9, align 8, !dbg !438, !tbaa !404
  %12 = load i32, i32* %8, align 4, !dbg !439, !tbaa !226
  %13 = load i32, i32* %7, align 4, !dbg !440, !tbaa !234
  %14 = sub i32 %12, %13, !dbg !441
  %15 = zext i32 %14 to i64, !dbg !442
  %16 = getelementptr inbounds i8, i8* %4, i64 8, !dbg !443
  %17 = bitcast i8* %16 to i64*, !dbg !443
  %18 = load i64, i64* %17, align 8, !dbg !444, !tbaa !413
  %19 = add i64 %18, %15, !dbg !444
  store i64 %19, i64* %17, align 8, !dbg !444, !tbaa !413
  %20 = load i32, i32* %2, align 4, !dbg !445, !tbaa !397
  call void @llvm.dbg.value(metadata i32 %20, metadata !388, metadata !DIExpression()) #4, !dbg !430
  br label %21, !dbg !446

21:                                               ; preds = %1, %6
  %22 = phi i32 [ %20, %6 ], [ 0, %1 ], !dbg !430
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %3), !dbg !447
  ret i32 %22, !dbg !448
}

; Function Attrs: nounwind
define dso_local i32 @xdp_redirect_map_func(%struct.xdp_md* nocapture readonly %0) #0 section "xdp_redirect_map" !dbg !449 {
  %2 = alloca i32, align 4
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !451, metadata !DIExpression()), !dbg !461
  %3 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !462
  %4 = load i32, i32* %3, align 4, !dbg !462, !tbaa !226
  %5 = zext i32 %4 to i64, !dbg !463
  %6 = inttoptr i64 %5 to i8*, !dbg !464
  call void @llvm.dbg.value(metadata i8* %6, metadata !452, metadata !DIExpression()), !dbg !461
  %7 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !465
  %8 = load i32, i32* %7, align 4, !dbg !465, !tbaa !234
  %9 = zext i32 %8 to i64, !dbg !466
  %10 = inttoptr i64 %9 to i8*, !dbg !467
  call void @llvm.dbg.value(metadata i8* %10, metadata !453, metadata !DIExpression()), !dbg !461
  call void @llvm.dbg.value(metadata i32 2, metadata !457, metadata !DIExpression()), !dbg !461
  call void @llvm.dbg.value(metadata i8* %10, metadata !454, metadata !DIExpression()), !dbg !461
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !237, metadata !DIExpression()), !dbg !468
  call void @llvm.dbg.value(metadata i8* %6, metadata !244, metadata !DIExpression()), !dbg !468
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !248, metadata !DIExpression()), !dbg !470
  call void @llvm.dbg.value(metadata i8* %6, metadata !260, metadata !DIExpression()), !dbg !470
  call void @llvm.dbg.value(metadata %struct.collect_vlans* null, metadata !262, metadata !DIExpression()), !dbg !470
  call void @llvm.dbg.value(metadata i8* %10, metadata !263, metadata !DIExpression()), !dbg !470
  call void @llvm.dbg.value(metadata i32 14, metadata !264, metadata !DIExpression()), !dbg !470
  %11 = getelementptr i8, i8* %10, i64 14, !dbg !472
  %12 = icmp ugt i8* %11, %6, !dbg !473
  br i1 %12, label %18, label %13, !dbg !474

13:                                               ; preds = %1
  call void @llvm.dbg.value(metadata i8* %10, metadata !263, metadata !DIExpression()), !dbg !470
  call void @llvm.dbg.value(metadata i8* %11, metadata !454, metadata !DIExpression()), !dbg !461
  %14 = inttoptr i64 %9 to %struct.ethhdr*, !dbg !475
  call void @llvm.dbg.value(metadata i8* %11, metadata !265, metadata !DIExpression()), !dbg !470
  call void @llvm.dbg.value(metadata i16 undef, metadata !271, metadata !DIExpression()), !dbg !470
  call void @llvm.dbg.value(metadata i32 0, metadata !272, metadata !DIExpression()), !dbg !470
  call void @llvm.dbg.value(metadata i16 undef, metadata !271, metadata !DIExpression()), !dbg !470
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* undef, metadata !265, metadata !DIExpression()), !dbg !470
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* undef, metadata !454, metadata !DIExpression()), !dbg !461
  call void @llvm.dbg.value(metadata i16 undef, metadata !456, metadata !DIExpression()), !dbg !461
  call void @llvm.dbg.value(metadata %struct.ethhdr* %14, metadata !455, metadata !DIExpression()), !dbg !461
  %15 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %14, i64 0, i32 1, i64 0, !dbg !476
  %16 = tail call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @redirect_params to i8*), i8* nonnull %15) #4, !dbg !477
  call void @llvm.dbg.value(metadata i8* %16, metadata !458, metadata !DIExpression()), !dbg !461
  %17 = icmp eq i8* %16, null, !dbg !478
  br i1 %17, label %18, label %20, !dbg !480

18:                                               ; preds = %13, %1
  call void @llvm.dbg.value(metadata i32 %22, metadata !457, metadata !DIExpression()), !dbg !461
  call void @llvm.dbg.label(metadata !460), !dbg !481
  %19 = bitcast i32* %2 to i8*, !dbg !482
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %19), !dbg !482
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !387, metadata !DIExpression()) #4, !dbg !482
  call void @llvm.dbg.value(metadata i32 %22, metadata !388, metadata !DIExpression()) #4, !dbg !482
  store i32 2, i32* %2, align 4, !tbaa !397
  br label %25, !dbg !484

20:                                               ; preds = %13
  call void @llvm.dbg.value(metadata %struct.ethhdr* %14, metadata !455, metadata !DIExpression()), !dbg !461
  %21 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %14, i64 0, i32 0, i64 0, !dbg !485
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(6) %21, i8* nonnull align 1 dereferenceable(6) %16, i64 6, i1 false), !dbg !485
  %22 = tail call i32 inttoptr (i64 51 to i32 (i8*, i32, i64)*)(i8* bitcast (%struct.bpf_map_def* @tx_port to i8*), i32 0, i64 0) #4, !dbg !486
  call void @llvm.dbg.value(metadata i32 %22, metadata !457, metadata !DIExpression()), !dbg !461
  call void @llvm.dbg.value(metadata i32 %22, metadata !457, metadata !DIExpression()), !dbg !461
  call void @llvm.dbg.label(metadata !460), !dbg !481
  %23 = bitcast i32* %2 to i8*, !dbg !482
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %23), !dbg !482
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !387, metadata !DIExpression()) #4, !dbg !482
  call void @llvm.dbg.value(metadata i32 %22, metadata !388, metadata !DIExpression()) #4, !dbg !482
  store i32 %22, i32* %2, align 4, !tbaa !397
  %24 = icmp ugt i32 %22, 4, !dbg !487
  br i1 %24, label %42, label %25, !dbg !484

25:                                               ; preds = %18, %20
  %26 = phi i8* [ %19, %18 ], [ %23, %20 ]
  call void @llvm.dbg.value(metadata i32* %2, metadata !388, metadata !DIExpression(DW_OP_deref)) #4, !dbg !482
  %27 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @xdp_stats_map to i8*), i8* nonnull %26) #4, !dbg !489
  call void @llvm.dbg.value(metadata i8* %27, metadata !389, metadata !DIExpression()) #4, !dbg !482
  %28 = icmp eq i8* %27, null, !dbg !490
  br i1 %28, label %42, label %29, !dbg !491

29:                                               ; preds = %25
  call void @llvm.dbg.value(metadata i8* %27, metadata !389, metadata !DIExpression()) #4, !dbg !482
  %30 = bitcast i8* %27 to i64*, !dbg !492
  %31 = load i64, i64* %30, align 8, !dbg !493, !tbaa !404
  %32 = add i64 %31, 1, !dbg !493
  store i64 %32, i64* %30, align 8, !dbg !493, !tbaa !404
  %33 = load i32, i32* %3, align 4, !dbg !494, !tbaa !226
  %34 = load i32, i32* %7, align 4, !dbg !495, !tbaa !234
  %35 = sub i32 %33, %34, !dbg !496
  %36 = zext i32 %35 to i64, !dbg !497
  %37 = getelementptr inbounds i8, i8* %27, i64 8, !dbg !498
  %38 = bitcast i8* %37 to i64*, !dbg !498
  %39 = load i64, i64* %38, align 8, !dbg !499, !tbaa !413
  %40 = add i64 %39, %36, !dbg !499
  store i64 %40, i64* %38, align 8, !dbg !499, !tbaa !413
  %41 = load i32, i32* %2, align 4, !dbg !500, !tbaa !397
  call void @llvm.dbg.value(metadata i32 %41, metadata !388, metadata !DIExpression()) #4, !dbg !482
  br label %42, !dbg !501

42:                                               ; preds = %20, %25, %29
  %43 = phi i8* [ %23, %20 ], [ %26, %29 ], [ %26, %25 ]
  %44 = phi i32 [ 0, %20 ], [ %41, %29 ], [ 0, %25 ], !dbg !482
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %43), !dbg !502
  ret i32 %44, !dbg !503
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
define dso_local i32 @xdp_router_func(%struct.xdp_md* %0) #0 section "xdp_router" !dbg !504 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.bpf_fib_lookup, align 4
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !506, metadata !DIExpression()), !dbg !518
  %4 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !519
  %5 = load i32, i32* %4, align 4, !dbg !519, !tbaa !226
  %6 = zext i32 %5 to i64, !dbg !520
  %7 = inttoptr i64 %6 to i8*, !dbg !521
  call void @llvm.dbg.value(metadata i8* %7, metadata !507, metadata !DIExpression()), !dbg !518
  %8 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !522
  %9 = load i32, i32* %8, align 4, !dbg !522, !tbaa !234
  %10 = zext i32 %9 to i64, !dbg !523
  %11 = inttoptr i64 %10 to i8*, !dbg !524
  call void @llvm.dbg.value(metadata i8* %11, metadata !508, metadata !DIExpression()), !dbg !518
  %12 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %3, i64 0, i32 0, !dbg !525
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %12) #4, !dbg !525
  call void @llvm.dbg.declare(metadata %struct.bpf_fib_lookup* %3, metadata !509, metadata !DIExpression()), !dbg !526
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(64) %12, i8 0, i64 64, i1 false), !dbg !526
  call void @llvm.dbg.value(metadata i8* %11, metadata !510, metadata !DIExpression()), !dbg !518
  call void @llvm.dbg.value(metadata i32 2, metadata !516, metadata !DIExpression()), !dbg !518
  call void @llvm.dbg.value(metadata i64 14, metadata !514, metadata !DIExpression()), !dbg !518
  %13 = getelementptr i8, i8* %11, i64 14, !dbg !527
  %14 = icmp ugt i8* %13, %7, !dbg !529
  br i1 %14, label %62, label %15, !dbg !530

15:                                               ; preds = %1
  %16 = inttoptr i64 %10 to %struct.ethhdr*, !dbg !531
  call void @llvm.dbg.value(metadata %struct.ethhdr* %16, metadata !510, metadata !DIExpression()), !dbg !518
  %17 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %16, i64 0, i32 2, !dbg !532
  %18 = load i16, i16* %17, align 1, !dbg !532, !tbaa !533
  call void @llvm.dbg.value(metadata i16 %18, metadata !513, metadata !DIExpression()), !dbg !518
  %19 = icmp eq i16 %18, 8, !dbg !535
  br i1 %19, label %20, label %30, !dbg !537

20:                                               ; preds = %15
  call void @llvm.dbg.value(metadata i8* %13, metadata !512, metadata !DIExpression()), !dbg !518
  %21 = getelementptr i8, i8* %11, i64 34, !dbg !538
  %22 = bitcast i8* %21 to %struct.iphdr*, !dbg !538
  %23 = inttoptr i64 %6 to %struct.iphdr*, !dbg !541
  %24 = icmp ugt %struct.iphdr* %22, %23, !dbg !542
  br i1 %24, label %62, label %25, !dbg !543

25:                                               ; preds = %20
  %26 = bitcast i8* %13 to %struct.iphdr*, !dbg !544
  call void @llvm.dbg.value(metadata %struct.iphdr* %26, metadata !512, metadata !DIExpression()), !dbg !518
  %27 = getelementptr i8, i8* %11, i64 22, !dbg !545
  %28 = load i8, i8* %27, align 4, !dbg !545, !tbaa !547
  %29 = icmp ult i8 %28, 2, !dbg !548
  br i1 %29, label %62, label %42, !dbg !549

30:                                               ; preds = %15
  %31 = icmp eq i16 %18, -8826, !dbg !550
  br i1 %31, label %32, label %62, !dbg !552

32:                                               ; preds = %30
  call void @llvm.dbg.value(metadata i8* %13, metadata !511, metadata !DIExpression()), !dbg !518
  %33 = getelementptr i8, i8* %11, i64 54, !dbg !553
  %34 = bitcast i8* %33 to %struct.ipv6hdr*, !dbg !553
  %35 = inttoptr i64 %6 to %struct.ipv6hdr*, !dbg !556
  %36 = icmp ugt %struct.ipv6hdr* %34, %35, !dbg !557
  br i1 %36, label %62, label %37, !dbg !558

37:                                               ; preds = %32
  %38 = bitcast i8* %13 to %struct.ipv6hdr*, !dbg !559
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %38, metadata !511, metadata !DIExpression()), !dbg !518
  %39 = getelementptr i8, i8* %11, i64 21, !dbg !560
  %40 = load i8, i8* %39, align 1, !dbg !560, !tbaa !562
  %41 = icmp ult i8 %40, 2, !dbg !563
  br i1 %41, label %62, label %42, !dbg !564

42:                                               ; preds = %37, %25
  %43 = phi %struct.iphdr* [ %26, %25 ], [ undef, %37 ]
  %44 = phi %struct.ipv6hdr* [ undef, %25 ], [ %38, %37 ]
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %44, metadata !511, metadata !DIExpression()), !dbg !518
  call void @llvm.dbg.value(metadata %struct.iphdr* %43, metadata !512, metadata !DIExpression()), !dbg !518
  %45 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 3, !dbg !565
  %46 = load i32, i32* %45, align 4, !dbg !565, !tbaa !566
  %47 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %3, i64 0, i32 5, !dbg !567
  store i32 %46, i32* %47, align 4, !dbg !568, !tbaa !569
  %48 = bitcast %struct.xdp_md* %0 to i8*, !dbg !571
  %49 = call i32 inttoptr (i64 69 to i32 (i8*, %struct.bpf_fib_lookup*, i32, i32)*)(i8* %48, %struct.bpf_fib_lookup* nonnull %3, i32 64, i32 0) #4, !dbg !572
  call void @llvm.dbg.value(metadata i32 %49, metadata !515, metadata !DIExpression()), !dbg !518
  switch i32 %49, label %62 [
    i32 0, label %50
    i32 1, label %61
    i32 2, label %61
    i32 3, label %61
  ], !dbg !573

50:                                               ; preds = %42
  br i1 %19, label %51, label %55, !dbg !574

51:                                               ; preds = %50
  call void @llvm.dbg.value(metadata %struct.iphdr* %43, metadata !576, metadata !DIExpression()), !dbg !581
  %52 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %43, i64 0, i32 5, !dbg !584
  %53 = load i8, i8* %52, align 4, !dbg !585, !tbaa !547
  %54 = add i8 %53, -1, !dbg !585
  store i8 %54, i8* %52, align 4, !dbg !585, !tbaa !547
  br label %62, !dbg !586

55:                                               ; preds = %50
  %56 = icmp eq i16 %18, -8826, !dbg !587
  br i1 %56, label %57, label %62, !dbg !589

57:                                               ; preds = %55
  %58 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %44, i64 0, i32 4, !dbg !590
  %59 = load i8, i8* %58, align 1, !dbg !591, !tbaa !562
  %60 = add i8 %59, -1, !dbg !591
  store i8 %60, i8* %58, align 1, !dbg !591, !tbaa !562
  br label %62, !dbg !592

61:                                               ; preds = %42, %42, %42
  call void @llvm.dbg.value(metadata i32 1, metadata !516, metadata !DIExpression()), !dbg !518
  br label %62, !dbg !593

62:                                               ; preds = %32, %20, %1, %61, %42, %55, %57, %51, %30, %37, %25
  %63 = phi i32 [ 2, %25 ], [ 2, %42 ], [ 1, %61 ], [ 2, %51 ], [ 2, %57 ], [ 2, %55 ], [ 2, %37 ], [ 2, %30 ], [ 1, %1 ], [ 1, %20 ], [ 1, %32 ], !dbg !518
  call void @llvm.dbg.value(metadata i32 %63, metadata !516, metadata !DIExpression()), !dbg !518
  call void @llvm.dbg.label(metadata !517), !dbg !594
  %64 = bitcast i32* %2 to i8*, !dbg !595
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %64), !dbg !595
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !387, metadata !DIExpression()) #4, !dbg !595
  call void @llvm.dbg.value(metadata i32 %63, metadata !388, metadata !DIExpression()) #4, !dbg !595
  store i32 %63, i32* %2, align 4, !tbaa !397
  call void @llvm.dbg.value(metadata i32* %2, metadata !388, metadata !DIExpression(DW_OP_deref)) #4, !dbg !595
  %65 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @xdp_stats_map to i8*), i8* nonnull %64) #4, !dbg !597
  call void @llvm.dbg.value(metadata i8* %65, metadata !389, metadata !DIExpression()) #4, !dbg !595
  %66 = icmp eq i8* %65, null, !dbg !598
  br i1 %66, label %80, label %67, !dbg !599

67:                                               ; preds = %62
  call void @llvm.dbg.value(metadata i8* %65, metadata !389, metadata !DIExpression()) #4, !dbg !595
  %68 = bitcast i8* %65 to i64*, !dbg !600
  %69 = load i64, i64* %68, align 8, !dbg !601, !tbaa !404
  %70 = add i64 %69, 1, !dbg !601
  store i64 %70, i64* %68, align 8, !dbg !601, !tbaa !404
  %71 = load i32, i32* %4, align 4, !dbg !602, !tbaa !226
  %72 = load i32, i32* %8, align 4, !dbg !603, !tbaa !234
  %73 = sub i32 %71, %72, !dbg !604
  %74 = zext i32 %73 to i64, !dbg !605
  %75 = getelementptr inbounds i8, i8* %65, i64 8, !dbg !606
  %76 = bitcast i8* %75 to i64*, !dbg !606
  %77 = load i64, i64* %76, align 8, !dbg !607, !tbaa !413
  %78 = add i64 %77, %74, !dbg !607
  store i64 %78, i64* %76, align 8, !dbg !607, !tbaa !413
  %79 = load i32, i32* %2, align 4, !dbg !608, !tbaa !397
  call void @llvm.dbg.value(metadata i32 %79, metadata !388, metadata !DIExpression()) #4, !dbg !595
  br label %80, !dbg !609

80:                                               ; preds = %62, %67
  %81 = phi i32 [ %79, %67 ], [ 0, %62 ], !dbg !595
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %64), !dbg !610
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %12) #4, !dbg !611
  ret i32 %81, !dbg !612
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: norecurse nounwind readnone
define dso_local i32 @xdp_pass_func(%struct.xdp_md* nocapture readnone %0) #3 section "xdp_pass" !dbg !613 {
  call void @llvm.dbg.value(metadata %struct.xdp_md* undef, metadata !615, metadata !DIExpression()), !dbg !616
  ret i32 2, !dbg !617
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { norecurse nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!129, !130, !131}
!llvm.ident = !{!132}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "xdp_stats_map", scope: !2, file: !128, line: 16, type: !52, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !43, globals: !49, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "xdp_prog_kern.c", directory: "/home/saif/Desktop/xdp-tutorial/packet03-redirecting")
!4 = !{!5, !14}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 2845, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "../headers/linux/bpf.h", directory: "/home/saif/Desktop/xdp-tutorial/packet03-redirecting")
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
!43 = !{!44, !45, !46}
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!45 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !47, line: 24, baseType: !48)
!47 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "")
!48 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!49 = !{!0, !50, !60, !62, !68, !76, !85}
!50 = !DIGlobalVariableExpression(var: !51, expr: !DIExpression())
!51 = distinct !DIGlobalVariable(name: "tx_port", scope: !2, file: !3, line: 18, type: !52, isLocal: false, isDefinition: true)
!52 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_map_def", file: !53, line: 33, size: 160, elements: !54)
!53 = !DIFile(filename: "../libbpf/src//build/usr/include/bpf/bpf_helpers.h", directory: "/home/saif/Desktop/xdp-tutorial/packet03-redirecting")
!54 = !{!55, !56, !57, !58, !59}
!55 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !52, file: !53, line: 34, baseType: !7, size: 32)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "key_size", scope: !52, file: !53, line: 35, baseType: !7, size: 32, offset: 32)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "value_size", scope: !52, file: !53, line: 36, baseType: !7, size: 32, offset: 64)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !52, file: !53, line: 37, baseType: !7, size: 32, offset: 96)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !52, file: !53, line: 38, baseType: !7, size: 32, offset: 128)
!60 = !DIGlobalVariableExpression(var: !61, expr: !DIExpression())
!61 = distinct !DIGlobalVariable(name: "redirect_params", scope: !2, file: !3, line: 25, type: !52, isLocal: false, isDefinition: true)
!62 = !DIGlobalVariableExpression(var: !63, expr: !DIExpression())
!63 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 274, type: !64, isLocal: false, isDefinition: true)
!64 = !DICompositeType(tag: DW_TAG_array_type, baseType: !65, size: 32, elements: !66)
!65 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!66 = !{!67}
!67 = !DISubrange(count: 4)
!68 = !DIGlobalVariableExpression(var: !69, expr: !DIExpression())
!69 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !70, line: 33, type: !71, isLocal: true, isDefinition: true)
!70 = !DIFile(filename: "../libbpf/src//build/usr/include/bpf/bpf_helper_defs.h", directory: "/home/saif/Desktop/xdp-tutorial/packet03-redirecting")
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DISubroutineType(types: !73)
!73 = !{!44, !44, !74}
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!76 = !DIGlobalVariableExpression(var: !77, expr: !DIExpression())
!77 = distinct !DIGlobalVariable(name: "bpf_redirect_map", scope: !2, file: !70, line: 1254, type: !78, isLocal: true, isDefinition: true)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DISubroutineType(types: !80)
!80 = !{!81, !44, !82, !83}
!81 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!82 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !47, line: 27, baseType: !7)
!83 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !47, line: 31, baseType: !84)
!84 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!85 = !DIGlobalVariableExpression(var: !86, expr: !DIExpression())
!86 = distinct !DIGlobalVariable(name: "bpf_fib_lookup", scope: !2, file: !70, line: 1764, type: !87, isLocal: true, isDefinition: true)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DISubroutineType(types: !89)
!89 = !{!81, !44, !90, !81, !82}
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_fib_lookup", file: !6, line: 3179, size: 512, elements: !92)
!92 = !{!93, !96, !97, !100, !101, !102, !103, !110, !116, !121, !122, !123, !127}
!93 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !91, file: !6, line: 3183, baseType: !94, size: 8)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !47, line: 21, baseType: !95)
!95 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "l4_protocol", scope: !91, file: !6, line: 3186, baseType: !94, size: 8, offset: 8)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "sport", scope: !91, file: !6, line: 3187, baseType: !98, size: 16, offset: 16)
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !99, line: 25, baseType: !46)
!99 = !DIFile(filename: "/usr/include/linux/types.h", directory: "")
!100 = !DIDerivedType(tag: DW_TAG_member, name: "dport", scope: !91, file: !6, line: 3188, baseType: !98, size: 16, offset: 32)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !91, file: !6, line: 3191, baseType: !46, size: 16, offset: 48)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !91, file: !6, line: 3196, baseType: !82, size: 32, offset: 64)
!103 = !DIDerivedType(tag: DW_TAG_member, scope: !91, file: !6, line: 3198, baseType: !104, size: 32, offset: 96)
!104 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !91, file: !6, line: 3198, size: 32, elements: !105)
!105 = !{!106, !107, !109}
!106 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !104, file: !6, line: 3200, baseType: !94, size: 8)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "flowinfo", scope: !104, file: !6, line: 3201, baseType: !108, size: 32)
!108 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !99, line: 27, baseType: !82)
!109 = !DIDerivedType(tag: DW_TAG_member, name: "rt_metric", scope: !104, file: !6, line: 3204, baseType: !82, size: 32)
!110 = !DIDerivedType(tag: DW_TAG_member, scope: !91, file: !6, line: 3207, baseType: !111, size: 128, offset: 128)
!111 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !91, file: !6, line: 3207, size: 128, elements: !112)
!112 = !{!113, !114}
!113 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_src", scope: !111, file: !6, line: 3208, baseType: !108, size: 32)
!114 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_src", scope: !111, file: !6, line: 3209, baseType: !115, size: 128)
!115 = !DICompositeType(tag: DW_TAG_array_type, baseType: !82, size: 128, elements: !66)
!116 = !DIDerivedType(tag: DW_TAG_member, scope: !91, file: !6, line: 3216, baseType: !117, size: 128, offset: 256)
!117 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !91, file: !6, line: 3216, size: 128, elements: !118)
!118 = !{!119, !120}
!119 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_dst", scope: !117, file: !6, line: 3217, baseType: !108, size: 32)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_dst", scope: !117, file: !6, line: 3218, baseType: !115, size: 128)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_proto", scope: !91, file: !6, line: 3222, baseType: !98, size: 16, offset: 384)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !91, file: !6, line: 3223, baseType: !98, size: 16, offset: 400)
!123 = !DIDerivedType(tag: DW_TAG_member, name: "smac", scope: !91, file: !6, line: 3224, baseType: !124, size: 48, offset: 416)
!124 = !DICompositeType(tag: DW_TAG_array_type, baseType: !94, size: 48, elements: !125)
!125 = !{!126}
!126 = !DISubrange(count: 6)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "dmac", scope: !91, file: !6, line: 3225, baseType: !124, size: 48, offset: 464)
!128 = !DIFile(filename: "./../common/xdp_stats_kern.h", directory: "/home/saif/Desktop/xdp-tutorial/packet03-redirecting")
!129 = !{i32 7, !"Dwarf Version", i32 4}
!130 = !{i32 2, !"Debug Info Version", i32 3}
!131 = !{i32 1, !"wchar_size", i32 4}
!132 = !{!"clang version 10.0.0-4ubuntu1 "}
!133 = distinct !DISubprogram(name: "xdp_icmp_echo_func", scope: !3, file: !3, line: 49, type: !134, scopeLine: 50, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !144)
!134 = !DISubroutineType(types: !135)
!135 = !{!81, !136}
!136 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !137, size: 64)
!137 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 2856, size: 160, elements: !138)
!138 = !{!139, !140, !141, !142, !143}
!139 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !137, file: !6, line: 2857, baseType: !82, size: 32)
!140 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !137, file: !6, line: 2858, baseType: !82, size: 32, offset: 32)
!141 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !137, file: !6, line: 2859, baseType: !82, size: 32, offset: 64)
!142 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !137, file: !6, line: 2861, baseType: !82, size: 32, offset: 96)
!143 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !137, file: !6, line: 2862, baseType: !82, size: 32, offset: 128)
!144 = !{!145, !146, !147, !148, !153, !162, !163, !164, !165, !182, !214, !215, !222, !223}
!145 = !DILocalVariable(name: "ctx", arg: 1, scope: !133, file: !3, line: 49, type: !136)
!146 = !DILocalVariable(name: "data_end", scope: !133, file: !3, line: 51, type: !44)
!147 = !DILocalVariable(name: "data", scope: !133, file: !3, line: 52, type: !44)
!148 = !DILocalVariable(name: "nh", scope: !133, file: !3, line: 53, type: !149)
!149 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !150, line: 33, size: 64, elements: !151)
!150 = !DIFile(filename: "./../common/parsing_helpers.h", directory: "/home/saif/Desktop/xdp-tutorial/packet03-redirecting")
!151 = !{!152}
!152 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !149, file: !150, line: 34, baseType: !44, size: 64)
!153 = !DILocalVariable(name: "eth", scope: !133, file: !3, line: 54, type: !154)
!154 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !155, size: 64)
!155 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !156, line: 163, size: 112, elements: !157)
!156 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "")
!157 = !{!158, !160, !161}
!158 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !155, file: !156, line: 164, baseType: !159, size: 48)
!159 = !DICompositeType(tag: DW_TAG_array_type, baseType: !95, size: 48, elements: !125)
!160 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !155, file: !156, line: 165, baseType: !159, size: 48, offset: 48)
!161 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !155, file: !156, line: 166, baseType: !98, size: 16, offset: 96)
!162 = !DILocalVariable(name: "eth_type", scope: !133, file: !3, line: 55, type: !81)
!163 = !DILocalVariable(name: "ip_type", scope: !133, file: !3, line: 56, type: !81)
!164 = !DILocalVariable(name: "icmp_type", scope: !133, file: !3, line: 57, type: !81)
!165 = !DILocalVariable(name: "iphdr", scope: !133, file: !3, line: 58, type: !166)
!166 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !167, size: 64)
!167 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !168, line: 86, size: 160, elements: !169)
!168 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "")
!169 = !{!170, !171, !172, !173, !174, !175, !176, !177, !178, !180, !181}
!170 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !167, file: !168, line: 88, baseType: !94, size: 4, flags: DIFlagBitField, extraData: i64 0)
!171 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !167, file: !168, line: 89, baseType: !94, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!172 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !167, file: !168, line: 96, baseType: !94, size: 8, offset: 8)
!173 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !167, file: !168, line: 97, baseType: !98, size: 16, offset: 16)
!174 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !167, file: !168, line: 98, baseType: !98, size: 16, offset: 32)
!175 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !167, file: !168, line: 99, baseType: !98, size: 16, offset: 48)
!176 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !167, file: !168, line: 100, baseType: !94, size: 8, offset: 64)
!177 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !167, file: !168, line: 101, baseType: !94, size: 8, offset: 72)
!178 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !167, file: !168, line: 102, baseType: !179, size: 16, offset: 80)
!179 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !99, line: 31, baseType: !46)
!180 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !167, file: !168, line: 103, baseType: !108, size: 32, offset: 96)
!181 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !167, file: !168, line: 104, baseType: !108, size: 32, offset: 128)
!182 = !DILocalVariable(name: "ipv6hdr", scope: !133, file: !3, line: 59, type: !183)
!183 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !184, size: 64)
!184 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6hdr", file: !185, line: 116, size: 320, elements: !186)
!185 = !DIFile(filename: "/usr/include/linux/ipv6.h", directory: "")
!186 = !{!187, !188, !189, !193, !194, !195, !196, !213}
!187 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !184, file: !185, line: 118, baseType: !94, size: 4, flags: DIFlagBitField, extraData: i64 0)
!188 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !184, file: !185, line: 119, baseType: !94, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!189 = !DIDerivedType(tag: DW_TAG_member, name: "flow_lbl", scope: !184, file: !185, line: 126, baseType: !190, size: 24, offset: 8)
!190 = !DICompositeType(tag: DW_TAG_array_type, baseType: !94, size: 24, elements: !191)
!191 = !{!192}
!192 = !DISubrange(count: 3)
!193 = !DIDerivedType(tag: DW_TAG_member, name: "payload_len", scope: !184, file: !185, line: 128, baseType: !98, size: 16, offset: 32)
!194 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !184, file: !185, line: 129, baseType: !94, size: 8, offset: 48)
!195 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !184, file: !185, line: 130, baseType: !94, size: 8, offset: 56)
!196 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !184, file: !185, line: 132, baseType: !197, size: 128, offset: 64)
!197 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in6_addr", file: !198, line: 33, size: 128, elements: !199)
!198 = !DIFile(filename: "/usr/include/linux/in6.h", directory: "")
!199 = !{!200}
!200 = !DIDerivedType(tag: DW_TAG_member, name: "in6_u", scope: !197, file: !198, line: 40, baseType: !201, size: 128)
!201 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !197, file: !198, line: 34, size: 128, elements: !202)
!202 = !{!203, !207, !211}
!203 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr8", scope: !201, file: !198, line: 35, baseType: !204, size: 128)
!204 = !DICompositeType(tag: DW_TAG_array_type, baseType: !94, size: 128, elements: !205)
!205 = !{!206}
!206 = !DISubrange(count: 16)
!207 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr16", scope: !201, file: !198, line: 37, baseType: !208, size: 128)
!208 = !DICompositeType(tag: DW_TAG_array_type, baseType: !98, size: 128, elements: !209)
!209 = !{!210}
!210 = !DISubrange(count: 8)
!211 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr32", scope: !201, file: !198, line: 38, baseType: !212, size: 128)
!212 = !DICompositeType(tag: DW_TAG_array_type, baseType: !108, size: 128, elements: !66)
!213 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !184, file: !185, line: 133, baseType: !197, size: 128, offset: 192)
!214 = !DILocalVariable(name: "echo_reply", scope: !133, file: !3, line: 60, type: !46)
!215 = !DILocalVariable(name: "icmphdr", scope: !133, file: !3, line: 61, type: !216)
!216 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !217, size: 64)
!217 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmphdr_common", file: !150, line: 51, size: 32, elements: !218)
!218 = !{!219, !220, !221}
!219 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !217, file: !150, line: 52, baseType: !94, size: 8)
!220 = !DIDerivedType(tag: DW_TAG_member, name: "code", scope: !217, file: !150, line: 53, baseType: !94, size: 8, offset: 8)
!221 = !DIDerivedType(tag: DW_TAG_member, name: "cksum", scope: !217, file: !150, line: 54, baseType: !179, size: 16, offset: 16)
!222 = !DILocalVariable(name: "action", scope: !133, file: !3, line: 62, type: !82)
!223 = !DILabel(scope: !133, name: "out", file: !3, line: 109)
!224 = !DILocation(line: 0, scope: !133)
!225 = !DILocation(line: 51, column: 38, scope: !133)
!226 = !{!227, !228, i64 4}
!227 = !{!"xdp_md", !228, i64 0, !228, i64 4, !228, i64 8, !228, i64 12, !228, i64 16}
!228 = !{!"int", !229, i64 0}
!229 = !{!"omnipotent char", !230, i64 0}
!230 = !{!"Simple C/C++ TBAA"}
!231 = !DILocation(line: 51, column: 27, scope: !133)
!232 = !DILocation(line: 51, column: 19, scope: !133)
!233 = !DILocation(line: 52, column: 34, scope: !133)
!234 = !{!227, !228, i64 0}
!235 = !DILocation(line: 52, column: 23, scope: !133)
!236 = !DILocation(line: 52, column: 15, scope: !133)
!237 = !DILocalVariable(name: "nh", arg: 1, scope: !238, file: !150, line: 124, type: !241)
!238 = distinct !DISubprogram(name: "parse_ethhdr", scope: !150, file: !150, line: 124, type: !239, scopeLine: 127, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !243)
!239 = !DISubroutineType(types: !240)
!240 = !{!81, !241, !44, !242}
!241 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !149, size: 64)
!242 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !154, size: 64)
!243 = !{!237, !244, !245}
!244 = !DILocalVariable(name: "data_end", arg: 2, scope: !238, file: !150, line: 125, type: !44)
!245 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !238, file: !150, line: 126, type: !242)
!246 = !DILocation(line: 0, scope: !238, inlinedAt: !247)
!247 = distinct !DILocation(line: 68, column: 13, scope: !133)
!248 = !DILocalVariable(name: "nh", arg: 1, scope: !249, file: !150, line: 79, type: !241)
!249 = distinct !DISubprogram(name: "parse_ethhdr_vlan", scope: !150, file: !150, line: 79, type: !250, scopeLine: 83, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !259)
!250 = !DISubroutineType(types: !251)
!251 = !{!81, !241, !44, !242, !252}
!252 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !253, size: 64)
!253 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "collect_vlans", file: !150, line: 64, size: 32, elements: !254)
!254 = !{!255}
!255 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !253, file: !150, line: 65, baseType: !256, size: 32)
!256 = !DICompositeType(tag: DW_TAG_array_type, baseType: !46, size: 32, elements: !257)
!257 = !{!258}
!258 = !DISubrange(count: 2)
!259 = !{!248, !260, !261, !262, !263, !264, !265, !271, !272}
!260 = !DILocalVariable(name: "data_end", arg: 2, scope: !249, file: !150, line: 80, type: !44)
!261 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !249, file: !150, line: 81, type: !242)
!262 = !DILocalVariable(name: "vlans", arg: 4, scope: !249, file: !150, line: 82, type: !252)
!263 = !DILocalVariable(name: "eth", scope: !249, file: !150, line: 84, type: !154)
!264 = !DILocalVariable(name: "hdrsize", scope: !249, file: !150, line: 85, type: !81)
!265 = !DILocalVariable(name: "vlh", scope: !249, file: !150, line: 86, type: !266)
!266 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !267, size: 64)
!267 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlan_hdr", file: !150, line: 42, size: 32, elements: !268)
!268 = !{!269, !270}
!269 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !267, file: !150, line: 43, baseType: !98, size: 16)
!270 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !267, file: !150, line: 44, baseType: !98, size: 16, offset: 16)
!271 = !DILocalVariable(name: "h_proto", scope: !249, file: !150, line: 87, type: !46)
!272 = !DILocalVariable(name: "i", scope: !249, file: !150, line: 88, type: !81)
!273 = !DILocation(line: 0, scope: !249, inlinedAt: !274)
!274 = distinct !DILocation(line: 129, column: 9, scope: !238, inlinedAt: !247)
!275 = !DILocation(line: 93, column: 14, scope: !276, inlinedAt: !274)
!276 = distinct !DILexicalBlock(scope: !249, file: !150, line: 93, column: 6)
!277 = !DILocation(line: 93, column: 24, scope: !276, inlinedAt: !274)
!278 = !DILocation(line: 93, column: 6, scope: !249, inlinedAt: !274)
!279 = !DILocation(line: 99, column: 17, scope: !249, inlinedAt: !274)
!280 = !{!281, !281, i64 0}
!281 = !{!"short", !229, i64 0}
!282 = !DILocation(line: 0, scope: !283, inlinedAt: !274)
!283 = distinct !DILexicalBlock(scope: !284, file: !150, line: 109, column: 7)
!284 = distinct !DILexicalBlock(scope: !285, file: !150, line: 105, column: 39)
!285 = distinct !DILexicalBlock(scope: !286, file: !150, line: 105, column: 2)
!286 = distinct !DILexicalBlock(scope: !249, file: !150, line: 105, column: 2)
!287 = !DILocation(line: 105, column: 2, scope: !286, inlinedAt: !274)
!288 = !DILocation(line: 106, column: 7, scope: !284, inlinedAt: !274)
!289 = !DILocation(line: 109, column: 11, scope: !283, inlinedAt: !274)
!290 = !DILocation(line: 109, column: 15, scope: !283, inlinedAt: !274)
!291 = !DILocation(line: 109, column: 7, scope: !284, inlinedAt: !274)
!292 = !DILocation(line: 112, column: 18, scope: !284, inlinedAt: !274)
!293 = !DILocation(line: 69, column: 6, scope: !133)
!294 = !DILocalVariable(name: "nh", arg: 1, scope: !295, file: !150, line: 151, type: !241)
!295 = distinct !DISubprogram(name: "parse_iphdr", scope: !150, file: !150, line: 151, type: !296, scopeLine: 154, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !299)
!296 = !DISubroutineType(types: !297)
!297 = !{!81, !241, !44, !298}
!298 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !166, size: 64)
!299 = !{!294, !300, !301, !302, !303}
!300 = !DILocalVariable(name: "data_end", arg: 2, scope: !295, file: !150, line: 152, type: !44)
!301 = !DILocalVariable(name: "iphdr", arg: 3, scope: !295, file: !150, line: 153, type: !298)
!302 = !DILocalVariable(name: "iph", scope: !295, file: !150, line: 155, type: !166)
!303 = !DILocalVariable(name: "hdrsize", scope: !295, file: !150, line: 156, type: !81)
!304 = !DILocation(line: 0, scope: !295, inlinedAt: !305)
!305 = distinct !DILocation(line: 70, column: 13, scope: !306)
!306 = distinct !DILexicalBlock(scope: !307, file: !3, line: 69, column: 39)
!307 = distinct !DILexicalBlock(scope: !133, file: !3, line: 69, column: 6)
!308 = !DILocation(line: 158, column: 10, scope: !309, inlinedAt: !305)
!309 = distinct !DILexicalBlock(scope: !295, file: !150, line: 158, column: 6)
!310 = !DILocation(line: 158, column: 14, scope: !309, inlinedAt: !305)
!311 = !DILocation(line: 158, column: 6, scope: !295, inlinedAt: !305)
!312 = !DILocation(line: 161, column: 17, scope: !295, inlinedAt: !305)
!313 = !DILocation(line: 161, column: 21, scope: !295, inlinedAt: !305)
!314 = !DILocation(line: 163, column: 13, scope: !315, inlinedAt: !305)
!315 = distinct !DILexicalBlock(scope: !295, file: !150, line: 163, column: 5)
!316 = !DILocation(line: 163, column: 5, scope: !295, inlinedAt: !305)
!317 = !DILocation(line: 163, column: 5, scope: !315, inlinedAt: !305)
!318 = !DILocation(line: 167, column: 14, scope: !319, inlinedAt: !305)
!319 = distinct !DILexicalBlock(scope: !295, file: !150, line: 167, column: 6)
!320 = !DILocation(line: 167, column: 24, scope: !319, inlinedAt: !305)
!321 = !DILocation(line: 167, column: 6, scope: !295, inlinedAt: !305)
!322 = !DILocation(line: 173, column: 14, scope: !295, inlinedAt: !305)
!323 = !{!324, !229, i64 9}
!324 = !{!"iphdr", !229, i64 0, !229, i64 0, !229, i64 1, !281, i64 2, !281, i64 4, !281, i64 6, !229, i64 8, !229, i64 9, !281, i64 10, !228, i64 12, !228, i64 16}
!325 = !DILocation(line: 71, column: 15, scope: !326)
!326 = distinct !DILexicalBlock(scope: !306, file: !3, line: 71, column: 7)
!327 = !DILocation(line: 71, column: 7, scope: !306)
!328 = !DILocalVariable(name: "nh", arg: 1, scope: !329, file: !150, line: 132, type: !241)
!329 = distinct !DISubprogram(name: "parse_ip6hdr", scope: !150, file: !150, line: 132, type: !330, scopeLine: 135, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !333)
!330 = !DISubroutineType(types: !331)
!331 = !{!81, !241, !44, !332}
!332 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !183, size: 64)
!333 = !{!328, !334, !335, !336}
!334 = !DILocalVariable(name: "data_end", arg: 2, scope: !329, file: !150, line: 133, type: !44)
!335 = !DILocalVariable(name: "ip6hdr", arg: 3, scope: !329, file: !150, line: 134, type: !332)
!336 = !DILocalVariable(name: "ip6h", scope: !329, file: !150, line: 136, type: !183)
!337 = !DILocation(line: 0, scope: !329, inlinedAt: !338)
!338 = distinct !DILocation(line: 74, column: 13, scope: !339)
!339 = distinct !DILexicalBlock(scope: !340, file: !3, line: 73, column: 48)
!340 = distinct !DILexicalBlock(scope: !307, file: !3, line: 73, column: 13)
!341 = !DILocation(line: 142, column: 11, scope: !342, inlinedAt: !338)
!342 = distinct !DILexicalBlock(scope: !329, file: !150, line: 142, column: 6)
!343 = !DILocation(line: 142, column: 17, scope: !342, inlinedAt: !338)
!344 = !DILocation(line: 142, column: 15, scope: !342, inlinedAt: !338)
!345 = !DILocation(line: 142, column: 6, scope: !329, inlinedAt: !338)
!346 = !DILocation(line: 148, column: 15, scope: !329, inlinedAt: !338)
!347 = !{!348, !229, i64 6}
!348 = !{!"ipv6hdr", !229, i64 0, !229, i64 0, !229, i64 1, !281, i64 4, !229, i64 6, !229, i64 7, !349, i64 8, !349, i64 24}
!349 = !{!"in6_addr", !229, i64 0}
!350 = !DILocation(line: 75, column: 15, scope: !351)
!351 = distinct !DILexicalBlock(scope: !339, file: !3, line: 75, column: 7)
!352 = !DILocation(line: 75, column: 7, scope: !339)
!353 = !DILocation(line: 65, column: 9, scope: !133)
!354 = !DILocalVariable(name: "nh", arg: 1, scope: !355, file: !150, line: 206, type: !241)
!355 = distinct !DISubprogram(name: "parse_icmphdr_common", scope: !150, file: !150, line: 206, type: !356, scopeLine: 209, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !359)
!356 = !DISubroutineType(types: !357)
!357 = !{!81, !241, !44, !358}
!358 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !216, size: 64)
!359 = !{!354, !360, !361, !362}
!360 = !DILocalVariable(name: "data_end", arg: 2, scope: !355, file: !150, line: 207, type: !44)
!361 = !DILocalVariable(name: "icmphdr", arg: 3, scope: !355, file: !150, line: 208, type: !358)
!362 = !DILocalVariable(name: "h", scope: !355, file: !150, line: 210, type: !216)
!363 = !DILocation(line: 0, scope: !355, inlinedAt: !364)
!364 = distinct !DILocation(line: 87, column: 14, scope: !133)
!365 = !DILocation(line: 212, column: 8, scope: !366, inlinedAt: !364)
!366 = distinct !DILexicalBlock(scope: !355, file: !150, line: 212, column: 6)
!367 = !DILocation(line: 212, column: 14, scope: !366, inlinedAt: !364)
!368 = !DILocation(line: 212, column: 12, scope: !366, inlinedAt: !364)
!369 = !DILocation(line: 212, column: 6, scope: !355, inlinedAt: !364)
!370 = !DILocation(line: 218, column: 12, scope: !355, inlinedAt: !364)
!371 = !{!372, !229, i64 0}
!372 = !{!"icmphdr_common", !229, i64 0, !229, i64 1, !281, i64 2}
!373 = !DILocation(line: 88, column: 51, scope: !374)
!374 = distinct !DILexicalBlock(scope: !133, file: !3, line: 88, column: 6)
!375 = !DILocation(line: 88, column: 38, scope: !374)
!376 = !DILocation(line: 92, column: 22, scope: !377)
!377 = distinct !DILexicalBlock(scope: !374, file: !3, line: 92, column: 13)
!378 = !DILocation(line: 93, column: 19, scope: !377)
!379 = !DILocation(line: 93, column: 6, scope: !377)
!380 = !DILocation(line: 107, column: 2, scope: !133)
!381 = !DILocation(line: 109, column: 1, scope: !133)
!382 = !DILocation(line: 0, scope: !383, inlinedAt: !396)
!383 = distinct !DISubprogram(name: "xdp_stats_record_action", scope: !128, file: !128, line: 24, type: !384, scopeLine: 25, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !386)
!384 = !DISubroutineType(types: !385)
!385 = !{!82, !136, !82}
!386 = !{!387, !388, !389}
!387 = !DILocalVariable(name: "ctx", arg: 1, scope: !383, file: !128, line: 24, type: !136)
!388 = !DILocalVariable(name: "action", arg: 2, scope: !383, file: !128, line: 24, type: !82)
!389 = !DILocalVariable(name: "rec", scope: !383, file: !128, line: 30, type: !390)
!390 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !391, size: 64)
!391 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "datarec", file: !392, line: 10, size: 128, elements: !393)
!392 = !DIFile(filename: "./../common/xdp_stats_kern_user.h", directory: "/home/saif/Desktop/xdp-tutorial/packet03-redirecting")
!393 = !{!394, !395}
!394 = !DIDerivedType(tag: DW_TAG_member, name: "rx_packets", scope: !391, file: !392, line: 11, baseType: !83, size: 64)
!395 = !DIDerivedType(tag: DW_TAG_member, name: "rx_bytes", scope: !391, file: !392, line: 12, baseType: !83, size: 64, offset: 64)
!396 = distinct !DILocation(line: 110, column: 9, scope: !133)
!397 = !{!228, !228, i64 0}
!398 = !DILocation(line: 30, column: 24, scope: !383, inlinedAt: !396)
!399 = !DILocation(line: 31, column: 7, scope: !400, inlinedAt: !396)
!400 = distinct !DILexicalBlock(scope: !383, file: !128, line: 31, column: 6)
!401 = !DILocation(line: 31, column: 6, scope: !383, inlinedAt: !396)
!402 = !DILocation(line: 38, column: 7, scope: !383, inlinedAt: !396)
!403 = !DILocation(line: 38, column: 17, scope: !383, inlinedAt: !396)
!404 = !{!405, !406, i64 0}
!405 = !{!"datarec", !406, i64 0, !406, i64 8}
!406 = !{!"long long", !229, i64 0}
!407 = !DILocation(line: 39, column: 25, scope: !383, inlinedAt: !396)
!408 = !DILocation(line: 39, column: 41, scope: !383, inlinedAt: !396)
!409 = !DILocation(line: 39, column: 34, scope: !383, inlinedAt: !396)
!410 = !DILocation(line: 39, column: 19, scope: !383, inlinedAt: !396)
!411 = !DILocation(line: 39, column: 7, scope: !383, inlinedAt: !396)
!412 = !DILocation(line: 39, column: 16, scope: !383, inlinedAt: !396)
!413 = !{!405, !406, i64 8}
!414 = !DILocation(line: 41, column: 9, scope: !383, inlinedAt: !396)
!415 = !DILocation(line: 41, column: 2, scope: !383, inlinedAt: !396)
!416 = !DILocation(line: 42, column: 1, scope: !383, inlinedAt: !396)
!417 = !DILocation(line: 110, column: 2, scope: !133)
!418 = distinct !DISubprogram(name: "xdp_redirect_func", scope: !3, file: !3, line: 115, type: !134, scopeLine: 116, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !419)
!419 = !{!420, !421, !422, !423, !424, !425, !426, !427}
!420 = !DILocalVariable(name: "ctx", arg: 1, scope: !418, file: !3, line: 115, type: !136)
!421 = !DILocalVariable(name: "data_end", scope: !418, file: !3, line: 117, type: !44)
!422 = !DILocalVariable(name: "data", scope: !418, file: !3, line: 118, type: !44)
!423 = !DILocalVariable(name: "nh", scope: !418, file: !3, line: 119, type: !149)
!424 = !DILocalVariable(name: "eth", scope: !418, file: !3, line: 120, type: !154)
!425 = !DILocalVariable(name: "eth_type", scope: !418, file: !3, line: 121, type: !81)
!426 = !DILocalVariable(name: "action", scope: !418, file: !3, line: 122, type: !81)
!427 = !DILabel(scope: !418, name: "out", file: !3, line: 137)
!428 = !DILocation(line: 0, scope: !418)
!429 = !DILocation(line: 137, column: 1, scope: !418)
!430 = !DILocation(line: 0, scope: !383, inlinedAt: !431)
!431 = distinct !DILocation(line: 138, column: 9, scope: !418)
!432 = !DILocation(line: 30, column: 24, scope: !383, inlinedAt: !431)
!433 = !DILocation(line: 31, column: 7, scope: !400, inlinedAt: !431)
!434 = !DILocation(line: 31, column: 6, scope: !383, inlinedAt: !431)
!435 = !DILocation(line: 118, column: 34, scope: !418)
!436 = !DILocation(line: 117, column: 38, scope: !418)
!437 = !DILocation(line: 38, column: 7, scope: !383, inlinedAt: !431)
!438 = !DILocation(line: 38, column: 17, scope: !383, inlinedAt: !431)
!439 = !DILocation(line: 39, column: 25, scope: !383, inlinedAt: !431)
!440 = !DILocation(line: 39, column: 41, scope: !383, inlinedAt: !431)
!441 = !DILocation(line: 39, column: 34, scope: !383, inlinedAt: !431)
!442 = !DILocation(line: 39, column: 19, scope: !383, inlinedAt: !431)
!443 = !DILocation(line: 39, column: 7, scope: !383, inlinedAt: !431)
!444 = !DILocation(line: 39, column: 16, scope: !383, inlinedAt: !431)
!445 = !DILocation(line: 41, column: 9, scope: !383, inlinedAt: !431)
!446 = !DILocation(line: 41, column: 2, scope: !383, inlinedAt: !431)
!447 = !DILocation(line: 42, column: 1, scope: !383, inlinedAt: !431)
!448 = !DILocation(line: 138, column: 2, scope: !418)
!449 = distinct !DISubprogram(name: "xdp_redirect_map_func", scope: !3, file: !3, line: 143, type: !134, scopeLine: 144, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !450)
!450 = !{!451, !452, !453, !454, !455, !456, !457, !458, !460}
!451 = !DILocalVariable(name: "ctx", arg: 1, scope: !449, file: !3, line: 143, type: !136)
!452 = !DILocalVariable(name: "data_end", scope: !449, file: !3, line: 145, type: !44)
!453 = !DILocalVariable(name: "data", scope: !449, file: !3, line: 146, type: !44)
!454 = !DILocalVariable(name: "nh", scope: !449, file: !3, line: 147, type: !149)
!455 = !DILocalVariable(name: "eth", scope: !449, file: !3, line: 148, type: !154)
!456 = !DILocalVariable(name: "eth_type", scope: !449, file: !3, line: 149, type: !81)
!457 = !DILocalVariable(name: "action", scope: !449, file: !3, line: 150, type: !81)
!458 = !DILocalVariable(name: "dst", scope: !449, file: !3, line: 151, type: !459)
!459 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!460 = !DILabel(scope: !449, name: "out", file: !3, line: 170)
!461 = !DILocation(line: 0, scope: !449)
!462 = !DILocation(line: 145, column: 38, scope: !449)
!463 = !DILocation(line: 145, column: 27, scope: !449)
!464 = !DILocation(line: 145, column: 19, scope: !449)
!465 = !DILocation(line: 146, column: 34, scope: !449)
!466 = !DILocation(line: 146, column: 23, scope: !449)
!467 = !DILocation(line: 146, column: 15, scope: !449)
!468 = !DILocation(line: 0, scope: !238, inlinedAt: !469)
!469 = distinct !DILocation(line: 157, column: 13, scope: !449)
!470 = !DILocation(line: 0, scope: !249, inlinedAt: !471)
!471 = distinct !DILocation(line: 129, column: 9, scope: !238, inlinedAt: !469)
!472 = !DILocation(line: 93, column: 14, scope: !276, inlinedAt: !471)
!473 = !DILocation(line: 93, column: 24, scope: !276, inlinedAt: !471)
!474 = !DILocation(line: 93, column: 6, scope: !249, inlinedAt: !471)
!475 = !DILocation(line: 97, column: 10, scope: !249, inlinedAt: !471)
!476 = !DILocation(line: 162, column: 46, scope: !449)
!477 = !DILocation(line: 162, column: 8, scope: !449)
!478 = !DILocation(line: 163, column: 7, scope: !479)
!479 = distinct !DILexicalBlock(scope: !449, file: !3, line: 163, column: 6)
!480 = !DILocation(line: 163, column: 6, scope: !449)
!481 = !DILocation(line: 170, column: 1, scope: !449)
!482 = !DILocation(line: 0, scope: !383, inlinedAt: !483)
!483 = distinct !DILocation(line: 171, column: 9, scope: !449)
!484 = !DILocation(line: 26, column: 6, scope: !383, inlinedAt: !483)
!485 = !DILocation(line: 167, column: 2, scope: !449)
!486 = !DILocation(line: 168, column: 11, scope: !449)
!487 = !DILocation(line: 26, column: 13, scope: !488, inlinedAt: !483)
!488 = distinct !DILexicalBlock(scope: !383, file: !128, line: 26, column: 6)
!489 = !DILocation(line: 30, column: 24, scope: !383, inlinedAt: !483)
!490 = !DILocation(line: 31, column: 7, scope: !400, inlinedAt: !483)
!491 = !DILocation(line: 31, column: 6, scope: !383, inlinedAt: !483)
!492 = !DILocation(line: 38, column: 7, scope: !383, inlinedAt: !483)
!493 = !DILocation(line: 38, column: 17, scope: !383, inlinedAt: !483)
!494 = !DILocation(line: 39, column: 25, scope: !383, inlinedAt: !483)
!495 = !DILocation(line: 39, column: 41, scope: !383, inlinedAt: !483)
!496 = !DILocation(line: 39, column: 34, scope: !383, inlinedAt: !483)
!497 = !DILocation(line: 39, column: 19, scope: !383, inlinedAt: !483)
!498 = !DILocation(line: 39, column: 7, scope: !383, inlinedAt: !483)
!499 = !DILocation(line: 39, column: 16, scope: !383, inlinedAt: !483)
!500 = !DILocation(line: 41, column: 9, scope: !383, inlinedAt: !483)
!501 = !DILocation(line: 41, column: 2, scope: !383, inlinedAt: !483)
!502 = !DILocation(line: 42, column: 1, scope: !383, inlinedAt: !483)
!503 = !DILocation(line: 171, column: 2, scope: !449)
!504 = distinct !DISubprogram(name: "xdp_router_func", scope: !3, file: !3, line: 183, type: !134, scopeLine: 184, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !505)
!505 = !{!506, !507, !508, !509, !510, !511, !512, !513, !514, !515, !516, !517}
!506 = !DILocalVariable(name: "ctx", arg: 1, scope: !504, file: !3, line: 183, type: !136)
!507 = !DILocalVariable(name: "data_end", scope: !504, file: !3, line: 185, type: !44)
!508 = !DILocalVariable(name: "data", scope: !504, file: !3, line: 186, type: !44)
!509 = !DILocalVariable(name: "fib_params", scope: !504, file: !3, line: 187, type: !91)
!510 = !DILocalVariable(name: "eth", scope: !504, file: !3, line: 188, type: !154)
!511 = !DILocalVariable(name: "ip6h", scope: !504, file: !3, line: 189, type: !183)
!512 = !DILocalVariable(name: "iph", scope: !504, file: !3, line: 190, type: !166)
!513 = !DILocalVariable(name: "h_proto", scope: !504, file: !3, line: 191, type: !46)
!514 = !DILocalVariable(name: "nh_off", scope: !504, file: !3, line: 192, type: !83)
!515 = !DILocalVariable(name: "rc", scope: !504, file: !3, line: 193, type: !81)
!516 = !DILocalVariable(name: "action", scope: !504, file: !3, line: 194, type: !81)
!517 = !DILabel(scope: !504, name: "out", file: !3, line: 264)
!518 = !DILocation(line: 0, scope: !504)
!519 = !DILocation(line: 185, column: 38, scope: !504)
!520 = !DILocation(line: 185, column: 27, scope: !504)
!521 = !DILocation(line: 185, column: 19, scope: !504)
!522 = !DILocation(line: 186, column: 34, scope: !504)
!523 = !DILocation(line: 186, column: 23, scope: !504)
!524 = !DILocation(line: 186, column: 15, scope: !504)
!525 = !DILocation(line: 187, column: 2, scope: !504)
!526 = !DILocation(line: 187, column: 24, scope: !504)
!527 = !DILocation(line: 197, column: 11, scope: !528)
!528 = distinct !DILexicalBlock(scope: !504, file: !3, line: 197, column: 6)
!529 = !DILocation(line: 197, column: 20, scope: !528)
!530 = !DILocation(line: 197, column: 6, scope: !504)
!531 = !DILocation(line: 188, column: 23, scope: !504)
!532 = !DILocation(line: 202, column: 17, scope: !504)
!533 = !{!534, !281, i64 12}
!534 = !{!"ethhdr", !229, i64 0, !229, i64 6, !281, i64 12}
!535 = !DILocation(line: 203, column: 14, scope: !536)
!536 = distinct !DILexicalBlock(scope: !504, file: !3, line: 203, column: 6)
!537 = !DILocation(line: 203, column: 6, scope: !504)
!538 = !DILocation(line: 206, column: 11, scope: !539)
!539 = distinct !DILexicalBlock(scope: !540, file: !3, line: 206, column: 7)
!540 = distinct !DILexicalBlock(scope: !536, file: !3, line: 203, column: 38)
!541 = !DILocation(line: 206, column: 17, scope: !539)
!542 = !DILocation(line: 206, column: 15, scope: !539)
!543 = !DILocation(line: 206, column: 7, scope: !540)
!544 = !DILocation(line: 204, column: 9, scope: !540)
!545 = !DILocation(line: 211, column: 12, scope: !546)
!546 = distinct !DILexicalBlock(scope: !540, file: !3, line: 211, column: 7)
!547 = !{!324, !229, i64 8}
!548 = !DILocation(line: 211, column: 16, scope: !546)
!549 = !DILocation(line: 211, column: 7, scope: !540)
!550 = !DILocation(line: 215, column: 21, scope: !551)
!551 = distinct !DILexicalBlock(scope: !536, file: !3, line: 215, column: 13)
!552 = !DILocation(line: 215, column: 13, scope: !536)
!553 = !DILocation(line: 221, column: 12, scope: !554)
!554 = distinct !DILexicalBlock(scope: !555, file: !3, line: 221, column: 7)
!555 = distinct !DILexicalBlock(scope: !551, file: !3, line: 215, column: 47)
!556 = !DILocation(line: 221, column: 18, scope: !554)
!557 = !DILocation(line: 221, column: 16, scope: !554)
!558 = !DILocation(line: 221, column: 7, scope: !555)
!559 = !DILocation(line: 220, column: 10, scope: !555)
!560 = !DILocation(line: 226, column: 13, scope: !561)
!561 = distinct !DILexicalBlock(scope: !555, file: !3, line: 226, column: 7)
!562 = !{!348, !229, i64 7}
!563 = !DILocation(line: 226, column: 23, scope: !561)
!564 = !DILocation(line: 226, column: 7, scope: !555)
!565 = !DILocation(line: 234, column: 28, scope: !504)
!566 = !{!227, !228, i64 12}
!567 = !DILocation(line: 234, column: 13, scope: !504)
!568 = !DILocation(line: 234, column: 21, scope: !504)
!569 = !{!570, !228, i64 8}
!570 = !{!"bpf_fib_lookup", !229, i64 0, !229, i64 1, !281, i64 2, !281, i64 4, !281, i64 6, !228, i64 8, !229, i64 12, !229, i64 16, !229, i64 32, !281, i64 48, !281, i64 50, !229, i64 52, !229, i64 58}
!571 = !DILocation(line: 236, column: 22, scope: !504)
!572 = !DILocation(line: 236, column: 7, scope: !504)
!573 = !DILocation(line: 237, column: 2, scope: !504)
!574 = !DILocation(line: 239, column: 7, scope: !575)
!575 = distinct !DILexicalBlock(scope: !504, file: !3, line: 237, column: 14)
!576 = !DILocalVariable(name: "iph", arg: 1, scope: !577, file: !3, line: 175, type: !166)
!577 = distinct !DISubprogram(name: "ip_decrease_ttl", scope: !3, file: !3, line: 175, type: !578, scopeLine: 176, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !580)
!578 = !DISubroutineType(types: !579)
!579 = !{!81, !166}
!580 = !{!576}
!581 = !DILocation(line: 0, scope: !577, inlinedAt: !582)
!582 = distinct !DILocation(line: 240, column: 4, scope: !583)
!583 = distinct !DILexicalBlock(scope: !575, file: !3, line: 239, column: 7)
!584 = !DILocation(line: 178, column: 16, scope: !577, inlinedAt: !582)
!585 = !DILocation(line: 178, column: 9, scope: !577, inlinedAt: !582)
!586 = !DILocation(line: 240, column: 4, scope: !583)
!587 = !DILocation(line: 241, column: 20, scope: !588)
!588 = distinct !DILexicalBlock(scope: !583, file: !3, line: 241, column: 12)
!589 = !DILocation(line: 241, column: 12, scope: !583)
!590 = !DILocation(line: 242, column: 10, scope: !588)
!591 = !DILocation(line: 242, column: 19, scope: !588)
!592 = !DILocation(line: 242, column: 4, scope: !588)
!593 = !DILocation(line: 254, column: 3, scope: !575)
!594 = !DILocation(line: 264, column: 1, scope: !504)
!595 = !DILocation(line: 0, scope: !383, inlinedAt: !596)
!596 = distinct !DILocation(line: 265, column: 9, scope: !504)
!597 = !DILocation(line: 30, column: 24, scope: !383, inlinedAt: !596)
!598 = !DILocation(line: 31, column: 7, scope: !400, inlinedAt: !596)
!599 = !DILocation(line: 31, column: 6, scope: !383, inlinedAt: !596)
!600 = !DILocation(line: 38, column: 7, scope: !383, inlinedAt: !596)
!601 = !DILocation(line: 38, column: 17, scope: !383, inlinedAt: !596)
!602 = !DILocation(line: 39, column: 25, scope: !383, inlinedAt: !596)
!603 = !DILocation(line: 39, column: 41, scope: !383, inlinedAt: !596)
!604 = !DILocation(line: 39, column: 34, scope: !383, inlinedAt: !596)
!605 = !DILocation(line: 39, column: 19, scope: !383, inlinedAt: !596)
!606 = !DILocation(line: 39, column: 7, scope: !383, inlinedAt: !596)
!607 = !DILocation(line: 39, column: 16, scope: !383, inlinedAt: !596)
!608 = !DILocation(line: 41, column: 9, scope: !383, inlinedAt: !596)
!609 = !DILocation(line: 41, column: 2, scope: !383, inlinedAt: !596)
!610 = !DILocation(line: 42, column: 1, scope: !383, inlinedAt: !596)
!611 = !DILocation(line: 266, column: 1, scope: !504)
!612 = !DILocation(line: 265, column: 2, scope: !504)
!613 = distinct !DISubprogram(name: "xdp_pass_func", scope: !3, file: !3, line: 269, type: !134, scopeLine: 270, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !614)
!614 = !{!615}
!615 = !DILocalVariable(name: "ctx", arg: 1, scope: !613, file: !3, line: 269, type: !136)
!616 = !DILocation(line: 0, scope: !613)
!617 = !DILocation(line: 271, column: 2, scope: !613)
