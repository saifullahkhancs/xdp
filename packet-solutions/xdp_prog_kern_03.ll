; ModuleID = 'xdp_prog_kern_03.c'
source_filename = "xdp_prog_kern_03.c"
target datalayout = "e-m:e-p:64:64-i64:64-n32:64-S128"
target triple = "bpf"

%struct.bpf_map_def = type { i32, i32, i32, i32, i32 }
%struct.xdp_md = type { i32, i32, i32, i32, i32 }
%struct.hdr_cursor = type { i8* }
%struct.collect_vlans = type { [2 x i16] }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
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
@tx_port = dso_local global %struct.bpf_map_def { i32 14, i32 4, i32 4, i32 256, i32 0 }, section "maps", align 4, !dbg !76
@redirect_params = dso_local global %struct.bpf_map_def { i32 1, i32 6, i32 6, i32 1, i32 0 }, section "maps", align 4, !dbg !86
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !88
@llvm.used = appending global [9 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.bpf_map_def* @redirect_params to i8*), i8* bitcast (%struct.bpf_map_def* @tx_port to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_icmp_echo_func to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_pass_func to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_redirect_func to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_redirect_map_func to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_router_func to i8*), i8* bitcast (%struct.bpf_map_def* @xdp_stats_map to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_icmp_echo_func(%struct.xdp_md* nocapture readonly %0) #0 section "xdp_icmp_echo" !dbg !164 {
  %2 = alloca [4 x i32], align 4
  call void @llvm.dbg.declare(metadata [4 x i32]* %2, metadata !241, metadata !DIExpression()), !dbg !248
  %3 = alloca [6 x i8], align 1
  call void @llvm.dbg.declare(metadata [6 x i8]* %3, metadata !253, metadata !DIExpression()), !dbg !259
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !176, metadata !DIExpression()), !dbg !261
  %6 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !262
  %7 = load i32, i32* %6, align 4, !dbg !262, !tbaa !263
  %8 = zext i32 %7 to i64, !dbg !268
  %9 = inttoptr i64 %8 to i8*, !dbg !269
  call void @llvm.dbg.value(metadata i8* %9, metadata !177, metadata !DIExpression()), !dbg !261
  %10 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !270
  %11 = load i32, i32* %10, align 4, !dbg !270, !tbaa !271
  %12 = zext i32 %11 to i64, !dbg !272
  %13 = inttoptr i64 %12 to i8*, !dbg !273
  call void @llvm.dbg.value(metadata i8* %13, metadata !178, metadata !DIExpression()), !dbg !261
  %14 = bitcast i32* %5 to i8*, !dbg !274
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %14) #4, !dbg !274
  call void @llvm.dbg.value(metadata i32 2, metadata !239, metadata !DIExpression()), !dbg !261
  call void @llvm.dbg.value(metadata i8* %13, metadata !179, metadata !DIExpression()), !dbg !261
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !275, metadata !DIExpression()), !dbg !284
  call void @llvm.dbg.value(metadata i8* %9, metadata !282, metadata !DIExpression()), !dbg !284
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !286, metadata !DIExpression()), !dbg !311
  call void @llvm.dbg.value(metadata i8* %9, metadata !298, metadata !DIExpression()), !dbg !311
  call void @llvm.dbg.value(metadata %struct.collect_vlans* null, metadata !300, metadata !DIExpression()), !dbg !311
  call void @llvm.dbg.value(metadata i8* %13, metadata !301, metadata !DIExpression()), !dbg !311
  call void @llvm.dbg.value(metadata i32 14, metadata !302, metadata !DIExpression()), !dbg !311
  %15 = getelementptr i8, i8* %13, i64 14, !dbg !313
  %16 = icmp ugt i8* %15, %9, !dbg !315
  br i1 %16, label %119, label %17, !dbg !316

17:                                               ; preds = %1
  call void @llvm.dbg.value(metadata i8* %13, metadata !301, metadata !DIExpression()), !dbg !311
  call void @llvm.dbg.value(metadata i8* %15, metadata !179, metadata !DIExpression()), !dbg !261
  %18 = inttoptr i64 %12 to %struct.ethhdr*, !dbg !317
  call void @llvm.dbg.value(metadata i8* %15, metadata !303, metadata !DIExpression()), !dbg !311
  %19 = getelementptr inbounds i8, i8* %13, i64 12, !dbg !318
  %20 = bitcast i8* %19 to i16*, !dbg !318
  call void @llvm.dbg.value(metadata i16 undef, metadata !309, metadata !DIExpression()), !dbg !311
  call void @llvm.dbg.value(metadata i32 0, metadata !310, metadata !DIExpression()), !dbg !311
  %21 = load i16, i16* %20, align 1, !dbg !311, !tbaa !319
  call void @llvm.dbg.value(metadata i16 %21, metadata !309, metadata !DIExpression()), !dbg !311
  %22 = inttoptr i64 %8 to %struct.vlan_hdr*, !dbg !321
  %23 = getelementptr i8, i8* %13, i64 22, !dbg !326
  %24 = bitcast i8* %23 to %struct.vlan_hdr*, !dbg !326
  switch i16 %21, label %39 [
    i16 -22392, label %25
    i16 129, label %25
  ], !dbg !327

25:                                               ; preds = %17, %17
  %26 = getelementptr i8, i8* %13, i64 18, !dbg !328
  %27 = bitcast i8* %26 to %struct.vlan_hdr*, !dbg !328
  %28 = icmp ugt %struct.vlan_hdr* %27, %22, !dbg !329
  br i1 %28, label %39, label %29, !dbg !330

29:                                               ; preds = %25
  call void @llvm.dbg.value(metadata i16 undef, metadata !309, metadata !DIExpression()), !dbg !311
  %30 = getelementptr i8, i8* %13, i64 16, !dbg !331
  %31 = bitcast i8* %30 to i16*, !dbg !331
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %27, metadata !303, metadata !DIExpression()), !dbg !311
  call void @llvm.dbg.value(metadata i32 1, metadata !310, metadata !DIExpression()), !dbg !311
  %32 = load i16, i16* %31, align 1, !dbg !311, !tbaa !319
  call void @llvm.dbg.value(metadata i16 %32, metadata !309, metadata !DIExpression()), !dbg !311
  switch i16 %32, label %39 [
    i16 -22392, label %33
    i16 129, label %33
  ], !dbg !327

33:                                               ; preds = %29, %29
  %34 = icmp ugt %struct.vlan_hdr* %24, %22, !dbg !329
  br i1 %34, label %39, label %35, !dbg !330

35:                                               ; preds = %33
  call void @llvm.dbg.value(metadata i16 undef, metadata !309, metadata !DIExpression()), !dbg !311
  %36 = getelementptr i8, i8* %13, i64 20, !dbg !331
  %37 = bitcast i8* %36 to i16*, !dbg !331
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %24, metadata !303, metadata !DIExpression()), !dbg !311
  call void @llvm.dbg.value(metadata i32 2, metadata !310, metadata !DIExpression()), !dbg !311
  %38 = load i16, i16* %37, align 1, !dbg !311, !tbaa !319
  call void @llvm.dbg.value(metadata i16 %38, metadata !309, metadata !DIExpression()), !dbg !311
  br label %39

39:                                               ; preds = %17, %25, %29, %33, %35
  %40 = phi i8* [ %15, %17 ], [ %15, %25 ], [ %26, %29 ], [ %26, %33 ], [ %23, %35 ], !dbg !311
  %41 = phi i16 [ %21, %17 ], [ %21, %25 ], [ %32, %29 ], [ %32, %33 ], [ %38, %35 ], !dbg !311
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* undef, metadata !303, metadata !DIExpression()), !dbg !311
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* undef, metadata !303, metadata !DIExpression()), !dbg !311
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* undef, metadata !303, metadata !DIExpression()), !dbg !311
  call void @llvm.dbg.value(metadata i8* %40, metadata !179, metadata !DIExpression()), !dbg !261
  call void @llvm.dbg.value(metadata i8* %40, metadata !179, metadata !DIExpression()), !dbg !261
  call void @llvm.dbg.value(metadata i16 %41, metadata !193, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_signed, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_stack_value)), !dbg !261
  switch i16 %41, label %119 [
    i16 8, label %42
    i16 -8826, label %59
  ], !dbg !332

42:                                               ; preds = %39
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !333, metadata !DIExpression()), !dbg !343
  call void @llvm.dbg.value(metadata i8* %9, metadata !339, metadata !DIExpression()), !dbg !343
  call void @llvm.dbg.value(metadata i8* %40, metadata !341, metadata !DIExpression()), !dbg !343
  %43 = getelementptr inbounds i8, i8* %40, i64 20, !dbg !347
  %44 = icmp ugt i8* %43, %9, !dbg !349
  br i1 %44, label %119, label %45, !dbg !350

45:                                               ; preds = %42
  %46 = load i8, i8* %40, align 4, !dbg !351
  %47 = shl i8 %46, 2, !dbg !352
  %48 = and i8 %47, 60, !dbg !352
  call void @llvm.dbg.value(metadata i8 %48, metadata !342, metadata !DIExpression()), !dbg !343
  %49 = icmp ult i8 %48, 20, !dbg !353
  br i1 %49, label %119, label %50, !dbg !355

50:                                               ; preds = %45
  %51 = zext i8 %48 to i64, !dbg !356
  call void @llvm.dbg.value(metadata i64 %51, metadata !342, metadata !DIExpression()), !dbg !343
  %52 = getelementptr i8, i8* %40, i64 %51, !dbg !357
  %53 = icmp ugt i8* %52, %9, !dbg !359
  br i1 %53, label %119, label %54, !dbg !360

54:                                               ; preds = %50
  call void @llvm.dbg.value(metadata i8* %52, metadata !179, metadata !DIExpression()), !dbg !261
  %55 = bitcast i8* %40 to %struct.iphdr*, !dbg !361
  %56 = getelementptr inbounds i8, i8* %40, i64 9, !dbg !362
  %57 = load i8, i8* %56, align 1, !dbg !362, !tbaa !363
  call void @llvm.dbg.value(metadata i8* %52, metadata !179, metadata !DIExpression()), !dbg !261
  call void @llvm.dbg.value(metadata i8 %57, metadata !194, metadata !DIExpression()), !dbg !261
  %58 = icmp eq i8 %57, 1, !dbg !365
  br i1 %58, label %69, label %119, !dbg !367

59:                                               ; preds = %39
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !368, metadata !DIExpression()), !dbg !377
  call void @llvm.dbg.value(metadata i8* %9, metadata !374, metadata !DIExpression()), !dbg !377
  call void @llvm.dbg.value(metadata i8* %40, metadata !376, metadata !DIExpression()), !dbg !377
  %60 = getelementptr inbounds i8, i8* %40, i64 40, !dbg !381
  %61 = bitcast i8* %60 to %struct.ipv6hdr*, !dbg !381
  %62 = inttoptr i64 %8 to %struct.ipv6hdr*, !dbg !383
  %63 = icmp ugt %struct.ipv6hdr* %61, %62, !dbg !384
  br i1 %63, label %119, label %64, !dbg !385

64:                                               ; preds = %59
  %65 = bitcast i8* %40 to %struct.ipv6hdr*, !dbg !386
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %65, metadata !376, metadata !DIExpression()), !dbg !377
  call void @llvm.dbg.value(metadata i8* %60, metadata !179, metadata !DIExpression()), !dbg !261
  %66 = getelementptr inbounds i8, i8* %40, i64 6, !dbg !387
  %67 = load i8, i8* %66, align 2, !dbg !387, !tbaa !388
  call void @llvm.dbg.value(metadata i8* %60, metadata !179, metadata !DIExpression()), !dbg !261
  call void @llvm.dbg.value(metadata i8 %67, metadata !194, metadata !DIExpression()), !dbg !261
  %68 = icmp eq i8 %67, 58, !dbg !391
  br i1 %68, label %69, label %119, !dbg !393

69:                                               ; preds = %54, %64
  %70 = phi i1 [ true, %54 ], [ false, %64 ]
  %71 = phi i32 [ 8, %54 ], [ 56710, %64 ]
  %72 = phi i8* [ %52, %54 ], [ %60, %64 ], !dbg !394
  %73 = phi %struct.iphdr* [ %55, %54 ], [ undef, %64 ]
  %74 = phi %struct.ipv6hdr* [ undef, %54 ], [ %65, %64 ]
  call void @llvm.dbg.value(metadata i8* %72, metadata !179, metadata !DIExpression()), !dbg !261
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !395, metadata !DIExpression()), !dbg !404
  call void @llvm.dbg.value(metadata i8* %9, metadata !401, metadata !DIExpression()), !dbg !404
  call void @llvm.dbg.value(metadata i8* %72, metadata !403, metadata !DIExpression()), !dbg !404
  %75 = getelementptr inbounds i8, i8* %72, i64 4, !dbg !406
  %76 = bitcast i8* %75 to %struct.icmphdr_common*, !dbg !406
  %77 = inttoptr i64 %8 to %struct.icmphdr_common*, !dbg !408
  %78 = icmp ugt %struct.icmphdr_common* %76, %77, !dbg !409
  br i1 %78, label %119, label %79, !dbg !410

79:                                               ; preds = %69
  call void @llvm.dbg.value(metadata %struct.icmphdr_common* %76, metadata !179, metadata !DIExpression()), !dbg !261
  %80 = load i8, i8* %72, align 2, !dbg !411, !tbaa !412
  call void @llvm.dbg.value(metadata i8 %80, metadata !195, metadata !DIExpression()), !dbg !261
  %81 = icmp eq i8 %80, 8, !dbg !414
  %82 = and i1 %70, %81, !dbg !415
  br i1 %82, label %83, label %88, !dbg !415

83:                                               ; preds = %79
  call void @llvm.dbg.value(metadata %struct.iphdr* %73, metadata !196, metadata !DIExpression()), !dbg !261
  call void @llvm.dbg.value(metadata %struct.iphdr* %73, metadata !416, metadata !DIExpression()), !dbg !422
  %84 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %73, i64 0, i32 8, !dbg !425
  %85 = load i32, i32* %84, align 4, !dbg !425, !tbaa !426
  call void @llvm.dbg.value(metadata i32 %85, metadata !421, metadata !DIExpression()), !dbg !422
  %86 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %73, i64 0, i32 9, !dbg !427
  %87 = load i32, i32* %86, align 4, !dbg !427, !tbaa !428
  store i32 %87, i32* %84, align 4, !dbg !429, !tbaa !426
  store i32 %85, i32* %86, align 4, !dbg !430, !tbaa !428
  call void @llvm.dbg.value(metadata i16 0, metadata !229, metadata !DIExpression()), !dbg !261
  br label %98, !dbg !431

