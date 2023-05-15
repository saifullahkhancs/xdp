; ModuleID = 'xdp_prog_kern.c'
source_filename = "xdp_prog_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-n32:64-S128"
target triple = "bpf"

%struct.xdp_md = type { i32, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }

@__const.xdp_prog_simple.____fmt = private unnamed_addr constant [33 x i8] c"src: %llu, dst: %llu, proto: %u\0A\00", align 1
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !0
@llvm.used = appending global [2 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_prog_simple to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_prog_simple(%struct.xdp_md* nocapture readonly %0) #0 section "xdp" !dbg !39 {
  %2 = alloca [33 x i8], align 1
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !51, metadata !DIExpression()), !dbg !76
  %3 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !77
  %4 = load i32, i32* %3, align 4, !dbg !77, !tbaa !78
  %5 = zext i32 %4 to i64, !dbg !83
  %6 = inttoptr i64 %5 to i8*, !dbg !84
  call void @llvm.dbg.value(metadata i8* %6, metadata !52, metadata !DIExpression()), !dbg !76
  %7 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !85
  %8 = load i32, i32* %7, align 4, !dbg !85, !tbaa !86
  %9 = zext i32 %8 to i64, !dbg !87
  %10 = inttoptr i64 %9 to i8*, !dbg !88
  call void @llvm.dbg.value(metadata i8* %10, metadata !53, metadata !DIExpression()), !dbg !76
  %11 = inttoptr i64 %5 to %struct.ethhdr*, !dbg !89
  call void @llvm.dbg.value(metadata %struct.ethhdr* %11, metadata !54, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.value(metadata i64 14, metadata !68, metadata !DIExpression()), !dbg !76
  %12 = getelementptr i8, i8* %6, i64 14, !dbg !90
  %13 = icmp ugt i8* %12, %10, !dbg !92
  br i1 %13, label %77, label %14, !dbg !93

14:                                               ; preds = %1
  %15 = getelementptr inbounds [33 x i8], [33 x i8]* %2, i64 0, i64 0, !dbg !94
  call void @llvm.lifetime.start.p0i8(i64 33, i8* nonnull %15) #3, !dbg !94
  call void @llvm.dbg.declare(metadata [33 x i8]* %2, metadata !71, metadata !DIExpression()), !dbg !94
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(33) %15, i8* nonnull align 1 dereferenceable(33) getelementptr inbounds ([33 x i8], [33 x i8]* @__const.xdp_prog_simple.____fmt, i64 0, i64 0), i64 33, i1 false), !dbg !94
  %16 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %11, i64 0, i32 1, i64 0, !dbg !94
  call void @llvm.dbg.value(metadata i8* %16, metadata !95, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.value(metadata i64 5, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.value(metadata i64 0, metadata !103, metadata !DIExpression()), !dbg !105
  %17 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %11, i64 0, i32 1, i64 5, !dbg !107
  %18 = load i8, i8* %17, align 1, !dbg !107, !tbaa !110
  %19 = zext i8 %18 to i64, !dbg !107
  call void @llvm.dbg.value(metadata i64 %19, metadata !103, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.value(metadata i64 4, metadata !104, metadata !DIExpression()), !dbg !105
  %20 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %11, i64 0, i32 1, i64 4, !dbg !107
  %21 = load i8, i8* %20, align 1, !dbg !107, !tbaa !110
  %22 = zext i8 %21 to i64, !dbg !107
  call void @llvm.dbg.value(metadata i64 undef, metadata !103, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.value(metadata i64 3, metadata !104, metadata !DIExpression()), !dbg !105
  %23 = shl nuw nsw i64 %19, 16, !dbg !111
  %24 = shl nuw nsw i64 %22, 8, !dbg !111
  %25 = or i64 %24, %23, !dbg !111
  %26 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %11, i64 0, i32 1, i64 3, !dbg !107
  %27 = load i8, i8* %26, align 1, !dbg !107, !tbaa !110
  %28 = zext i8 %27 to i64, !dbg !107
  %29 = or i64 %25, %28, !dbg !112
  call void @llvm.dbg.value(metadata i64 %29, metadata !103, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.value(metadata i64 2, metadata !104, metadata !DIExpression()), !dbg !105
  %30 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %11, i64 0, i32 1, i64 2, !dbg !107
  %31 = load i8, i8* %30, align 1, !dbg !107, !tbaa !110
  %32 = zext i8 %31 to i64, !dbg !107
  call void @llvm.dbg.value(metadata i64 undef, metadata !103, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.value(metadata i64 1, metadata !104, metadata !DIExpression()), !dbg !105
  %33 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %11, i64 0, i32 1, i64 1, !dbg !107
  %34 = load i8, i8* %33, align 1, !dbg !107, !tbaa !110
  %35 = zext i8 %34 to i64, !dbg !107
  call void @llvm.dbg.value(metadata i64 undef, metadata !103, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.value(metadata i64 0, metadata !104, metadata !DIExpression()), !dbg !105
  %36 = shl nuw nsw i64 %29, 24, !dbg !111
  %37 = shl nuw nsw i64 %32, 16, !dbg !111
  %38 = shl nuw nsw i64 %35, 8, !dbg !111
  %39 = or i64 %37, %38, !dbg !111
  %40 = or i64 %36, %39, !dbg !111
  %41 = load i8, i8* %16, align 1, !dbg !107, !tbaa !110
  %42 = zext i8 %41 to i64, !dbg !107
  %43 = or i64 %40, %42, !dbg !112
  call void @llvm.dbg.value(metadata i64 %43, metadata !103, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.value(metadata i64 -1, metadata !104, metadata !DIExpression()), !dbg !105
  %44 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %11, i64 0, i32 0, i64 0, !dbg !94
  call void @llvm.dbg.value(metadata i8* %44, metadata !95, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.value(metadata i64 5, metadata !104, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.value(metadata i64 0, metadata !103, metadata !DIExpression()), !dbg !113
  %45 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %11, i64 0, i32 0, i64 5, !dbg !115
  %46 = load i8, i8* %45, align 1, !dbg !115, !tbaa !110
  %47 = zext i8 %46 to i64, !dbg !115
  call void @llvm.dbg.value(metadata i64 %47, metadata !103, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.value(metadata i64 4, metadata !104, metadata !DIExpression()), !dbg !113
  %48 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %11, i64 0, i32 0, i64 4, !dbg !115
  %49 = load i8, i8* %48, align 1, !dbg !115, !tbaa !110
  %50 = zext i8 %49 to i64, !dbg !115
  call void @llvm.dbg.value(metadata i64 undef, metadata !103, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.value(metadata i64 3, metadata !104, metadata !DIExpression()), !dbg !113
  %51 = shl nuw nsw i64 %47, 16, !dbg !116
  %52 = shl nuw nsw i64 %50, 8, !dbg !116
  %53 = or i64 %52, %51, !dbg !116
  %54 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %11, i64 0, i32 0, i64 3, !dbg !115
  %55 = load i8, i8* %54, align 1, !dbg !115, !tbaa !110
  %56 = zext i8 %55 to i64, !dbg !115
  %57 = or i64 %53, %56, !dbg !117
  call void @llvm.dbg.value(metadata i64 %57, metadata !103, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.value(metadata i64 2, metadata !104, metadata !DIExpression()), !dbg !113
  %58 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %11, i64 0, i32 0, i64 2, !dbg !115
  %59 = load i8, i8* %58, align 1, !dbg !115, !tbaa !110
  %60 = zext i8 %59 to i64, !dbg !115
  call void @llvm.dbg.value(metadata i64 undef, metadata !103, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.value(metadata i64 1, metadata !104, metadata !DIExpression()), !dbg !113
  %61 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %11, i64 0, i32 0, i64 1, !dbg !115
  %62 = load i8, i8* %61, align 1, !dbg !115, !tbaa !110
  %63 = zext i8 %62 to i64, !dbg !115
  call void @llvm.dbg.value(metadata i64 undef, metadata !103, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.value(metadata i64 0, metadata !104, metadata !DIExpression()), !dbg !113
  %64 = shl nuw nsw i64 %57, 24, !dbg !116
  %65 = shl nuw nsw i64 %60, 16, !dbg !116
  %66 = shl nuw nsw i64 %63, 8, !dbg !116
  %67 = or i64 %65, %66, !dbg !116
  %68 = or i64 %64, %67, !dbg !116
  %69 = load i8, i8* %44, align 1, !dbg !115, !tbaa !110
  %70 = zext i8 %69 to i64, !dbg !115
  %71 = or i64 %68, %70, !dbg !117
  call void @llvm.dbg.value(metadata i64 %71, metadata !103, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.value(metadata i64 -1, metadata !104, metadata !DIExpression()), !dbg !113
  %72 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %11, i64 0, i32 2, !dbg !94
  %73 = load i16, i16* %72, align 1, !dbg !94, !tbaa !118
  %74 = tail call i16 @llvm.bswap.i16(i16 %73)
  %75 = zext i16 %74 to i32, !dbg !94
  %76 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %15, i32 33, i64 %43, i64 %71, i32 %75) #3, !dbg !94
  call void @llvm.lifetime.end.p0i8(i64 33, i8* nonnull %15) #3, !dbg !121
  br label %77, !dbg !122

77:                                               ; preds = %1, %14
  %78 = phi i32 [ 2, %14 ], [ 0, %1 ], !dbg !76
  ret i32 %78, !dbg !123
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!35, !36, !37}
!llvm.ident = !{!38}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 49, type: !32, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !14, globals: !20, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "xdp_prog_kern.c", directory: "/home/saif/Desktop/xdp-tutorial/tracing03-xdp-debug-print")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 2845, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "../headers/linux/bpf.h", directory: "/home/saif/Desktop/xdp-tutorial/tracing03-xdp-debug-print")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13}
!9 = !DIEnumerator(name: "XDP_ABORTED", value: 0, isUnsigned: true)
!10 = !DIEnumerator(name: "XDP_DROP", value: 1, isUnsigned: true)
!11 = !DIEnumerator(name: "XDP_PASS", value: 2, isUnsigned: true)
!12 = !DIEnumerator(name: "XDP_TX", value: 3, isUnsigned: true)
!13 = !DIEnumerator(name: "XDP_REDIRECT", value: 4, isUnsigned: true)
!14 = !{!15, !16, !17}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!16 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !18, line: 24, baseType: !19)
!18 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "")
!19 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!20 = !{!0, !21}
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "bpf_trace_printk", scope: !2, file: !23, line: 152, type: !24, isLocal: true, isDefinition: true)
!23 = !DIFile(filename: "../libbpf/src//build/usr/include/bpf/bpf_helper_defs.h", directory: "/home/saif/Desktop/xdp-tutorial/tracing03-xdp-debug-print")
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DISubroutineType(types: !26)
!26 = !{!27, !28, !31, null}
!27 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !30)
!30 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !18, line: 27, baseType: !7)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 32, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 4)
!35 = !{i32 7, !"Dwarf Version", i32 4}
!36 = !{i32 2, !"Debug Info Version", i32 3}
!37 = !{i32 1, !"wchar_size", i32 4}
!38 = !{!"clang version 10.0.0-4ubuntu1 "}
!39 = distinct !DISubprogram(name: "xdp_prog_simple", scope: !3, file: !3, line: 31, type: !40, scopeLine: 32, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !50)
!40 = !DISubroutineType(types: !41)
!41 = !{!27, !42}
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!43 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 2856, size: 160, elements: !44)
!44 = !{!45, !46, !47, !48, !49}
!45 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !43, file: !6, line: 2857, baseType: !31, size: 32)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !43, file: !6, line: 2858, baseType: !31, size: 32, offset: 32)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !43, file: !6, line: 2859, baseType: !31, size: 32, offset: 64)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !43, file: !6, line: 2861, baseType: !31, size: 32, offset: 96)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !43, file: !6, line: 2862, baseType: !31, size: 32, offset: 128)
!50 = !{!51, !52, !53, !54, !68, !71}
!51 = !DILocalVariable(name: "ctx", arg: 1, scope: !39, file: !3, line: 31, type: !42)
!52 = !DILocalVariable(name: "data", scope: !39, file: !3, line: 33, type: !15)
!53 = !DILocalVariable(name: "data_end", scope: !39, file: !3, line: 34, type: !15)
!54 = !DILocalVariable(name: "eth", scope: !39, file: !3, line: 35, type: !55)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !57, line: 163, size: 112, elements: !58)
!57 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "")
!58 = !{!59, !64, !65}
!59 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !56, file: !57, line: 164, baseType: !60, size: 48)
!60 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 48, elements: !62)
!61 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!62 = !{!63}
!63 = !DISubrange(count: 6)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !56, file: !57, line: 165, baseType: !60, size: 48, offset: 48)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !56, file: !57, line: 166, baseType: !66, size: 16, offset: 96)
!66 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !67, line: 25, baseType: !17)
!67 = !DIFile(filename: "/usr/include/linux/types.h", directory: "")
!68 = !DILocalVariable(name: "offset", scope: !39, file: !3, line: 36, type: !69)
!69 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !18, line: 31, baseType: !70)
!70 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!71 = !DILocalVariable(name: "____fmt", scope: !72, file: !3, line: 41, type: !73)
!72 = distinct !DILexicalBlock(scope: !39, file: !3, line: 41, column: 2)
!73 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 264, elements: !74)
!74 = !{!75}
!75 = !DISubrange(count: 33)
!76 = !DILocation(line: 0, scope: !39)
!77 = !DILocation(line: 33, column: 34, scope: !39)
!78 = !{!79, !80, i64 0}
!79 = !{!"xdp_md", !80, i64 0, !80, i64 4, !80, i64 8, !80, i64 12, !80, i64 16}
!80 = !{!"int", !81, i64 0}
!81 = !{!"omnipotent char", !82, i64 0}
!82 = !{!"Simple C/C++ TBAA"}
!83 = !DILocation(line: 33, column: 23, scope: !39)
!84 = !DILocation(line: 33, column: 15, scope: !39)
!85 = !DILocation(line: 34, column: 38, scope: !39)
!86 = !{!79, !80, i64 4}
!87 = !DILocation(line: 34, column: 27, scope: !39)
!88 = !DILocation(line: 34, column: 19, scope: !39)
!89 = !DILocation(line: 35, column: 23, scope: !39)
!90 = !DILocation(line: 38, column: 18, scope: !91)
!91 = distinct !DILexicalBlock(scope: !39, file: !3, line: 38, column: 6)
!92 = !DILocation(line: 38, column: 27, scope: !91)
!93 = !DILocation(line: 38, column: 6, scope: !39)
!94 = !DILocation(line: 41, column: 2, scope: !72)
!95 = !DILocalVariable(name: "addr", arg: 1, scope: !96, file: !3, line: 20, type: !99)
!96 = distinct !DISubprogram(name: "ether_addr_to_u64", scope: !3, file: !3, line: 20, type: !97, scopeLine: 21, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !102)
!97 = !DISubroutineType(types: !98)
!98 = !{!69, !99}
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !101)
!101 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !18, line: 21, baseType: !61)
!102 = !{!95, !103, !104}
!103 = !DILocalVariable(name: "u", scope: !96, file: !3, line: 22, type: !69)
!104 = !DILocalVariable(name: "i", scope: !96, file: !3, line: 23, type: !27)
!105 = !DILocation(line: 0, scope: !96, inlinedAt: !106)
!106 = distinct !DILocation(line: 41, column: 2, scope: !72)
!107 = !DILocation(line: 26, column: 16, scope: !108, inlinedAt: !106)
!108 = distinct !DILexicalBlock(scope: !109, file: !3, line: 25, column: 2)
!109 = distinct !DILexicalBlock(scope: !96, file: !3, line: 25, column: 2)
!110 = !{!81, !81, i64 0}
!111 = !DILocation(line: 26, column: 9, scope: !108, inlinedAt: !106)
!112 = !DILocation(line: 26, column: 14, scope: !108, inlinedAt: !106)
!113 = !DILocation(line: 0, scope: !96, inlinedAt: !114)
!114 = distinct !DILocation(line: 41, column: 2, scope: !72)
!115 = !DILocation(line: 26, column: 16, scope: !108, inlinedAt: !114)
!116 = !DILocation(line: 26, column: 9, scope: !108, inlinedAt: !114)
!117 = !DILocation(line: 26, column: 14, scope: !108, inlinedAt: !114)
!118 = !{!119, !120, i64 12}
!119 = !{!"ethhdr", !81, i64 0, !81, i64 6, !120, i64 12}
!120 = !{!"short", !81, i64 0}
!121 = !DILocation(line: 41, column: 2, scope: !39)
!122 = !DILocation(line: 46, column: 2, scope: !39)
!123 = !DILocation(line: 47, column: 1, scope: !39)