88:                                               ; preds = %79
  call void @llvm.dbg.value(metadata i8 %80, metadata !195, metadata !DIExpression()), !dbg !261
  %89 = icmp eq i32 %71, 56710, !dbg !432
  %90 = icmp eq i8 %80, -128, !dbg !433
  %91 = and i1 %89, %90, !dbg !434
  br i1 %91, label %92, label %119, !dbg !434

92:                                               ; preds = %88
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %74, metadata !213, metadata !DIExpression()), !dbg !261
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %74, metadata !247, metadata !DIExpression()) #4, !dbg !435
  %93 = bitcast [4 x i32]* %2 to i8*, !dbg !436
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %93), !dbg !436
  %94 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %74, i64 0, i32 5, !dbg !437
  %95 = bitcast %struct.in6_addr* %94 to i8*, !dbg !437
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %93, i8* nonnull align 4 dereferenceable(16) %95, i64 16, i1 false) #4, !dbg !437, !tbaa.struct !438
  %96 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %74, i64 0, i32 6, !dbg !440
  %97 = bitcast %struct.in6_addr* %96 to i8*, !dbg !440
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %95, i8* nonnull align 4 dereferenceable(16) %97, i64 16, i1 false) #4, !dbg !440, !tbaa.struct !438
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %97, i8* nonnull align 4 dereferenceable(16) %93, i64 16, i1 false) #4, !dbg !441, !tbaa.struct !438
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %93), !dbg !442
  call void @llvm.dbg.value(metadata i16 129, metadata !229, metadata !DIExpression()), !dbg !261
  br label %98

98:                                               ; preds = %92, %83
  %99 = phi i8 [ 0, %83 ], [ -127, %92 ]
  call void @llvm.dbg.value(metadata i16 undef, metadata !229, metadata !DIExpression()), !dbg !261
  call void @llvm.dbg.value(metadata %struct.ethhdr* %18, metadata !184, metadata !DIExpression()), !dbg !261
  call void @llvm.dbg.value(metadata %struct.ethhdr* %18, metadata !258, metadata !DIExpression()) #4, !dbg !443
  %100 = getelementptr inbounds [6 x i8], [6 x i8]* %3, i64 0, i64 0, !dbg !444
  call void @llvm.lifetime.start.p0i8(i64 6, i8* nonnull %100), !dbg !444
  %101 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %18, i64 0, i32 1, i64 0, !dbg !445
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(6) %100, i8* nonnull align 1 dereferenceable(6) %101, i64 6, i1 false) #4, !dbg !445
  %102 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %18, i64 0, i32 0, i64 0, !dbg !446
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(6) %101, i8* nonnull align 1 dereferenceable(6) %102, i64 6, i1 false) #4, !dbg !446
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(6) %102, i8* nonnull align 1 dereferenceable(6) %100, i64 6, i1 false) #4, !dbg !447
  call void @llvm.lifetime.end.p0i8(i64 6, i8* nonnull %100), !dbg !448
  call void @llvm.dbg.value(metadata i8* %72, metadata !231, metadata !DIExpression()), !dbg !261
  %103 = getelementptr inbounds i8, i8* %72, i64 2, !dbg !449
  %104 = bitcast i8* %103 to i16*, !dbg !449
  %105 = load i16, i16* %104, align 2, !dbg !449, !tbaa !450
  call void @llvm.dbg.value(metadata i16 %105, metadata !230, metadata !DIExpression()), !dbg !261
  store i16 0, i16* %104, align 2, !dbg !451, !tbaa !450
  %106 = bitcast i8* %72 to i32*, !dbg !452
  call void @llvm.dbg.value(metadata %struct.icmphdr_common* undef, metadata !231, metadata !DIExpression()), !dbg !261
  %107 = load i32, i32* %106, align 2, !dbg !453
  call void @llvm.dbg.value(metadata i32 %107, metadata !238, metadata !DIExpression()), !dbg !261
  store i32 %107, i32* %5, align 4, !dbg !453
  call void @llvm.dbg.value(metadata i32* %106, metadata !231, metadata !DIExpression()), !dbg !261
  store i8 %99, i8* %72, align 2, !dbg !454, !tbaa !412
  %108 = xor i16 %105, -1, !dbg !455
  call void @llvm.dbg.value(metadata i32* %106, metadata !231, metadata !DIExpression()), !dbg !261
  call void @llvm.dbg.value(metadata i16 %108, metadata !456, metadata !DIExpression()) #4, !dbg !465
  call void @llvm.dbg.value(metadata i32* %106, metadata !461, metadata !DIExpression()) #4, !dbg !465
  call void @llvm.dbg.value(metadata i32* %5, metadata !462, metadata !DIExpression()) #4, !dbg !465
  call void @llvm.dbg.value(metadata i32 4, metadata !464, metadata !DIExpression()) #4, !dbg !465
  %109 = zext i16 %108 to i32, !dbg !467
  call void @llvm.dbg.value(metadata i32* %5, metadata !238, metadata !DIExpression(DW_OP_deref)), !dbg !261
  %110 = call i64 inttoptr (i64 28 to i64 (i32*, i32, i32*, i32, i32)*)(i32* nonnull %5, i32 4, i32* nonnull %106, i32 4, i32 %109) #4, !dbg !468
  %111 = trunc i64 %110 to i32, !dbg !468
  call void @llvm.dbg.value(metadata i32 %111, metadata !463, metadata !DIExpression()) #4, !dbg !465
  call void @llvm.dbg.value(metadata i32 %111, metadata !469, metadata !DIExpression()) #4, !dbg !475
  %112 = lshr i32 %111, 16, !dbg !477
  %113 = and i32 %111, 65535, !dbg !478
  %114 = add nuw nsw i32 %112, %113, !dbg !479
  call void @llvm.dbg.value(metadata i32 %114, metadata !474, metadata !DIExpression()) #4, !dbg !475
  %115 = lshr i32 %114, 16, !dbg !480
  %116 = add nuw nsw i32 %115, %114, !dbg !481
  call void @llvm.dbg.value(metadata i32 %116, metadata !474, metadata !DIExpression()) #4, !dbg !475
  %117 = trunc i32 %116 to i16, !dbg !482
  %118 = xor i16 %117, -1, !dbg !482
  call void @llvm.dbg.value(metadata i32* %106, metadata !231, metadata !DIExpression()), !dbg !261
  store i16 %118, i16* %104, align 2, !dbg !483, !tbaa !450
  call void @llvm.dbg.value(metadata i32 3, metadata !239, metadata !DIExpression()), !dbg !261
  br label %119, !dbg !484

119:                                              ; preds = %39, %69, %59, %50, %45, %42, %1, %54, %64, %88, %98
  %120 = phi i32 [ 2, %54 ], [ 3, %98 ], [ 2, %88 ], [ 2, %64 ], [ 2, %1 ], [ 2, %42 ], [ 2, %45 ], [ 2, %50 ], [ 2, %59 ], [ 2, %69 ], [ 2, %39 ], !dbg !261
  call void @llvm.dbg.value(metadata i32 %120, metadata !239, metadata !DIExpression()), !dbg !261
  call void @llvm.dbg.label(metadata !240), !dbg !485
  %121 = bitcast i32* %4 to i8*, !dbg !486
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %121), !dbg !486
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !491, metadata !DIExpression()) #4, !dbg !486
  call void @llvm.dbg.value(metadata i32 %120, metadata !492, metadata !DIExpression()) #4, !dbg !486
  store i32 %120, i32* %4, align 4, !tbaa !501
  call void @llvm.dbg.value(metadata i32* %4, metadata !492, metadata !DIExpression(DW_OP_deref)) #4, !dbg !486
  %122 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @xdp_stats_map to i8*), i8* nonnull %121) #4, !dbg !502
  call void @llvm.dbg.value(metadata i8* %122, metadata !493, metadata !DIExpression()) #4, !dbg !486
  %123 = icmp eq i8* %122, null, !dbg !503
  br i1 %123, label %137, label %124, !dbg !505

124:                                              ; preds = %119
  call void @llvm.dbg.value(metadata i8* %122, metadata !493, metadata !DIExpression()) #4, !dbg !486
  %125 = bitcast i8* %122 to i64*, !dbg !506
  %126 = load i64, i64* %125, align 8, !dbg !507, !tbaa !508
  %127 = add i64 %126, 1, !dbg !507
  store i64 %127, i64* %125, align 8, !dbg !507, !tbaa !508
  %128 = load i32, i32* %6, align 4, !dbg !511, !tbaa !263
  %129 = load i32, i32* %10, align 4, !dbg !512, !tbaa !271
  %130 = sub i32 %128, %129, !dbg !513
  %131 = zext i32 %130 to i64, !dbg !514
  %132 = getelementptr inbounds i8, i8* %122, i64 8, !dbg !515
  %133 = bitcast i8* %132 to i64*, !dbg !515
  %134 = load i64, i64* %133, align 8, !dbg !516, !tbaa !517
  %135 = add i64 %134, %131, !dbg !516
  store i64 %135, i64* %133, align 8, !dbg !516, !tbaa !517
  %136 = load i32, i32* %4, align 4, !dbg !518, !tbaa !501
  call void @llvm.dbg.value(metadata i32 %136, metadata !492, metadata !DIExpression()) #4, !dbg !486
  br label %137, !dbg !519

137:                                              ; preds = %119, %124
  %138 = phi i32 [ %136, %124 ], [ 0, %119 ], !dbg !486
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %121), !dbg !520
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %14) #4, !dbg !521
  ret i32 %138, !dbg !522
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind
define dso_local i32 @xdp_redirect_func(%struct.xdp_md* nocapture readonly %0) #0 section "xdp_redirect" !dbg !523 {
  %2 = alloca i32, align 4
  %3 = alloca [6 x i8], align 1
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !525, metadata !DIExpression()), !dbg !535
  %4 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !536
  %5 = load i32, i32* %4, align 4, !dbg !536, !tbaa !263
  %6 = zext i32 %5 to i64, !dbg !537
  %7 = inttoptr i64 %6 to i8*, !dbg !538
  call void @llvm.dbg.value(metadata i8* %7, metadata !526, metadata !DIExpression()), !dbg !535
  %8 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !539
  %9 = load i32, i32* %8, align 4, !dbg !539, !tbaa !271
  %10 = zext i32 %9 to i64, !dbg !540
  %11 = inttoptr i64 %10 to i8*, !dbg !541
  call void @llvm.dbg.value(metadata i8* %11, metadata !527, metadata !DIExpression()), !dbg !535
  call void @llvm.dbg.value(metadata i32 2, metadata !531, metadata !DIExpression()), !dbg !535
  %12 = getelementptr inbounds [6 x i8], [6 x i8]* %3, i64 0, i64 0, !dbg !542
  call void @llvm.lifetime.start.p0i8(i64 6, i8* nonnull %12), !dbg !542
  call void @llvm.dbg.declare(metadata [6 x i8]* %3, metadata !532, metadata !DIExpression()), !dbg !543
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(6) %12, i8 0, i64 6, i1 false), !dbg !543
  call void @llvm.dbg.value(metadata i32 0, metadata !533, metadata !DIExpression()), !dbg !535
  call void @llvm.dbg.value(metadata i8* %11, metadata !528, metadata !DIExpression()), !dbg !535
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !275, metadata !DIExpression()), !dbg !544
  call void @llvm.dbg.value(metadata i8* %7, metadata !282, metadata !DIExpression()), !dbg !544
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !286, metadata !DIExpression()), !dbg !546
  call void @llvm.dbg.value(metadata i8* %7, metadata !298, metadata !DIExpression()), !dbg !546
  call void @llvm.dbg.value(metadata %struct.collect_vlans* null, metadata !300, metadata !DIExpression()), !dbg !546
  call void @llvm.dbg.value(metadata i8* %11, metadata !301, metadata !DIExpression()), !dbg !546
  call void @llvm.dbg.value(metadata i32 14, metadata !302, metadata !DIExpression()), !dbg !546
  %13 = getelementptr i8, i8* %11, i64 14, !dbg !548
  %14 = icmp ugt i8* %13, %7, !dbg !549
  br i1 %14, label %21, label %15, !dbg !550

15:                                               ; preds = %1
  call void @llvm.dbg.value(metadata i8* %11, metadata !301, metadata !DIExpression()), !dbg !546
  call void @llvm.dbg.value(metadata i8* %13, metadata !528, metadata !DIExpression()), !dbg !535
  %16 = inttoptr i64 %10 to %struct.ethhdr*, !dbg !551
  call void @llvm.dbg.value(metadata i8* %13, metadata !303, metadata !DIExpression()), !dbg !546
  call void @llvm.dbg.value(metadata i16 undef, metadata !309, metadata !DIExpression()), !dbg !546
  call void @llvm.dbg.value(metadata i32 0, metadata !310, metadata !DIExpression()), !dbg !546
  call void @llvm.dbg.value(metadata i16 undef, metadata !309, metadata !DIExpression()), !dbg !546
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* undef, metadata !303, metadata !DIExpression()), !dbg !546
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* undef, metadata !528, metadata !DIExpression()), !dbg !535
  call void @llvm.dbg.value(metadata i16 undef, metadata !530, metadata !DIExpression()), !dbg !535
  call void @llvm.dbg.value(metadata %struct.ethhdr* %16, metadata !529, metadata !DIExpression()), !dbg !535
  %17 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %16, i64 0, i32 0, i64 0, !dbg !552
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(6) %17, i8* nonnull align 1 dereferenceable(6) %12, i64 6, i1 false), !dbg !552
  %18 = tail call i32 inttoptr (i64 23 to i32 (i32, i64)*)(i32 0, i64 0) #4, !dbg !553
  call void @llvm.dbg.value(metadata i32 %18, metadata !531, metadata !DIExpression()), !dbg !535
  call void @llvm.dbg.label(metadata !534), !dbg !554
  %19 = bitcast i32* %2 to i8*, !dbg !555
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %19), !dbg !555
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !491, metadata !DIExpression()) #4, !dbg !555
  call void @llvm.dbg.value(metadata i32 %18, metadata !492, metadata !DIExpression()) #4, !dbg !555
  store i32 %18, i32* %2, align 4, !tbaa !501
  %20 = icmp ugt i32 %18, 4, !dbg !557
  br i1 %20, label %40, label %23, !dbg !559

21:                                               ; preds = %1
  call void @llvm.dbg.value(metadata i32 %18, metadata !531, metadata !DIExpression()), !dbg !535
  call void @llvm.dbg.label(metadata !534), !dbg !554
  %22 = bitcast i32* %2 to i8*, !dbg !555
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %22), !dbg !555
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !491, metadata !DIExpression()) #4, !dbg !555
  call void @llvm.dbg.value(metadata i32 %18, metadata !492, metadata !DIExpression()) #4, !dbg !555
  store i32 2, i32* %2, align 4, !tbaa !501
  br label %23, !dbg !559

23:                                               ; preds = %21, %15
  %24 = phi i8* [ %22, %21 ], [ %19, %15 ]
  call void @llvm.dbg.value(metadata i32* %2, metadata !492, metadata !DIExpression(DW_OP_deref)) #4, !dbg !555
  %25 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @xdp_stats_map to i8*), i8* nonnull %24) #4, !dbg !560
  call void @llvm.dbg.value(metadata i8* %25, metadata !493, metadata !DIExpression()) #4, !dbg !555
  %26 = icmp eq i8* %25, null, !dbg !561
  br i1 %26, label %40, label %27, !dbg !562

27:                                               ; preds = %23
  call void @llvm.dbg.value(metadata i8* %25, metadata !493, metadata !DIExpression()) #4, !dbg !555
  %28 = bitcast i8* %25 to i64*, !dbg !563
  %29 = load i64, i64* %28, align 8, !dbg !564, !tbaa !508
  %30 = add i64 %29, 1, !dbg !564
  store i64 %30, i64* %28, align 8, !dbg !564, !tbaa !508
  %31 = load i32, i32* %4, align 4, !dbg !565, !tbaa !263
  %32 = load i32, i32* %8, align 4, !dbg !566, !tbaa !271
  %33 = sub i32 %31, %32, !dbg !567
  %34 = zext i32 %33 to i64, !dbg !568
  %35 = getelementptr inbounds i8, i8* %25, i64 8, !dbg !569
  %36 = bitcast i8* %35 to i64*, !dbg !569
  %37 = load i64, i64* %36, align 8, !dbg !570, !tbaa !517
  %38 = add i64 %37, %34, !dbg !570
  store i64 %38, i64* %36, align 8, !dbg !570, !tbaa !517
  %39 = load i32, i32* %2, align 4, !dbg !571, !tbaa !501
  call void @llvm.dbg.value(metadata i32 %39, metadata !492, metadata !DIExpression()) #4, !dbg !555
  br label %40, !dbg !572

40:                                               ; preds = %15, %23, %27
  %41 = phi i8* [ %19, %15 ], [ %24, %27 ], [ %24, %23 ]
  %42 = phi i32 [ 0, %15 ], [ %39, %27 ], [ 0, %23 ], !dbg !555
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %41), !dbg !573
  call void @llvm.lifetime.end.p0i8(i64 6, i8* nonnull %12), !dbg !574
  ret i32 %42, !dbg !575
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
define dso_local i32 @xdp_redirect_map_func(%struct.xdp_md* nocapture readonly %0) #0 section "xdp_redirect_map" !dbg !576 {
  %2 = alloca i32, align 4
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !578, metadata !DIExpression()), !dbg !588
  %3 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !589
  %4 = load i32, i32* %3, align 4, !dbg !589, !tbaa !263
  %5 = zext i32 %4 to i64, !dbg !590
  %6 = inttoptr i64 %5 to i8*, !dbg !591
  call void @llvm.dbg.value(metadata i8* %6, metadata !579, metadata !DIExpression()), !dbg !588
  %7 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !592
  %8 = load i32, i32* %7, align 4, !dbg !592, !tbaa !271
  %9 = zext i32 %8 to i64, !dbg !593
  %10 = inttoptr i64 %9 to i8*, !dbg !594
  call void @llvm.dbg.value(metadata i8* %10, metadata !580, metadata !DIExpression()), !dbg !588
  call void @llvm.dbg.value(metadata i32 2, metadata !584, metadata !DIExpression()), !dbg !588
  call void @llvm.dbg.value(metadata i8* %10, metadata !581, metadata !DIExpression()), !dbg !588
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !275, metadata !DIExpression()), !dbg !595
  call void @llvm.dbg.value(metadata i8* %6, metadata !282, metadata !DIExpression()), !dbg !595
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !286, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata i8* %6, metadata !298, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata %struct.collect_vlans* null, metadata !300, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata i8* %10, metadata !301, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata i32 14, metadata !302, metadata !DIExpression()), !dbg !597
  %11 = getelementptr i8, i8* %10, i64 14, !dbg !599
  %12 = icmp ugt i8* %11, %6, !dbg !600
  br i1 %12, label %18, label %13, !dbg !601

13:                                               ; preds = %1
  call void @llvm.dbg.value(metadata i8* %10, metadata !301, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata i8* %11, metadata !581, metadata !DIExpression()), !dbg !588
  %14 = inttoptr i64 %9 to %struct.ethhdr*, !dbg !602
  call void @llvm.dbg.value(metadata i8* %11, metadata !303, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata i16 undef, metadata !309, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata i32 0, metadata !310, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata i16 undef, metadata !309, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* undef, metadata !303, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* undef, metadata !581, metadata !DIExpression()), !dbg !588
  call void @llvm.dbg.value(metadata i16 undef, metadata !583, metadata !DIExpression()), !dbg !588
  call void @llvm.dbg.value(metadata %struct.ethhdr* %14, metadata !582, metadata !DIExpression()), !dbg !588
  %15 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %14, i64 0, i32 1, i64 0, !dbg !603
  %16 = tail call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @redirect_params to i8*), i8* nonnull %15) #4, !dbg !604
  call void @llvm.dbg.value(metadata i8* %16, metadata !585, metadata !DIExpression()), !dbg !588
  %17 = icmp eq i8* %16, null, !dbg !605
  br i1 %17, label %18, label %20, !dbg !607

18:                                               ; preds = %13, %1
  call void @llvm.dbg.value(metadata i32 %22, metadata !584, metadata !DIExpression()), !dbg !588
  call void @llvm.dbg.label(metadata !587), !dbg !608
  %19 = bitcast i32* %2 to i8*, !dbg !609
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %19), !dbg !609
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !491, metadata !DIExpression()) #4, !dbg !609
  call void @llvm.dbg.value(metadata i32 %22, metadata !492, metadata !DIExpression()) #4, !dbg !609
  store i32 2, i32* %2, align 4, !tbaa !501
  br label %25, !dbg !611

20:                                               ; preds = %13
  call void @llvm.dbg.value(metadata %struct.ethhdr* %14, metadata !582, metadata !DIExpression()), !dbg !588
  %21 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %14, i64 0, i32 0, i64 0, !dbg !612
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(6) %21, i8* nonnull align 1 dereferenceable(6) %16, i64 6, i1 false), !dbg !612
  %22 = tail call i32 inttoptr (i64 51 to i32 (i8*, i32, i64)*)(i8* bitcast (%struct.bpf_map_def* @tx_port to i8*), i32 0, i64 0) #4, !dbg !613
  call void @llvm.dbg.value(metadata i32 %22, metadata !584, metadata !DIExpression()), !dbg !588
  call void @llvm.dbg.value(metadata i32 %22, metadata !584, metadata !DIExpression()), !dbg !588
  call void @llvm.dbg.label(metadata !587), !dbg !608
  %23 = bitcast i32* %2 to i8*, !dbg !609
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %23), !dbg !609
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !491, metadata !DIExpression()) #4, !dbg !609
  call void @llvm.dbg.value(metadata i32 %22, metadata !492, metadata !DIExpression()) #4, !dbg !609
  store i32 %22, i32* %2, align 4, !tbaa !501
  %24 = icmp ugt i32 %22, 4, !dbg !614
  br i1 %24, label %42, label %25, !dbg !611

25:                                               ; preds = %18, %20
  %26 = phi i8* [ %19, %18 ], [ %23, %20 ]
  call void @llvm.dbg.value(metadata i32* %2, metadata !492, metadata !DIExpression(DW_OP_deref)) #4, !dbg !609
  %27 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @xdp_stats_map to i8*), i8* nonnull %26) #4, !dbg !615
  call void @llvm.dbg.value(metadata i8* %27, metadata !493, metadata !DIExpression()) #4, !dbg !609
  %28 = icmp eq i8* %27, null, !dbg !616
  br i1 %28, label %42, label %29, !dbg !617

29:                                               ; preds = %25
  call void @llvm.dbg.value(metadata i8* %27, metadata !493, metadata !DIExpression()) #4, !dbg !609
  %30 = bitcast i8* %27 to i64*, !dbg !618
  %31 = load i64, i64* %30, align 8, !dbg !619, !tbaa !508
  %32 = add i64 %31, 1, !dbg !619
  store i64 %32, i64* %30, align 8, !dbg !619, !tbaa !508
  %33 = load i32, i32* %3, align 4, !dbg !620, !tbaa !263
  %34 = load i32, i32* %7, align 4, !dbg !621, !tbaa !271
  %35 = sub i32 %33, %34, !dbg !622
  %36 = zext i32 %35 to i64, !dbg !623
  %37 = getelementptr inbounds i8, i8* %27, i64 8, !dbg !624
  %38 = bitcast i8* %37 to i64*, !dbg !624
  %39 = load i64, i64* %38, align 8, !dbg !625, !tbaa !517
  %40 = add i64 %39, %36, !dbg !625
  store i64 %40, i64* %38, align 8, !dbg !625, !tbaa !517
  %41 = load i32, i32* %2, align 4, !dbg !626, !tbaa !501
  call void @llvm.dbg.value(metadata i32 %41, metadata !492, metadata !DIExpression()) #4, !dbg !609
  br label %42, !dbg !627

42:                                               ; preds = %20, %25, %29
  %43 = phi i8* [ %23, %20 ], [ %26, %29 ], [ %26, %25 ]
  %44 = phi i32 [ 0, %20 ], [ %41, %29 ], [ 0, %25 ], !dbg !609
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %43), !dbg !628
  ret i32 %44, !dbg !629
}

; Function Attrs: nounwind
define dso_local i32 @xdp_router_func(%struct.xdp_md* %0) #0 section "xdp_router" !dbg !630 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.bpf_fib_lookup, align 4
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !632, metadata !DIExpression()), !dbg !649
  %4 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !650
  %5 = load i32, i32* %4, align 4, !dbg !650, !tbaa !263
  %6 = zext i32 %5 to i64, !dbg !651
  %7 = inttoptr i64 %6 to i8*, !dbg !652
  call void @llvm.dbg.value(metadata i8* %7, metadata !633, metadata !DIExpression()), !dbg !649
  %8 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !653
  %9 = load i32, i32* %8, align 4, !dbg !653, !tbaa !271
  %10 = zext i32 %9 to i64, !dbg !654
  %11 = inttoptr i64 %10 to i8*, !dbg !655
  call void @llvm.dbg.value(metadata i8* %11, metadata !634, metadata !DIExpression()), !dbg !649
  %12 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %3, i64 0, i32 0, !dbg !656
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %12) #4, !dbg !656
  call void @llvm.dbg.declare(metadata %struct.bpf_fib_lookup* %3, metadata !635, metadata !DIExpression()), !dbg !657
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(64) %12, i8 0, i64 64, i1 false), !dbg !657
  %13 = inttoptr i64 %10 to %struct.ethhdr*, !dbg !658
  call void @llvm.dbg.value(metadata %struct.ethhdr* %13, metadata !636, metadata !DIExpression()), !dbg !649
  call void @llvm.dbg.value(metadata i32 2, metadata !642, metadata !DIExpression()), !dbg !649
  call void @llvm.dbg.value(metadata i64 14, metadata !640, metadata !DIExpression()), !dbg !649
  %14 = getelementptr i8, i8* %11, i64 14, !dbg !659
  %15 = icmp ugt i8* %14, %7, !dbg !661
  br i1 %15, label %112, label %16, !dbg !662

16:                                               ; preds = %1
  %17 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %13, i64 0, i32 2, !dbg !663
  %18 = load i16, i16* %17, align 1, !dbg !663, !tbaa !664
  call void @llvm.dbg.value(metadata i16 %18, metadata !639, metadata !DIExpression()), !dbg !649
  %19 = icmp eq i16 %18, 8, !dbg !666
  br i1 %19, label %20, label %53, !dbg !667

20:                                               ; preds = %16
  %21 = bitcast i8* %14 to %struct.iphdr*, !dbg !668
  call void @llvm.dbg.value(metadata %struct.iphdr* %21, metadata !638, metadata !DIExpression()), !dbg !649
  %22 = getelementptr i8, i8* %11, i64 34, !dbg !670
  %23 = bitcast i8* %22 to %struct.iphdr*, !dbg !670
  %24 = inttoptr i64 %6 to %struct.iphdr*, !dbg !672
  %25 = icmp ugt %struct.iphdr* %23, %24, !dbg !673
  br i1 %25, label %112, label %26, !dbg !674

26:                                               ; preds = %20
  %27 = getelementptr i8, i8* %11, i64 22, !dbg !675
  %28 = load i8, i8* %27, align 4, !dbg !675, !tbaa !677
  %29 = icmp ult i8 %28, 2, !dbg !678
  br i1 %29, label %112, label %30, !dbg !679

30:                                               ; preds = %26
  store i8 2, i8* %12, align 4, !dbg !680, !tbaa !681
  %31 = getelementptr i8, i8* %11, i64 15, !dbg !683
  %32 = load i8, i8* %31, align 1, !dbg !683, !tbaa !684
  %33 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %3, i64 0, i32 6, !dbg !685
  %34 = bitcast %union.anon.0* %33 to i8*, !dbg !685
  store i8 %32, i8* %34, align 4, !dbg !686, !tbaa !439
  %35 = getelementptr i8, i8* %11, i64 23, !dbg !687
  %36 = load i8, i8* %35, align 1, !dbg !687, !tbaa !363
  %37 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %3, i64 0, i32 1, !dbg !688
  store i8 %36, i8* %37, align 1, !dbg !689, !tbaa !690
  %38 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %3, i64 0, i32 2, !dbg !691
  store i16 0, i16* %38, align 2, !dbg !692, !tbaa !693
  %39 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %3, i64 0, i32 3, !dbg !694
  store i16 0, i16* %39, align 4, !dbg !695, !tbaa !696
  %40 = getelementptr i8, i8* %11, i64 16, !dbg !697
  %41 = bitcast i8* %40 to i16*, !dbg !697
  %42 = load i16, i16* %41, align 2, !dbg !697, !tbaa !698
  %43 = tail call i16 @llvm.bswap.i16(i16 %42)
  %44 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %3, i64 0, i32 4, !dbg !699
  store i16 %43, i16* %44, align 2, !dbg !700, !tbaa !701
  %45 = getelementptr i8, i8* %11, i64 26, !dbg !702
  %46 = bitcast i8* %45 to i32*, !dbg !702
  %47 = load i32, i32* %46, align 4, !dbg !702, !tbaa !426
  %48 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %3, i64 0, i32 7, i32 0, i64 0, !dbg !703
  store i32 %47, i32* %48, align 4, !dbg !704, !tbaa !439
  %49 = getelementptr i8, i8* %11, i64 30, !dbg !705
  %50 = bitcast i8* %49 to i32*, !dbg !705
  %51 = load i32, i32* %50, align 4, !dbg !705, !tbaa !428
  %52 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %3, i64 0, i32 8, i32 0, i64 0, !dbg !706
  store i32 %51, i32* %52, align 4, !dbg !707, !tbaa !439
  br label %86, !dbg !708

53:                                               ; preds = %16
  %54 = icmp eq i16 %18, -8826, !dbg !709
  br i1 %54, label %55, label %112, !dbg !710

55:                                               ; preds = %53
  %56 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %3, i64 0, i32 7, i32 0, i64 0, !dbg !711
  call void @llvm.dbg.value(metadata i32* %56, metadata !643, metadata !DIExpression()), !dbg !712
  %57 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %3, i64 0, i32 8, i32 0, i64 0, !dbg !713
  call void @llvm.dbg.value(metadata i32* %57, metadata !647, metadata !DIExpression()), !dbg !712
  %58 = bitcast i8* %14 to %struct.ipv6hdr*, !dbg !714
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %58, metadata !637, metadata !DIExpression()), !dbg !649
  %59 = getelementptr i8, i8* %11, i64 54, !dbg !715
  %60 = bitcast i8* %59 to %struct.ipv6hdr*, !dbg !715
  %61 = inttoptr i64 %6 to %struct.ipv6hdr*, !dbg !717
  %62 = icmp ugt %struct.ipv6hdr* %60, %61, !dbg !718
  br i1 %62, label %112, label %63, !dbg !719

63:                                               ; preds = %55
  %64 = getelementptr i8, i8* %11, i64 21, !dbg !720
  %65 = load i8, i8* %64, align 1, !dbg !720, !tbaa !722
  %66 = icmp ult i8 %65, 2, !dbg !723
  br i1 %66, label %112, label %67, !dbg !724

67:                                               ; preds = %63
  store i8 10, i8* %12, align 4, !dbg !725, !tbaa !681
  %68 = bitcast i8* %14 to i32*, !dbg !726
  %69 = load i32, i32* %68, align 4, !dbg !726, !tbaa !501
  %70 = and i32 %69, -241, !dbg !727
  %71 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %3, i64 0, i32 6, i32 0, !dbg !728
  store i32 %70, i32* %71, align 4, !dbg !729, !tbaa !439
  %72 = getelementptr i8, i8* %11, i64 20, !dbg !730
  %73 = load i8, i8* %72, align 2, !dbg !730, !tbaa !388
  %74 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %3, i64 0, i32 1, !dbg !731
  store i8 %73, i8* %74, align 1, !dbg !732, !tbaa !690
  %75 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %3, i64 0, i32 2, !dbg !733
  store i16 0, i16* %75, align 2, !dbg !734, !tbaa !693
  %76 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %3, i64 0, i32 3, !dbg !735
  store i16 0, i16* %76, align 4, !dbg !736, !tbaa !696
  %77 = getelementptr i8, i8* %11, i64 18, !dbg !737
  %78 = bitcast i8* %77 to i16*, !dbg !737
  %79 = load i16, i16* %78, align 4, !dbg !737, !tbaa !738
  %80 = tail call i16 @llvm.bswap.i16(i16 %79)
  %81 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %3, i64 0, i32 4, !dbg !739
  store i16 %80, i16* %81, align 2, !dbg !740, !tbaa !701
  %82 = getelementptr i8, i8* %11, i64 22, !dbg !741
  %83 = bitcast i32* %56 to i8*, !dbg !741
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %83, i8* nonnull align 4 dereferenceable(16) %82, i64 16, i1 false), !dbg !741, !tbaa.struct !438
  %84 = getelementptr i8, i8* %11, i64 38, !dbg !742
  %85 = bitcast i32* %57 to i8*, !dbg !742
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %85, i8* nonnull align 4 dereferenceable(16) %84, i64 16, i1 false), !dbg !742, !tbaa.struct !438
  call void @llvm.dbg.value(metadata i32 2, metadata !642, metadata !DIExpression()), !dbg !649
  br label %86

86:                                               ; preds = %67, %30
  %87 = phi %struct.iphdr* [ %21, %30 ], [ undef, %67 ]
  %88 = phi %struct.ipv6hdr* [ undef, %30 ], [ %58, %67 ]
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %88, metadata !637, metadata !DIExpression()), !dbg !649
  call void @llvm.dbg.value(metadata i32 2, metadata !642, metadata !DIExpression()), !dbg !649
  call void @llvm.dbg.value(metadata %struct.iphdr* %87, metadata !638, metadata !DIExpression()), !dbg !649
  %89 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 3, !dbg !743
  %90 = load i32, i32* %89, align 4, !dbg !743, !tbaa !744
  %91 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %3, i64 0, i32 5, !dbg !745
  store i32 %90, i32* %91, align 4, !dbg !746, !tbaa !747
  %92 = bitcast %struct.xdp_md* %0 to i8*, !dbg !748
  %93 = call i32 inttoptr (i64 69 to i32 (i8*, %struct.bpf_fib_lookup*, i32, i32)*)(i8* %92, %struct.bpf_fib_lookup* nonnull %3, i32 64, i32 0) #4, !dbg !749
  call void @llvm.dbg.value(metadata i32 %93, metadata !641, metadata !DIExpression()), !dbg !649
  switch i32 %93, label %112 [
    i32 0, label %94
    i32 1, label %111
    i32 2, label %111
    i32 3, label %111
  ], !dbg !750

94:                                               ; preds = %86
  br i1 %19, label %95, label %105, !dbg !751

95:                                               ; preds = %94
  call void @llvm.dbg.value(metadata %struct.iphdr* %87, metadata !753, metadata !DIExpression()), !dbg !759
  %96 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %87, i64 0, i32 7, !dbg !762
  %97 = load i16, i16* %96, align 2, !dbg !762, !tbaa !763
  call void @llvm.dbg.value(metadata i16 %97, metadata !758, metadata !DIExpression()), !dbg !759
  %98 = add i16 %97, 1, !dbg !764
  call void @llvm.dbg.value(metadata i16 %97, metadata !758, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !759
  %99 = icmp ugt i16 %97, -3, !dbg !765
  %100 = zext i1 %99 to i16, !dbg !765
  %101 = add i16 %98, %100, !dbg !766
  store i16 %101, i16* %96, align 2, !dbg !767, !tbaa !763
  %102 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %87, i64 0, i32 5, !dbg !768
  %103 = load i8, i8* %102, align 4, !dbg !769, !tbaa !677
  %104 = add i8 %103, -1, !dbg !769
  store i8 %104, i8* %102, align 4, !dbg !769, !tbaa !677
  br label %115, !dbg !770

105:                                              ; preds = %94
  %106 = icmp eq i16 %18, -8826, !dbg !771
  br i1 %106, label %107, label %115, !dbg !773

107:                                              ; preds = %105
  %108 = getelementptr inbounds %struct.ipv6hdr, %struct.ipv6hdr* %88, i64 0, i32 4, !dbg !774
  %109 = load i8, i8* %108, align 1, !dbg !775, !tbaa !722
  %110 = add i8 %109, -1, !dbg !775
  store i8 %110, i8* %108, align 1, !dbg !775, !tbaa !722
  br label %115, !dbg !776

111:                                              ; preds = %86, %86, %86
  call void @llvm.dbg.value(metadata i32 1, metadata !642, metadata !DIExpression()), !dbg !649
  br label %112, !dbg !777

112:                                              ; preds = %26, %86, %111, %53, %1, %20, %55, %63
  %113 = phi i32 [ 1, %20 ], [ 1, %1 ], [ 2, %53 ], [ 1, %111 ], [ 2, %86 ], [ 2, %26 ], [ 2, %63 ], [ 1, %55 ]
  call void @llvm.dbg.value(metadata i32 %121, metadata !642, metadata !DIExpression()), !dbg !649
  call void @llvm.dbg.label(metadata !648), !dbg !778
  %114 = bitcast i32* %2 to i8*, !dbg !779
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %114), !dbg !779
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !491, metadata !DIExpression()) #4, !dbg !779
  call void @llvm.dbg.value(metadata i32 %121, metadata !492, metadata !DIExpression()) #4, !dbg !779
  store i32 %113, i32* %2, align 4, !tbaa !501
  br label %124, !dbg !781

115:                                              ; preds = %95, %107, %105
  %116 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %13, i64 0, i32 0, i64 0, !dbg !782
  %117 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %3, i64 0, i32 12, i64 0, !dbg !782
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(6) %116, i8* nonnull align 2 dereferenceable(6) %117, i64 6, i1 false), !dbg !782
  %118 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %13, i64 0, i32 1, i64 0, !dbg !783
  %119 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %3, i64 0, i32 11, i64 0, !dbg !783
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(6) %118, i8* nonnull align 4 dereferenceable(6) %119, i64 6, i1 false), !dbg !783
  %120 = load i32, i32* %91, align 4, !dbg !784, !tbaa !747
  %121 = call i32 inttoptr (i64 23 to i32 (i32, i64)*)(i32 %120, i64 0) #4, !dbg !785
  call void @llvm.dbg.value(metadata i32 %121, metadata !642, metadata !DIExpression()), !dbg !649
  call void @llvm.dbg.value(metadata i32 %121, metadata !642, metadata !DIExpression()), !dbg !649
  call void @llvm.dbg.label(metadata !648), !dbg !778
  %122 = bitcast i32* %2 to i8*, !dbg !779
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %122), !dbg !779
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !491, metadata !DIExpression()) #4, !dbg !779
  call void @llvm.dbg.value(metadata i32 %121, metadata !492, metadata !DIExpression()) #4, !dbg !779
  store i32 %121, i32* %2, align 4, !tbaa !501
  %123 = icmp ugt i32 %121, 4, !dbg !786
  br i1 %123, label %141, label %124, !dbg !781

124:                                              ; preds = %112, %115
  %125 = phi i8* [ %114, %112 ], [ %122, %115 ]
  call void @llvm.dbg.value(metadata i32* %2, metadata !492, metadata !DIExpression(DW_OP_deref)) #4, !dbg !779
  %126 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @xdp_stats_map to i8*), i8* nonnull %125) #4, !dbg !787
  call void @llvm.dbg.value(metadata i8* %126, metadata !493, metadata !DIExpression()) #4, !dbg !779
  %127 = icmp eq i8* %126, null, !dbg !788
  br i1 %127, label %141, label %128, !dbg !789

128:                                              ; preds = %124
  call void @llvm.dbg.value(metadata i8* %126, metadata !493, metadata !DIExpression()) #4, !dbg !779
  %129 = bitcast i8* %126 to i64*, !dbg !790
  %130 = load i64, i64* %129, align 8, !dbg !791, !tbaa !508
  %131 = add i64 %130, 1, !dbg !791
  store i64 %131, i64* %129, align 8, !dbg !791, !tbaa !508
  %132 = load i32, i32* %4, align 4, !dbg !792, !tbaa !263
  %133 = load i32, i32* %8, align 4, !dbg !793, !tbaa !271
  %134 = sub i32 %132, %133, !dbg !794
  %135 = zext i32 %134 to i64, !dbg !795
  %136 = getelementptr inbounds i8, i8* %126, i64 8, !dbg !796
  %137 = bitcast i8* %136 to i64*, !dbg !796
  %138 = load i64, i64* %137, align 8, !dbg !797, !tbaa !517
  %139 = add i64 %138, %135, !dbg !797
  store i64 %139, i64* %137, align 8, !dbg !797, !tbaa !517
  %140 = load i32, i32* %2, align 4, !dbg !798, !tbaa !501
  call void @llvm.dbg.value(metadata i32 %140, metadata !492, metadata !DIExpression()) #4, !dbg !779
  br label %141, !dbg !799

141:                                              ; preds = %115, %124, %128
  %142 = phi i8* [ %122, %115 ], [ %125, %128 ], [ %125, %124 ]
  %143 = phi i32 [ 0, %115 ], [ %140, %128 ], [ 0, %124 ], !dbg !779
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %142), !dbg !800
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %12) #4, !dbg !801
  ret i32 %143, !dbg !801
}

; Function Attrs: nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #1

; Function Attrs: norecurse nounwind readnone
define dso_local i32 @xdp_pass_func(%struct.xdp_md* nocapture readnone %0) #3 section "xdp_pass" !dbg !802 {
  call void @llvm.dbg.value(metadata %struct.xdp_md* undef, metadata !804, metadata !DIExpression()), !dbg !805
  ret i32 2, !dbg !806
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { norecurse nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!160, !161, !162}
!llvm.ident = !{!163}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "xdp_stats_map", scope: !2, file: !159, line: 16, type: !78, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !43, globals: !75, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "xdp_prog_kern_03.c", directory: "/home/saif/Desktop/xdp-tutorial/packet-solutions")
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
!43 = !{!44, !45, !46, !49, !74, !71}
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!45 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !47, line: 24, baseType: !48)
!47 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "")
!48 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in6_addr", file: !51, line: 33, size: 128, elements: !52)
!51 = !DIFile(filename: "/usr/include/linux/in6.h", directory: "")
!52 = !{!53}
!53 = !DIDerivedType(tag: DW_TAG_member, name: "in6_u", scope: !50, file: !51, line: 40, baseType: !54, size: 128)
!54 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !50, file: !51, line: 34, size: 128, elements: !55)
!55 = !{!56, !62, !68}
!56 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr8", scope: !54, file: !51, line: 35, baseType: !57, size: 128)
!57 = !DICompositeType(tag: DW_TAG_array_type, baseType: !58, size: 128, elements: !60)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !47, line: 21, baseType: !59)
!59 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!60 = !{!61}
!61 = !DISubrange(count: 16)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr16", scope: !54, file: !51, line: 37, baseType: !63, size: 128)
!63 = !DICompositeType(tag: DW_TAG_array_type, baseType: !64, size: 128, elements: !66)
!64 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !65, line: 25, baseType: !46)
!65 = !DIFile(filename: "/usr/include/linux/types.h", directory: "")
!66 = !{!67}
!67 = !DISubrange(count: 8)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr32", scope: !54, file: !51, line: 38, baseType: !69, size: 128)
!69 = !DICompositeType(tag: DW_TAG_array_type, baseType: !70, size: 128, elements: !72)
!70 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !65, line: 27, baseType: !71)
!71 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !47, line: 27, baseType: !7)
!72 = !{!73}
!73 = !DISubrange(count: 4)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!75 = !{!0, !76, !86, !88, !92, !101, !109, !116, !121}
!76 = !DIGlobalVariableExpression(var: !77, expr: !DIExpression())
!77 = distinct !DIGlobalVariable(name: "tx_port", scope: !2, file: !3, line: 19, type: !78, isLocal: false, isDefinition: true)
!78 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_map_def", file: !79, line: 33, size: 160, elements: !80)
!79 = !DIFile(filename: "../libbpf/src//build/usr/include/bpf/bpf_helpers.h", directory: "/home/saif/Desktop/xdp-tutorial/packet-solutions")
!80 = !{!81, !82, !83, !84, !85}
!81 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !78, file: !79, line: 34, baseType: !7, size: 32)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "key_size", scope: !78, file: !79, line: 35, baseType: !7, size: 32, offset: 32)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "value_size", scope: !78, file: !79, line: 36, baseType: !7, size: 32, offset: 64)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !78, file: !79, line: 37, baseType: !7, size: 32, offset: 96)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !78, file: !79, line: 38, baseType: !7, size: 32, offset: 128)
!86 = !DIGlobalVariableExpression(var: !87, expr: !DIExpression())
!87 = distinct !DIGlobalVariable(name: "redirect_params", scope: !2, file: !3, line: 26, type: !78, isLocal: false, isDefinition: true)
!88 = !DIGlobalVariableExpression(var: !89, expr: !DIExpression())
!89 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 333, type: !90, isLocal: false, isDefinition: true)
!90 = !DICompositeType(tag: DW_TAG_array_type, baseType: !91, size: 32, elements: !72)
!91 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!92 = !DIGlobalVariableExpression(var: !93, expr: !DIExpression())
!93 = distinct !DIGlobalVariable(name: "bpf_csum_diff", scope: !2, file: !94, line: 764, type: !95, isLocal: true, isDefinition: true)
!94 = !DIFile(filename: "../libbpf/src//build/usr/include/bpf/bpf_helper_defs.h", directory: "/home/saif/Desktop/xdp-tutorial/packet-solutions")
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DISubroutineType(types: !97)
!97 = !{!98, !74, !71, !74, !71, !100}
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "__s64", file: !47, line: 30, baseType: !99)
!99 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "__wsum", file: !65, line: 32, baseType: !71)
!101 = !DIGlobalVariableExpression(var: !102, expr: !DIExpression())
!102 = distinct !DIGlobalVariable(name: "bpf_redirect", scope: !2, file: !94, line: 589, type: !103, isLocal: true, isDefinition: true)
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!104 = !DISubroutineType(types: !105)
!105 = !{!106, !71, !107}
!106 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!107 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !47, line: 31, baseType: !108)
!108 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!109 = !DIGlobalVariableExpression(var: !110, expr: !DIExpression())
!110 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !94, line: 33, type: !111, isLocal: true, isDefinition: true)
!111 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !112, size: 64)
!112 = !DISubroutineType(types: !113)
!113 = !{!44, !44, !114}
!114 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !115, size: 64)
!115 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!116 = !DIGlobalVariableExpression(var: !117, expr: !DIExpression())
!117 = distinct !DIGlobalVariable(name: "bpf_redirect_map", scope: !2, file: !94, line: 1254, type: !118, isLocal: true, isDefinition: true)
!118 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !119, size: 64)
!119 = !DISubroutineType(types: !120)
!120 = !{!106, !44, !71, !107}
!121 = !DIGlobalVariableExpression(var: !122, expr: !DIExpression())
!122 = distinct !DIGlobalVariable(name: "bpf_fib_lookup", scope: !2, file: !94, line: 1764, type: !123, isLocal: true, isDefinition: true)
!123 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !124, size: 64)
!124 = !DISubroutineType(types: !125)
!125 = !{!106, !44, !126, !106, !71}
!126 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !127, size: 64)
!127 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_fib_lookup", file: !6, line: 3179, size: 512, elements: !128)
!128 = !{!129, !130, !131, !132, !133, !134, !135, !141, !147, !152, !153, !154, !158}
!129 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !127, file: !6, line: 3183, baseType: !58, size: 8)
!130 = !DIDerivedType(tag: DW_TAG_member, name: "l4_protocol", scope: !127, file: !6, line: 3186, baseType: !58, size: 8, offset: 8)
!131 = !DIDerivedType(tag: DW_TAG_member, name: "sport", scope: !127, file: !6, line: 3187, baseType: !64, size: 16, offset: 16)
!132 = !DIDerivedType(tag: DW_TAG_member, name: "dport", scope: !127, file: !6, line: 3188, baseType: !64, size: 16, offset: 32)
!133 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !127, file: !6, line: 3191, baseType: !46, size: 16, offset: 48)
!134 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !127, file: !6, line: 3196, baseType: !71, size: 32, offset: 64)
!135 = !DIDerivedType(tag: DW_TAG_member, scope: !127, file: !6, line: 3198, baseType: !136, size: 32, offset: 96)
!136 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !127, file: !6, line: 3198, size: 32, elements: !137)
!137 = !{!138, !139, !140}
!138 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !136, file: !6, line: 3200, baseType: !58, size: 8)
!139 = !DIDerivedType(tag: DW_TAG_member, name: "flowinfo", scope: !136, file: !6, line: 3201, baseType: !70, size: 32)
!140 = !DIDerivedType(tag: DW_TAG_member, name: "rt_metric", scope: !136, file: !6, line: 3204, baseType: !71, size: 32)
!141 = !DIDerivedType(tag: DW_TAG_member, scope: !127, file: !6, line: 3207, baseType: !142, size: 128, offset: 128)
!142 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !127, file: !6, line: 3207, size: 128, elements: !143)
!143 = !{!144, !145}
!144 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_src", scope: !142, file: !6, line: 3208, baseType: !70, size: 32)
!145 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_src", scope: !142, file: !6, line: 3209, baseType: !146, size: 128)
!146 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 128, elements: !72)
!147 = !DIDerivedType(tag: DW_TAG_member, scope: !127, file: !6, line: 3216, baseType: !148, size: 128, offset: 256)
!148 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !127, file: !6, line: 3216, size: 128, elements: !149)
!149 = !{!150, !151}
!150 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_dst", scope: !148, file: !6, line: 3217, baseType: !70, size: 32)
!151 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_dst", scope: !148, file: !6, line: 3218, baseType: !146, size: 128)
!152 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_proto", scope: !127, file: !6, line: 3222, baseType: !64, size: 16, offset: 384)
!153 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !127, file: !6, line: 3223, baseType: !64, size: 16, offset: 400)
!154 = !DIDerivedType(tag: DW_TAG_member, name: "smac", scope: !127, file: !6, line: 3224, baseType: !155, size: 48, offset: 416)
!155 = !DICompositeType(tag: DW_TAG_array_type, baseType: !58, size: 48, elements: !156)
!156 = !{!157}
!157 = !DISubrange(count: 6)
!158 = !DIDerivedType(tag: DW_TAG_member, name: "dmac", scope: !127, file: !6, line: 3225, baseType: !155, size: 48, offset: 464)
!159 = !DIFile(filename: "./../common/xdp_stats_kern.h", directory: "/home/saif/Desktop/xdp-tutorial/packet-solutions")
!160 = !{i32 7, !"Dwarf Version", i32 4}
!161 = !{i32 2, !"Debug Info Version", i32 3}
!162 = !{i32 1, !"wchar_size", i32 4}
!163 = !{!"clang version 10.0.0-4ubuntu1 "}
!164 = distinct !DISubprogram(name: "xdp_icmp_echo_func", scope: !3, file: !3, line: 61, type: !165, scopeLine: 62, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !175)
!165 = !DISubroutineType(types: !166)
!166 = !{!106, !167}
!167 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !168, size: 64)
!168 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 2856, size: 160, elements: !169)
!169 = !{!170, !171, !172, !173, !174}
!170 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !168, file: !6, line: 2857, baseType: !71, size: 32)
!171 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !168, file: !6, line: 2858, baseType: !71, size: 32, offset: 32)
!172 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !168, file: !6, line: 2859, baseType: !71, size: 32, offset: 64)
!173 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !168, file: !6, line: 2861, baseType: !71, size: 32, offset: 96)
!174 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !168, file: !6, line: 2862, baseType: !71, size: 32, offset: 128)
!175 = !{!176, !177, !178, !179, !184, !193, !194, !195, !196, !213, !229, !230, !231, !238, !239, !240}
!176 = !DILocalVariable(name: "ctx", arg: 1, scope: !164, file: !3, line: 61, type: !167)
!177 = !DILocalVariable(name: "data_end", scope: !164, file: !3, line: 63, type: !44)
!178 = !DILocalVariable(name: "data", scope: !164, file: !3, line: 64, type: !44)
!179 = !DILocalVariable(name: "nh", scope: !164, file: !3, line: 65, type: !180)
!180 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !181, line: 33, size: 64, elements: !182)
!181 = !DIFile(filename: "./../common/parsing_helpers.h", directory: "/home/saif/Desktop/xdp-tutorial/packet-solutions")
!182 = !{!183}
!183 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !180, file: !181, line: 34, baseType: !44, size: 64)
!184 = !DILocalVariable(name: "eth", scope: !164, file: !3, line: 66, type: !185)
!185 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !186, size: 64)
!186 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !187, line: 163, size: 112, elements: !188)
!187 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "")
!188 = !{!189, !191, !192}
!189 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !186, file: !187, line: 164, baseType: !190, size: 48)
!190 = !DICompositeType(tag: DW_TAG_array_type, baseType: !59, size: 48, elements: !156)
!191 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !186, file: !187, line: 165, baseType: !190, size: 48, offset: 48)
!192 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !186, file: !187, line: 166, baseType: !64, size: 16, offset: 96)
!193 = !DILocalVariable(name: "eth_type", scope: !164, file: !3, line: 67, type: !106)
!194 = !DILocalVariable(name: "ip_type", scope: !164, file: !3, line: 68, type: !106)
!195 = !DILocalVariable(name: "icmp_type", scope: !164, file: !3, line: 69, type: !106)
!196 = !DILocalVariable(name: "iphdr", scope: !164, file: !3, line: 70, type: !197)
!197 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !198, size: 64)
!198 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !199, line: 86, size: 160, elements: !200)
!199 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "")
!200 = !{!201, !202, !203, !204, !205, !206, !207, !208, !209, !211, !212}
!201 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !198, file: !199, line: 88, baseType: !58, size: 4, flags: DIFlagBitField, extraData: i64 0)
!202 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !198, file: !199, line: 89, baseType: !58, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!203 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !198, file: !199, line: 96, baseType: !58, size: 8, offset: 8)
!204 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !198, file: !199, line: 97, baseType: !64, size: 16, offset: 16)
!205 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !198, file: !199, line: 98, baseType: !64, size: 16, offset: 32)
!206 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !198, file: !199, line: 99, baseType: !64, size: 16, offset: 48)
!207 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !198, file: !199, line: 100, baseType: !58, size: 8, offset: 64)
!208 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !198, file: !199, line: 101, baseType: !58, size: 8, offset: 72)
!209 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !198, file: !199, line: 102, baseType: !210, size: 16, offset: 80)
!210 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !65, line: 31, baseType: !46)
!211 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !198, file: !199, line: 103, baseType: !70, size: 32, offset: 96)
!212 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !198, file: !199, line: 104, baseType: !70, size: 32, offset: 128)
!213 = !DILocalVariable(name: "ipv6hdr", scope: !164, file: !3, line: 71, type: !214)
!214 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !215, size: 64)
!215 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6hdr", file: !216, line: 116, size: 320, elements: !217)
!216 = !DIFile(filename: "/usr/include/linux/ipv6.h", directory: "")
!217 = !{!218, !219, !220, !224, !225, !226, !227, !228}
!218 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !215, file: !216, line: 118, baseType: !58, size: 4, flags: DIFlagBitField, extraData: i64 0)
!219 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !215, file: !216, line: 119, baseType: !58, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!220 = !DIDerivedType(tag: DW_TAG_member, name: "flow_lbl", scope: !215, file: !216, line: 126, baseType: !221, size: 24, offset: 8)
!221 = !DICompositeType(tag: DW_TAG_array_type, baseType: !58, size: 24, elements: !222)
!222 = !{!223}
!223 = !DISubrange(count: 3)
!224 = !DIDerivedType(tag: DW_TAG_member, name: "payload_len", scope: !215, file: !216, line: 128, baseType: !64, size: 16, offset: 32)
!225 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !215, file: !216, line: 129, baseType: !58, size: 8, offset: 48)
!226 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !215, file: !216, line: 130, baseType: !58, size: 8, offset: 56)
!227 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !215, file: !216, line: 132, baseType: !50, size: 128, offset: 64)
!228 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !215, file: !216, line: 133, baseType: !50, size: 128, offset: 192)
!229 = !DILocalVariable(name: "echo_reply", scope: !164, file: !3, line: 72, type: !46)
!230 = !DILocalVariable(name: "old_csum", scope: !164, file: !3, line: 72, type: !46)
!231 = !DILocalVariable(name: "icmphdr", scope: !164, file: !3, line: 73, type: !232)
!232 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !233, size: 64)
!233 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmphdr_common", file: !181, line: 51, size: 32, elements: !234)
!234 = !{!235, !236, !237}
!235 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !233, file: !181, line: 52, baseType: !58, size: 8)
!236 = !DIDerivedType(tag: DW_TAG_member, name: "code", scope: !233, file: !181, line: 53, baseType: !58, size: 8, offset: 8)
!237 = !DIDerivedType(tag: DW_TAG_member, name: "cksum", scope: !233, file: !181, line: 54, baseType: !210, size: 16, offset: 16)
!238 = !DILocalVariable(name: "icmphdr_old", scope: !164, file: !3, line: 74, type: !233)
!239 = !DILocalVariable(name: "action", scope: !164, file: !3, line: 75, type: !71)
!240 = !DILabel(scope: !164, name: "out", file: !3, line: 148)
!241 = !DILocalVariable(name: "tmp", scope: !242, file: !243, line: 127, type: !50)
!242 = distinct !DISubprogram(name: "swap_src_dst_ipv6", scope: !243, file: !243, line: 125, type: !244, scopeLine: 126, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !246)
!243 = !DIFile(filename: "./../common/rewrite_helpers.h", directory: "/home/saif/Desktop/xdp-tutorial/packet-solutions")
!244 = !DISubroutineType(types: !245)
!245 = !{null, !214}
!246 = !{!247, !241}
!247 = !DILocalVariable(name: "ipv6", arg: 1, scope: !242, file: !243, line: 125, type: !214)
!248 = !DILocation(line: 127, column: 18, scope: !242, inlinedAt: !249)
!249 = distinct !DILocation(line: 108, column: 3, scope: !250)
!250 = distinct !DILexicalBlock(scope: !251, file: !3, line: 106, column: 43)
!251 = distinct !DILexicalBlock(scope: !252, file: !3, line: 105, column: 13)
!252 = distinct !DILexicalBlock(scope: !164, file: !3, line: 101, column: 6)
!253 = !DILocalVariable(name: "h_tmp", scope: !254, file: !243, line: 115, type: !155)
!254 = distinct !DISubprogram(name: "swap_src_dst_mac", scope: !243, file: !243, line: 113, type: !255, scopeLine: 114, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !257)
!255 = !DISubroutineType(types: !256)
!256 = !{null, !185}
!257 = !{!258, !253}
!258 = !DILocalVariable(name: "eth", arg: 1, scope: !254, file: !243, line: 113, type: !185)
!259 = !DILocation(line: 115, column: 7, scope: !254, inlinedAt: !260)
!260 = distinct !DILocation(line: 115, column: 2, scope: !164)
!261 = !DILocation(line: 0, scope: !164)
!262 = !DILocation(line: 63, column: 38, scope: !164)
!263 = !{!264, !265, i64 4}
!264 = !{!"xdp_md", !265, i64 0, !265, i64 4, !265, i64 8, !265, i64 12, !265, i64 16}
!265 = !{!"int", !266, i64 0}
!266 = !{!"omnipotent char", !267, i64 0}
!267 = !{!"Simple C/C++ TBAA"}
!268 = !DILocation(line: 63, column: 27, scope: !164)
!269 = !DILocation(line: 63, column: 19, scope: !164)
!270 = !DILocation(line: 64, column: 34, scope: !164)
!271 = !{!264, !265, i64 0}
!272 = !DILocation(line: 64, column: 23, scope: !164)
!273 = !DILocation(line: 64, column: 15, scope: !164)
!274 = !DILocation(line: 74, column: 2, scope: !164)
!275 = !DILocalVariable(name: "nh", arg: 1, scope: !276, file: !181, line: 124, type: !279)
!276 = distinct !DISubprogram(name: "parse_ethhdr", scope: !181, file: !181, line: 124, type: !277, scopeLine: 127, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !281)
!277 = !DISubroutineType(types: !278)
!278 = !{!106, !279, !44, !280}
!279 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !180, size: 64)
!280 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !185, size: 64)
!281 = !{!275, !282, !283}
!282 = !DILocalVariable(name: "data_end", arg: 2, scope: !276, file: !181, line: 125, type: !44)
!283 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !276, file: !181, line: 126, type: !280)
!284 = !DILocation(line: 0, scope: !276, inlinedAt: !285)
!285 = distinct !DILocation(line: 81, column: 13, scope: !164)
!286 = !DILocalVariable(name: "nh", arg: 1, scope: !287, file: !181, line: 79, type: !279)
!287 = distinct !DISubprogram(name: "parse_ethhdr_vlan", scope: !181, file: !181, line: 79, type: !288, scopeLine: 83, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !297)
!288 = !DISubroutineType(types: !289)
!289 = !{!106, !279, !44, !280, !290}
!290 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !291, size: 64)
!291 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "collect_vlans", file: !181, line: 64, size: 32, elements: !292)
!292 = !{!293}
!293 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !291, file: !181, line: 65, baseType: !294, size: 32)
!294 = !DICompositeType(tag: DW_TAG_array_type, baseType: !46, size: 32, elements: !295)
!295 = !{!296}
!296 = !DISubrange(count: 2)
!297 = !{!286, !298, !299, !300, !301, !302, !303, !309, !310}
!298 = !DILocalVariable(name: "data_end", arg: 2, scope: !287, file: !181, line: 80, type: !44)
!299 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !287, file: !181, line: 81, type: !280)
!300 = !DILocalVariable(name: "vlans", arg: 4, scope: !287, file: !181, line: 82, type: !290)
!301 = !DILocalVariable(name: "eth", scope: !287, file: !181, line: 84, type: !185)
!302 = !DILocalVariable(name: "hdrsize", scope: !287, file: !181, line: 85, type: !106)
!303 = !DILocalVariable(name: "vlh", scope: !287, file: !181, line: 86, type: !304)
!304 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !305, size: 64)
!305 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlan_hdr", file: !181, line: 42, size: 32, elements: !306)
!306 = !{!307, !308}
!307 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !305, file: !181, line: 43, baseType: !64, size: 16)
!308 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !305, file: !181, line: 44, baseType: !64, size: 16, offset: 16)
!309 = !DILocalVariable(name: "h_proto", scope: !287, file: !181, line: 87, type: !46)
!310 = !DILocalVariable(name: "i", scope: !287, file: !181, line: 88, type: !106)
!311 = !DILocation(line: 0, scope: !287, inlinedAt: !312)
!312 = distinct !DILocation(line: 129, column: 9, scope: !276, inlinedAt: !285)
!313 = !DILocation(line: 93, column: 14, scope: !314, inlinedAt: !312)
!314 = distinct !DILexicalBlock(scope: !287, file: !181, line: 93, column: 6)
!315 = !DILocation(line: 93, column: 24, scope: !314, inlinedAt: !312)
!316 = !DILocation(line: 93, column: 6, scope: !287, inlinedAt: !312)
!317 = !DILocation(line: 97, column: 10, scope: !287, inlinedAt: !312)
!318 = !DILocation(line: 99, column: 17, scope: !287, inlinedAt: !312)
!319 = !{!320, !320, i64 0}
!320 = !{!"short", !266, i64 0}
!321 = !DILocation(line: 0, scope: !322, inlinedAt: !312)
!322 = distinct !DILexicalBlock(scope: !323, file: !181, line: 109, column: 7)
!323 = distinct !DILexicalBlock(scope: !324, file: !181, line: 105, column: 39)
!324 = distinct !DILexicalBlock(scope: !325, file: !181, line: 105, column: 2)
!325 = distinct !DILexicalBlock(scope: !287, file: !181, line: 105, column: 2)
!326 = !DILocation(line: 105, column: 2, scope: !325, inlinedAt: !312)
!327 = !DILocation(line: 106, column: 7, scope: !323, inlinedAt: !312)
!328 = !DILocation(line: 109, column: 11, scope: !322, inlinedAt: !312)
!329 = !DILocation(line: 109, column: 15, scope: !322, inlinedAt: !312)
!330 = !DILocation(line: 109, column: 7, scope: !323, inlinedAt: !312)
!331 = !DILocation(line: 112, column: 18, scope: !323, inlinedAt: !312)
!332 = !DILocation(line: 82, column: 6, scope: !164)
!333 = !DILocalVariable(name: "nh", arg: 1, scope: !334, file: !181, line: 151, type: !279)
!334 = distinct !DISubprogram(name: "parse_iphdr", scope: !181, file: !181, line: 151, type: !335, scopeLine: 154, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !338)
!335 = !DISubroutineType(types: !336)
!336 = !{!106, !279, !44, !337}
!337 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !197, size: 64)
!338 = !{!333, !339, !340, !341, !342}
!339 = !DILocalVariable(name: "data_end", arg: 2, scope: !334, file: !181, line: 152, type: !44)
!340 = !DILocalVariable(name: "iphdr", arg: 3, scope: !334, file: !181, line: 153, type: !337)
!341 = !DILocalVariable(name: "iph", scope: !334, file: !181, line: 155, type: !197)
!342 = !DILocalVariable(name: "hdrsize", scope: !334, file: !181, line: 156, type: !106)
!343 = !DILocation(line: 0, scope: !334, inlinedAt: !344)
!344 = distinct !DILocation(line: 83, column: 13, scope: !345)
!345 = distinct !DILexicalBlock(scope: !346, file: !3, line: 82, column: 39)
!346 = distinct !DILexicalBlock(scope: !164, file: !3, line: 82, column: 6)
!347 = !DILocation(line: 158, column: 10, scope: !348, inlinedAt: !344)
!348 = distinct !DILexicalBlock(scope: !334, file: !181, line: 158, column: 6)
!349 = !DILocation(line: 158, column: 14, scope: !348, inlinedAt: !344)
!350 = !DILocation(line: 158, column: 6, scope: !334, inlinedAt: !344)
!351 = !DILocation(line: 161, column: 17, scope: !334, inlinedAt: !344)
!352 = !DILocation(line: 161, column: 21, scope: !334, inlinedAt: !344)
!353 = !DILocation(line: 163, column: 13, scope: !354, inlinedAt: !344)
!354 = distinct !DILexicalBlock(scope: !334, file: !181, line: 163, column: 5)
!355 = !DILocation(line: 163, column: 5, scope: !334, inlinedAt: !344)
!356 = !DILocation(line: 163, column: 5, scope: !354, inlinedAt: !344)
!357 = !DILocation(line: 167, column: 14, scope: !358, inlinedAt: !344)
!358 = distinct !DILexicalBlock(scope: !334, file: !181, line: 167, column: 6)
!359 = !DILocation(line: 167, column: 24, scope: !358, inlinedAt: !344)
!360 = !DILocation(line: 167, column: 6, scope: !334, inlinedAt: !344)
!361 = !DILocation(line: 171, column: 9, scope: !334, inlinedAt: !344)
!362 = !DILocation(line: 173, column: 14, scope: !334, inlinedAt: !344)
!363 = !{!364, !266, i64 9}
!364 = !{!"iphdr", !266, i64 0, !266, i64 0, !266, i64 1, !320, i64 2, !320, i64 4, !320, i64 6, !266, i64 8, !266, i64 9, !320, i64 10, !265, i64 12, !265, i64 16}
!365 = !DILocation(line: 84, column: 15, scope: !366)
!366 = distinct !DILexicalBlock(scope: !345, file: !3, line: 84, column: 7)
!367 = !DILocation(line: 84, column: 7, scope: !345)
!368 = !DILocalVariable(name: "nh", arg: 1, scope: !369, file: !181, line: 132, type: !279)
!369 = distinct !DISubprogram(name: "parse_ip6hdr", scope: !181, file: !181, line: 132, type: !370, scopeLine: 135, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !373)
!370 = !DISubroutineType(types: !371)
!371 = !{!106, !279, !44, !372}
!372 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !214, size: 64)
!373 = !{!368, !374, !375, !376}
!374 = !DILocalVariable(name: "data_end", arg: 2, scope: !369, file: !181, line: 133, type: !44)
!375 = !DILocalVariable(name: "ip6hdr", arg: 3, scope: !369, file: !181, line: 134, type: !372)
!376 = !DILocalVariable(name: "ip6h", scope: !369, file: !181, line: 136, type: !214)
!377 = !DILocation(line: 0, scope: !369, inlinedAt: !378)
!378 = distinct !DILocation(line: 87, column: 13, scope: !379)
!379 = distinct !DILexicalBlock(scope: !380, file: !3, line: 86, column: 48)
!380 = distinct !DILexicalBlock(scope: !346, file: !3, line: 86, column: 13)
!381 = !DILocation(line: 142, column: 11, scope: !382, inlinedAt: !378)
!382 = distinct !DILexicalBlock(scope: !369, file: !181, line: 142, column: 6)
!383 = !DILocation(line: 142, column: 17, scope: !382, inlinedAt: !378)
!384 = !DILocation(line: 142, column: 15, scope: !382, inlinedAt: !378)
!385 = !DILocation(line: 142, column: 6, scope: !369, inlinedAt: !378)
!386 = !DILocation(line: 136, column: 29, scope: !369, inlinedAt: !378)
!387 = !DILocation(line: 148, column: 15, scope: !369, inlinedAt: !378)
!388 = !{!389, !266, i64 6}
!389 = !{!"ipv6hdr", !266, i64 0, !266, i64 0, !266, i64 1, !320, i64 4, !266, i64 6, !266, i64 7, !390, i64 8, !390, i64 24}
!390 = !{!"in6_addr", !266, i64 0}
!391 = !DILocation(line: 88, column: 15, scope: !392)
!392 = distinct !DILexicalBlock(scope: !379, file: !3, line: 88, column: 7)
!393 = !DILocation(line: 88, column: 7, scope: !379)
!394 = !DILocation(line: 78, column: 9, scope: !164)
!395 = !DILocalVariable(name: "nh", arg: 1, scope: !396, file: !181, line: 206, type: !279)
!396 = distinct !DISubprogram(name: "parse_icmphdr_common", scope: !181, file: !181, line: 206, type: !397, scopeLine: 209, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !400)
!397 = !DISubroutineType(types: !398)
!398 = !{!106, !279, !44, !399}
!399 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !232, size: 64)
!400 = !{!395, !401, !402, !403}
!401 = !DILocalVariable(name: "data_end", arg: 2, scope: !396, file: !181, line: 207, type: !44)
!402 = !DILocalVariable(name: "icmphdr", arg: 3, scope: !396, file: !181, line: 208, type: !399)
!403 = !DILocalVariable(name: "h", scope: !396, file: !181, line: 210, type: !232)
!404 = !DILocation(line: 0, scope: !396, inlinedAt: !405)
!405 = distinct !DILocation(line: 100, column: 14, scope: !164)
!406 = !DILocation(line: 212, column: 8, scope: !407, inlinedAt: !405)
!407 = distinct !DILexicalBlock(scope: !396, file: !181, line: 212, column: 6)
!408 = !DILocation(line: 212, column: 14, scope: !407, inlinedAt: !405)
!409 = !DILocation(line: 212, column: 12, scope: !407, inlinedAt: !405)
!410 = !DILocation(line: 212, column: 6, scope: !396, inlinedAt: !405)
!411 = !DILocation(line: 218, column: 12, scope: !396, inlinedAt: !405)
!412 = !{!413, !266, i64 0}
!413 = !{!"icmphdr_common", !266, i64 0, !266, i64 1, !320, i64 2}
!414 = !DILocation(line: 101, column: 51, scope: !252)
!415 = !DILocation(line: 101, column: 38, scope: !252)
!416 = !DILocalVariable(name: "iphdr", arg: 1, scope: !417, file: !243, line: 136, type: !197)
!417 = distinct !DISubprogram(name: "swap_src_dst_ipv4", scope: !243, file: !243, line: 136, type: !418, scopeLine: 137, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !420)
!418 = !DISubroutineType(types: !419)
!419 = !{null, !197}
!420 = !{!416, !421}
!421 = !DILocalVariable(name: "tmp", scope: !417, file: !243, line: 138, type: !70)
!422 = !DILocation(line: 0, scope: !417, inlinedAt: !423)
!423 = distinct !DILocation(line: 103, column: 3, scope: !424)
!424 = distinct !DILexicalBlock(scope: !252, file: !3, line: 101, column: 65)
!425 = !DILocation(line: 138, column: 22, scope: !417, inlinedAt: !423)
!426 = !{!364, !265, i64 12}
!427 = !DILocation(line: 140, column: 24, scope: !417, inlinedAt: !423)
!428 = !{!364, !265, i64 16}
!429 = !DILocation(line: 140, column: 15, scope: !417, inlinedAt: !423)
!430 = !DILocation(line: 141, column: 15, scope: !417, inlinedAt: !423)
!431 = !DILocation(line: 105, column: 2, scope: !424)
!432 = !DILocation(line: 105, column: 22, scope: !251)
!433 = !DILocation(line: 106, column: 19, scope: !251)
!434 = !DILocation(line: 106, column: 6, scope: !251)
!435 = !DILocation(line: 0, scope: !242, inlinedAt: !249)
!436 = !DILocation(line: 127, column: 2, scope: !242, inlinedAt: !249)
!437 = !DILocation(line: 127, column: 30, scope: !242, inlinedAt: !249)
!438 = !{i64 0, i64 16, !439, i64 0, i64 16, !439, i64 0, i64 16, !439}
!439 = !{!266, !266, i64 0}
!440 = !DILocation(line: 129, column: 22, scope: !242, inlinedAt: !249)
!441 = !DILocation(line: 130, column: 16, scope: !242, inlinedAt: !249)
!442 = !DILocation(line: 131, column: 1, scope: !242, inlinedAt: !249)
!443 = !DILocation(line: 0, scope: !254, inlinedAt: !260)
!444 = !DILocation(line: 115, column: 2, scope: !254, inlinedAt: !260)
!445 = !DILocation(line: 117, column: 2, scope: !254, inlinedAt: !260)
!446 = !DILocation(line: 118, column: 2, scope: !254, inlinedAt: !260)
!447 = !DILocation(line: 119, column: 2, scope: !254, inlinedAt: !260)
!448 = !DILocation(line: 120, column: 1, scope: !254, inlinedAt: !260)
!449 = !DILocation(line: 119, column: 22, scope: !164)
!450 = !{!413, !320, i64 2}
!451 = !DILocation(line: 120, column: 17, scope: !164)
!452 = !DILocation(line: 121, column: 17, scope: !164)
!453 = !DILocation(line: 121, column: 16, scope: !164)
!454 = !DILocation(line: 122, column: 16, scope: !164)
!455 = !DILocation(line: 123, column: 38, scope: !164)
!456 = !DILocalVariable(name: "seed", arg: 1, scope: !457, file: !3, line: 49, type: !46)
!457 = distinct !DISubprogram(name: "icmp_checksum_diff", scope: !3, file: !3, line: 48, type: !458, scopeLine: 52, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !460)
!458 = !DISubroutineType(types: !459)
!459 = !{!46, !46, !232, !232}
!460 = !{!456, !461, !462, !463, !464}
!461 = !DILocalVariable(name: "icmphdr_new", arg: 2, scope: !457, file: !3, line: 50, type: !232)
!462 = !DILocalVariable(name: "icmphdr_old", arg: 3, scope: !457, file: !3, line: 51, type: !232)
!463 = !DILocalVariable(name: "csum", scope: !457, file: !3, line: 53, type: !71)
!464 = !DILocalVariable(name: "size", scope: !457, file: !3, line: 53, type: !71)
!465 = !DILocation(line: 0, scope: !457, inlinedAt: !466)
!466 = distinct !DILocation(line: 123, column: 19, scope: !164)
!467 = !DILocation(line: 55, column: 81, scope: !457, inlinedAt: !466)
!468 = !DILocation(line: 55, column: 9, scope: !457, inlinedAt: !466)
!469 = !DILocalVariable(name: "csum", arg: 1, scope: !470, file: !3, line: 33, type: !71)
!470 = distinct !DISubprogram(name: "csum_fold_helper", scope: !3, file: !3, line: 33, type: !471, scopeLine: 34, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !473)
!471 = !DISubroutineType(types: !472)
!472 = !{!46, !71}
!473 = !{!469, !474}
!474 = !DILocalVariable(name: "sum", scope: !470, file: !3, line: 35, type: !71)
!475 = !DILocation(line: 0, scope: !470, inlinedAt: !476)
!476 = distinct !DILocation(line: 56, column: 9, scope: !457, inlinedAt: !466)
!477 = !DILocation(line: 36, column: 14, scope: !470, inlinedAt: !476)
!478 = !DILocation(line: 36, column: 29, scope: !470, inlinedAt: !476)
!479 = !DILocation(line: 36, column: 21, scope: !470, inlinedAt: !476)
!480 = !DILocation(line: 37, column: 14, scope: !470, inlinedAt: !476)
!481 = !DILocation(line: 37, column: 6, scope: !470, inlinedAt: !476)
!482 = !DILocation(line: 38, column: 9, scope: !470, inlinedAt: !476)
!483 = !DILocation(line: 123, column: 17, scope: !164)
!484 = !DILocation(line: 146, column: 2, scope: !164)
!485 = !DILocation(line: 148, column: 1, scope: !164)
!486 = !DILocation(line: 0, scope: !487, inlinedAt: !500)
!487 = distinct !DISubprogram(name: "xdp_stats_record_action", scope: !159, file: !159, line: 24, type: !488, scopeLine: 25, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !490)
!488 = !DISubroutineType(types: !489)
!489 = !{!71, !167, !71}
!490 = !{!491, !492, !493}
!491 = !DILocalVariable(name: "ctx", arg: 1, scope: !487, file: !159, line: 24, type: !167)
!492 = !DILocalVariable(name: "action", arg: 2, scope: !487, file: !159, line: 24, type: !71)
!493 = !DILocalVariable(name: "rec", scope: !487, file: !159, line: 30, type: !494)
!494 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !495, size: 64)
!495 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "datarec", file: !496, line: 10, size: 128, elements: !497)
!496 = !DIFile(filename: "./../common/xdp_stats_kern_user.h", directory: "/home/saif/Desktop/xdp-tutorial/packet-solutions")
!497 = !{!498, !499}
!498 = !DIDerivedType(tag: DW_TAG_member, name: "rx_packets", scope: !495, file: !496, line: 11, baseType: !107, size: 64)
!499 = !DIDerivedType(tag: DW_TAG_member, name: "rx_bytes", scope: !495, file: !496, line: 12, baseType: !107, size: 64, offset: 64)
!500 = distinct !DILocation(line: 149, column: 9, scope: !164)
!501 = !{!265, !265, i64 0}
!502 = !DILocation(line: 30, column: 24, scope: !487, inlinedAt: !500)
!503 = !DILocation(line: 31, column: 7, scope: !504, inlinedAt: !500)
!504 = distinct !DILexicalBlock(scope: !487, file: !159, line: 31, column: 6)
!505 = !DILocation(line: 31, column: 6, scope: !487, inlinedAt: !500)
!506 = !DILocation(line: 38, column: 7, scope: !487, inlinedAt: !500)
!507 = !DILocation(line: 38, column: 17, scope: !487, inlinedAt: !500)
!508 = !{!509, !510, i64 0}
!509 = !{!"datarec", !510, i64 0, !510, i64 8}
!510 = !{!"long long", !266, i64 0}
!511 = !DILocation(line: 39, column: 25, scope: !487, inlinedAt: !500)
!512 = !DILocation(line: 39, column: 41, scope: !487, inlinedAt: !500)
!513 = !DILocation(line: 39, column: 34, scope: !487, inlinedAt: !500)
!514 = !DILocation(line: 39, column: 19, scope: !487, inlinedAt: !500)
!515 = !DILocation(line: 39, column: 7, scope: !487, inlinedAt: !500)
!516 = !DILocation(line: 39, column: 16, scope: !487, inlinedAt: !500)
!517 = !{!509, !510, i64 8}
!518 = !DILocation(line: 41, column: 9, scope: !487, inlinedAt: !500)
!519 = !DILocation(line: 41, column: 2, scope: !487, inlinedAt: !500)
!520 = !DILocation(line: 42, column: 1, scope: !487, inlinedAt: !500)
!521 = !DILocation(line: 150, column: 1, scope: !164)
!522 = !DILocation(line: 149, column: 2, scope: !164)
!523 = distinct !DISubprogram(name: "xdp_redirect_func", scope: !3, file: !3, line: 154, type: !165, scopeLine: 155, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !524)
!524 = !{!525, !526, !527, !528, !529, !530, !531, !532, !533, !534}
!525 = !DILocalVariable(name: "ctx", arg: 1, scope: !523, file: !3, line: 154, type: !167)
!526 = !DILocalVariable(name: "data_end", scope: !523, file: !3, line: 156, type: !44)
!527 = !DILocalVariable(name: "data", scope: !523, file: !3, line: 157, type: !44)
!528 = !DILocalVariable(name: "nh", scope: !523, file: !3, line: 158, type: !180)
!529 = !DILocalVariable(name: "eth", scope: !523, file: !3, line: 159, type: !185)
!530 = !DILocalVariable(name: "eth_type", scope: !523, file: !3, line: 160, type: !106)
!531 = !DILocalVariable(name: "action", scope: !523, file: !3, line: 161, type: !106)
!532 = !DILocalVariable(name: "dst", scope: !523, file: !3, line: 162, type: !190)
!533 = !DILocalVariable(name: "ifindex", scope: !523, file: !3, line: 163, type: !7)
!534 = !DILabel(scope: !523, name: "out", file: !3, line: 177)
!535 = !DILocation(line: 0, scope: !523)
!536 = !DILocation(line: 156, column: 38, scope: !523)
!537 = !DILocation(line: 156, column: 27, scope: !523)
!538 = !DILocation(line: 156, column: 19, scope: !523)
!539 = !DILocation(line: 157, column: 34, scope: !523)
!540 = !DILocation(line: 157, column: 23, scope: !523)
!541 = !DILocation(line: 157, column: 15, scope: !523)
!542 = !DILocation(line: 162, column: 2, scope: !523)
!543 = !DILocation(line: 162, column: 16, scope: !523)
!544 = !DILocation(line: 0, scope: !276, inlinedAt: !545)
!545 = distinct !DILocation(line: 169, column: 13, scope: !523)
!546 = !DILocation(line: 0, scope: !287, inlinedAt: !547)
!547 = distinct !DILocation(line: 129, column: 9, scope: !276, inlinedAt: !545)
!548 = !DILocation(line: 93, column: 14, scope: !314, inlinedAt: !547)
!549 = !DILocation(line: 93, column: 24, scope: !314, inlinedAt: !547)
!550 = !DILocation(line: 93, column: 6, scope: !287, inlinedAt: !547)
!551 = !DILocation(line: 97, column: 10, scope: !287, inlinedAt: !547)
!552 = !DILocation(line: 174, column: 2, scope: !523)
!553 = !DILocation(line: 175, column: 11, scope: !523)
!554 = !DILocation(line: 177, column: 1, scope: !523)
!555 = !DILocation(line: 0, scope: !487, inlinedAt: !556)
!556 = distinct !DILocation(line: 178, column: 9, scope: !523)
!557 = !DILocation(line: 26, column: 13, scope: !558, inlinedAt: !556)
!558 = distinct !DILexicalBlock(scope: !487, file: !159, line: 26, column: 6)
!559 = !DILocation(line: 26, column: 6, scope: !487, inlinedAt: !556)
!560 = !DILocation(line: 30, column: 24, scope: !487, inlinedAt: !556)
!561 = !DILocation(line: 31, column: 7, scope: !504, inlinedAt: !556)
!562 = !DILocation(line: 31, column: 6, scope: !487, inlinedAt: !556)
!563 = !DILocation(line: 38, column: 7, scope: !487, inlinedAt: !556)
!564 = !DILocation(line: 38, column: 17, scope: !487, inlinedAt: !556)
!565 = !DILocation(line: 39, column: 25, scope: !487, inlinedAt: !556)
!566 = !DILocation(line: 39, column: 41, scope: !487, inlinedAt: !556)
!567 = !DILocation(line: 39, column: 34, scope: !487, inlinedAt: !556)
!568 = !DILocation(line: 39, column: 19, scope: !487, inlinedAt: !556)
!569 = !DILocation(line: 39, column: 7, scope: !487, inlinedAt: !556)
!570 = !DILocation(line: 39, column: 16, scope: !487, inlinedAt: !556)
!571 = !DILocation(line: 41, column: 9, scope: !487, inlinedAt: !556)
!572 = !DILocation(line: 41, column: 2, scope: !487, inlinedAt: !556)
!573 = !DILocation(line: 42, column: 1, scope: !487, inlinedAt: !556)
!574 = !DILocation(line: 179, column: 1, scope: !523)
!575 = !DILocation(line: 178, column: 2, scope: !523)
!576 = distinct !DISubprogram(name: "xdp_redirect_map_func", scope: !3, file: !3, line: 183, type: !165, scopeLine: 184, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !577)
!577 = !{!578, !579, !580, !581, !582, !583, !584, !585, !587}
!578 = !DILocalVariable(name: "ctx", arg: 1, scope: !576, file: !3, line: 183, type: !167)
!579 = !DILocalVariable(name: "data_end", scope: !576, file: !3, line: 185, type: !44)
!580 = !DILocalVariable(name: "data", scope: !576, file: !3, line: 186, type: !44)
!581 = !DILocalVariable(name: "nh", scope: !576, file: !3, line: 187, type: !180)
!582 = !DILocalVariable(name: "eth", scope: !576, file: !3, line: 188, type: !185)
!583 = !DILocalVariable(name: "eth_type", scope: !576, file: !3, line: 189, type: !106)
!584 = !DILocalVariable(name: "action", scope: !576, file: !3, line: 190, type: !106)
!585 = !DILocalVariable(name: "dst", scope: !576, file: !3, line: 191, type: !586)
!586 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!587 = !DILabel(scope: !576, name: "out", file: !3, line: 210)
!588 = !DILocation(line: 0, scope: !576)
!589 = !DILocation(line: 185, column: 38, scope: !576)
!590 = !DILocation(line: 185, column: 27, scope: !576)
!591 = !DILocation(line: 185, column: 19, scope: !576)
!592 = !DILocation(line: 186, column: 34, scope: !576)
!593 = !DILocation(line: 186, column: 23, scope: !576)
!594 = !DILocation(line: 186, column: 15, scope: !576)
!595 = !DILocation(line: 0, scope: !276, inlinedAt: !596)
!596 = distinct !DILocation(line: 197, column: 13, scope: !576)
!597 = !DILocation(line: 0, scope: !287, inlinedAt: !598)
!598 = distinct !DILocation(line: 129, column: 9, scope: !276, inlinedAt: !596)
!599 = !DILocation(line: 93, column: 14, scope: !314, inlinedAt: !598)
!600 = !DILocation(line: 93, column: 24, scope: !314, inlinedAt: !598)
!601 = !DILocation(line: 93, column: 6, scope: !287, inlinedAt: !598)
!602 = !DILocation(line: 97, column: 10, scope: !287, inlinedAt: !598)
!603 = !DILocation(line: 202, column: 46, scope: !576)
!604 = !DILocation(line: 202, column: 8, scope: !576)
!605 = !DILocation(line: 203, column: 7, scope: !606)
!606 = distinct !DILexicalBlock(scope: !576, file: !3, line: 203, column: 6)
!607 = !DILocation(line: 203, column: 6, scope: !576)
!608 = !DILocation(line: 210, column: 1, scope: !576)
!609 = !DILocation(line: 0, scope: !487, inlinedAt: !610)
!610 = distinct !DILocation(line: 211, column: 9, scope: !576)
!611 = !DILocation(line: 26, column: 6, scope: !487, inlinedAt: !610)
!612 = !DILocation(line: 207, column: 2, scope: !576)
!613 = !DILocation(line: 208, column: 11, scope: !576)
!614 = !DILocation(line: 26, column: 13, scope: !558, inlinedAt: !610)
!615 = !DILocation(line: 30, column: 24, scope: !487, inlinedAt: !610)
!616 = !DILocation(line: 31, column: 7, scope: !504, inlinedAt: !610)
!617 = !DILocation(line: 31, column: 6, scope: !487, inlinedAt: !610)
!618 = !DILocation(line: 38, column: 7, scope: !487, inlinedAt: !610)
!619 = !DILocation(line: 38, column: 17, scope: !487, inlinedAt: !610)
!620 = !DILocation(line: 39, column: 25, scope: !487, inlinedAt: !610)
!621 = !DILocation(line: 39, column: 41, scope: !487, inlinedAt: !610)
!622 = !DILocation(line: 39, column: 34, scope: !487, inlinedAt: !610)
!623 = !DILocation(line: 39, column: 19, scope: !487, inlinedAt: !610)
!624 = !DILocation(line: 39, column: 7, scope: !487, inlinedAt: !610)
!625 = !DILocation(line: 39, column: 16, scope: !487, inlinedAt: !610)
!626 = !DILocation(line: 41, column: 9, scope: !487, inlinedAt: !610)
!627 = !DILocation(line: 41, column: 2, scope: !487, inlinedAt: !610)
!628 = !DILocation(line: 42, column: 1, scope: !487, inlinedAt: !610)
!629 = !DILocation(line: 211, column: 2, scope: !576)
!630 = distinct !DISubprogram(name: "xdp_router_func", scope: !3, file: !3, line: 231, type: !165, scopeLine: 232, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !631)
!631 = !{!632, !633, !634, !635, !636, !637, !638, !639, !640, !641, !642, !643, !647, !648}
!632 = !DILocalVariable(name: "ctx", arg: 1, scope: !630, file: !3, line: 231, type: !167)
!633 = !DILocalVariable(name: "data_end", scope: !630, file: !3, line: 233, type: !44)
!634 = !DILocalVariable(name: "data", scope: !630, file: !3, line: 234, type: !44)
!635 = !DILocalVariable(name: "fib_params", scope: !630, file: !3, line: 235, type: !127)
!636 = !DILocalVariable(name: "eth", scope: !630, file: !3, line: 236, type: !185)
!637 = !DILocalVariable(name: "ip6h", scope: !630, file: !3, line: 237, type: !214)
!638 = !DILocalVariable(name: "iph", scope: !630, file: !3, line: 238, type: !197)
!639 = !DILocalVariable(name: "h_proto", scope: !630, file: !3, line: 239, type: !46)
!640 = !DILocalVariable(name: "nh_off", scope: !630, file: !3, line: 240, type: !107)
!641 = !DILocalVariable(name: "rc", scope: !630, file: !3, line: 241, type: !106)
!642 = !DILocalVariable(name: "action", scope: !630, file: !3, line: 242, type: !106)
!643 = !DILocalVariable(name: "src", scope: !644, file: !3, line: 271, type: !49)
!644 = distinct !DILexicalBlock(scope: !645, file: !3, line: 270, column: 47)
!645 = distinct !DILexicalBlock(scope: !646, file: !3, line: 270, column: 13)
!646 = distinct !DILexicalBlock(scope: !630, file: !3, line: 251, column: 6)
!647 = !DILocalVariable(name: "dst", scope: !644, file: !3, line: 272, type: !49)
!648 = !DILabel(scope: !630, name: "out", file: !3, line: 323)
!649 = !DILocation(line: 0, scope: !630)
!650 = !DILocation(line: 233, column: 38, scope: !630)
!651 = !DILocation(line: 233, column: 27, scope: !630)
!652 = !DILocation(line: 233, column: 19, scope: !630)
!653 = !DILocation(line: 234, column: 34, scope: !630)
!654 = !DILocation(line: 234, column: 23, scope: !630)
!655 = !DILocation(line: 234, column: 15, scope: !630)
!656 = !DILocation(line: 235, column: 2, scope: !630)
!657 = !DILocation(line: 235, column: 24, scope: !630)
!658 = !DILocation(line: 236, column: 23, scope: !630)
!659 = !DILocation(line: 245, column: 11, scope: !660)
!660 = distinct !DILexicalBlock(scope: !630, file: !3, line: 245, column: 6)
!661 = !DILocation(line: 245, column: 20, scope: !660)
!662 = !DILocation(line: 245, column: 6, scope: !630)
!663 = !DILocation(line: 250, column: 17, scope: !630)
!664 = !{!665, !320, i64 12}
!665 = !{!"ethhdr", !266, i64 0, !266, i64 6, !320, i64 12}
!666 = !DILocation(line: 251, column: 14, scope: !646)
!667 = !DILocation(line: 251, column: 6, scope: !630)
!668 = !DILocation(line: 252, column: 9, scope: !669)
!669 = distinct !DILexicalBlock(scope: !646, file: !3, line: 251, column: 38)
!670 = !DILocation(line: 254, column: 11, scope: !671)
!671 = distinct !DILexicalBlock(scope: !669, file: !3, line: 254, column: 7)
!672 = !DILocation(line: 254, column: 17, scope: !671)
!673 = !DILocation(line: 254, column: 15, scope: !671)
!674 = !DILocation(line: 254, column: 7, scope: !669)
!675 = !DILocation(line: 259, column: 12, scope: !676)
!676 = distinct !DILexicalBlock(scope: !669, file: !3, line: 259, column: 7)
!677 = !{!364, !266, i64 8}
!678 = !DILocation(line: 259, column: 16, scope: !676)
!679 = !DILocation(line: 259, column: 7, scope: !669)
!680 = !DILocation(line: 262, column: 21, scope: !669)
!681 = !{!682, !266, i64 0}
!682 = !{!"bpf_fib_lookup", !266, i64 0, !266, i64 1, !320, i64 2, !320, i64 4, !320, i64 6, !265, i64 8, !266, i64 12, !266, i64 16, !266, i64 32, !320, i64 48, !320, i64 50, !266, i64 52, !266, i64 58}
!683 = !DILocation(line: 263, column: 26, scope: !669)
!684 = !{!364, !266, i64 1}
!685 = !DILocation(line: 263, column: 14, scope: !669)
!686 = !DILocation(line: 263, column: 19, scope: !669)
!687 = !DILocation(line: 264, column: 33, scope: !669)
!688 = !DILocation(line: 264, column: 14, scope: !669)
!689 = !DILocation(line: 264, column: 26, scope: !669)
!690 = !{!682, !266, i64 1}
!691 = !DILocation(line: 265, column: 14, scope: !669)
!692 = !DILocation(line: 265, column: 20, scope: !669)
!693 = !{!682, !320, i64 2}
!694 = !DILocation(line: 266, column: 14, scope: !669)
!695 = !DILocation(line: 266, column: 20, scope: !669)
!696 = !{!682, !320, i64 4}
!697 = !DILocation(line: 267, column: 24, scope: !669)
!698 = !{!364, !320, i64 2}
!699 = !DILocation(line: 267, column: 14, scope: !669)
!700 = !DILocation(line: 267, column: 22, scope: !669)
!701 = !{!682, !320, i64 6}
!702 = !DILocation(line: 268, column: 30, scope: !669)
!703 = !DILocation(line: 268, column: 14, scope: !669)
!704 = !DILocation(line: 268, column: 23, scope: !669)
!705 = !DILocation(line: 269, column: 30, scope: !669)
!706 = !DILocation(line: 269, column: 14, scope: !669)
!707 = !DILocation(line: 269, column: 23, scope: !669)
!708 = !DILocation(line: 270, column: 2, scope: !669)
!709 = !DILocation(line: 270, column: 21, scope: !645)
!710 = !DILocation(line: 270, column: 13, scope: !646)
!711 = !DILocation(line: 271, column: 46, scope: !644)
!712 = !DILocation(line: 0, scope: !644)
!713 = !DILocation(line: 272, column: 46, scope: !644)
!714 = !DILocation(line: 274, column: 10, scope: !644)
!715 = !DILocation(line: 275, column: 12, scope: !716)
!716 = distinct !DILexicalBlock(scope: !644, file: !3, line: 275, column: 7)
!717 = !DILocation(line: 275, column: 18, scope: !716)
!718 = !DILocation(line: 275, column: 16, scope: !716)
!719 = !DILocation(line: 275, column: 7, scope: !644)
!720 = !DILocation(line: 280, column: 13, scope: !721)
!721 = distinct !DILexicalBlock(scope: !644, file: !3, line: 280, column: 7)
!722 = !{!389, !266, i64 7}
!723 = !DILocation(line: 280, column: 23, scope: !721)
!724 = !DILocation(line: 280, column: 7, scope: !644)
!725 = !DILocation(line: 283, column: 21, scope: !644)
!726 = !DILocation(line: 284, column: 25, scope: !644)
!727 = !DILocation(line: 284, column: 42, scope: !644)
!728 = !DILocation(line: 284, column: 14, scope: !644)
!729 = !DILocation(line: 284, column: 23, scope: !644)
!730 = !DILocation(line: 285, column: 34, scope: !644)
!731 = !DILocation(line: 285, column: 14, scope: !644)
!732 = !DILocation(line: 285, column: 26, scope: !644)
!733 = !DILocation(line: 286, column: 14, scope: !644)
!734 = !DILocation(line: 286, column: 20, scope: !644)
!735 = !DILocation(line: 287, column: 14, scope: !644)
!736 = !DILocation(line: 287, column: 20, scope: !644)
!737 = !DILocation(line: 288, column: 24, scope: !644)
!738 = !{!389, !320, i64 4}
!739 = !DILocation(line: 288, column: 14, scope: !644)
!740 = !DILocation(line: 288, column: 22, scope: !644)
!741 = !DILocation(line: 289, column: 18, scope: !644)
!742 = !DILocation(line: 290, column: 18, scope: !644)
!743 = !DILocation(line: 295, column: 28, scope: !630)
!744 = !{!264, !265, i64 12}
!745 = !DILocation(line: 295, column: 13, scope: !630)
!746 = !DILocation(line: 295, column: 21, scope: !630)
!747 = !{!682, !265, i64 8}
!748 = !DILocation(line: 297, column: 22, scope: !630)
!749 = !DILocation(line: 297, column: 7, scope: !630)
!750 = !DILocation(line: 298, column: 2, scope: !630)
!751 = !DILocation(line: 300, column: 7, scope: !752)
!752 = distinct !DILexicalBlock(scope: !630, file: !3, line: 298, column: 14)
!753 = !DILocalVariable(name: "iph", arg: 1, scope: !754, file: !3, line: 221, type: !197)
!754 = distinct !DISubprogram(name: "ip_decrease_ttl", scope: !3, file: !3, line: 221, type: !755, scopeLine: 222, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !757)
!755 = !DISubroutineType(types: !756)
!756 = !{!106, !197}
!757 = !{!753, !758}
!758 = !DILocalVariable(name: "check", scope: !754, file: !3, line: 223, type: !71)
!759 = !DILocation(line: 0, scope: !754, inlinedAt: !760)
!760 = distinct !DILocation(line: 301, column: 4, scope: !761)
!761 = distinct !DILexicalBlock(scope: !752, file: !3, line: 300, column: 7)
!762 = !DILocation(line: 223, column: 21, scope: !754, inlinedAt: !760)
!763 = !{!364, !320, i64 10}
!764 = !DILocation(line: 224, column: 8, scope: !754, inlinedAt: !760)
!765 = !DILocation(line: 225, column: 38, scope: !754, inlinedAt: !760)
!766 = !DILocation(line: 225, column: 29, scope: !754, inlinedAt: !760)
!767 = !DILocation(line: 225, column: 13, scope: !754, inlinedAt: !760)
!768 = !DILocation(line: 226, column: 16, scope: !754, inlinedAt: !760)
!769 = !DILocation(line: 226, column: 9, scope: !754, inlinedAt: !760)
!770 = !DILocation(line: 301, column: 4, scope: !761)
!771 = !DILocation(line: 302, column: 20, scope: !772)
!772 = distinct !DILexicalBlock(scope: !761, file: !3, line: 302, column: 12)
!773 = !DILocation(line: 302, column: 12, scope: !761)
!774 = !DILocation(line: 303, column: 10, scope: !772)
!775 = !DILocation(line: 303, column: 19, scope: !772)
!776 = !DILocation(line: 303, column: 4, scope: !772)
!777 = !DILocation(line: 313, column: 3, scope: !752)
!778 = !DILocation(line: 323, column: 1, scope: !630)
!779 = !DILocation(line: 0, scope: !487, inlinedAt: !780)
!780 = distinct !DILocation(line: 324, column: 9, scope: !630)
!781 = !DILocation(line: 26, column: 6, scope: !487, inlinedAt: !780)
!782 = !DILocation(line: 305, column: 3, scope: !752)
!783 = !DILocation(line: 306, column: 3, scope: !752)
!784 = !DILocation(line: 307, column: 36, scope: !752)
!785 = !DILocation(line: 307, column: 12, scope: !752)
!786 = !DILocation(line: 26, column: 13, scope: !558, inlinedAt: !780)
!787 = !DILocation(line: 30, column: 24, scope: !487, inlinedAt: !780)
!788 = !DILocation(line: 31, column: 7, scope: !504, inlinedAt: !780)
!789 = !DILocation(line: 31, column: 6, scope: !487, inlinedAt: !780)
!790 = !DILocation(line: 38, column: 7, scope: !487, inlinedAt: !780)
!791 = !DILocation(line: 38, column: 17, scope: !487, inlinedAt: !780)
!792 = !DILocation(line: 39, column: 25, scope: !487, inlinedAt: !780)
!793 = !DILocation(line: 39, column: 41, scope: !487, inlinedAt: !780)
!794 = !DILocation(line: 39, column: 34, scope: !487, inlinedAt: !780)
!795 = !DILocation(line: 39, column: 19, scope: !487, inlinedAt: !780)
!796 = !DILocation(line: 39, column: 7, scope: !487, inlinedAt: !780)
!797 = !DILocation(line: 39, column: 16, scope: !487, inlinedAt: !780)
!798 = !DILocation(line: 41, column: 9, scope: !487, inlinedAt: !780)
!799 = !DILocation(line: 41, column: 2, scope: !487, inlinedAt: !780)
!800 = !DILocation(line: 42, column: 1, scope: !487, inlinedAt: !780)
!801 = !DILocation(line: 325, column: 1, scope: !630)
!802 = distinct !DISubprogram(name: "xdp_pass_func", scope: !3, file: !3, line: 328, type: !165, scopeLine: 329, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !803)
!803 = !{!804}
!804 = !DILocalVariable(name: "ctx", arg: 1, scope: !802, file: !3, line: 328, type: !167)
!805 = !DILocation(line: 0, scope: !802)
!806 = !DILocation(line: 330, column: 2, scope: !802)
