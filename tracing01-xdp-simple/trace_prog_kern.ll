; ModuleID = 'trace_prog_kern.c'
source_filename = "trace_prog_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-n32:64-S128"
target triple = "bpf"

%struct.bpf_map_def = type { i32, i32, i32, i32, i32 }
%struct.xdp_exception_ctx = type { i64, i32, i32, i32 }

@xdp_stats_map = dso_local global %struct.bpf_map_def { i32 5, i32 4, i32 8, i32 10, i32 0 }, section "maps", align 4, !dbg !0
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !15
@llvm.used = appending global [3 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (i32 (%struct.xdp_exception_ctx*)* @trace_xdp_exception to i8*), i8* bitcast (%struct.bpf_map_def* @xdp_stats_map to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @trace_xdp_exception(%struct.xdp_exception_ctx* nocapture readonly %0) #0 section "tracepoint/xdp/xdp_exception" !dbg !51 {
  %2 = alloca i32, align 4
  %3 = alloca i64, align 8
  call void @llvm.dbg.value(metadata %struct.xdp_exception_ctx* %0, metadata !64, metadata !DIExpression()), !dbg !71
  %4 = bitcast i32* %2 to i8*, !dbg !72
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %4) #3, !dbg !72
  %5 = getelementptr inbounds %struct.xdp_exception_ctx, %struct.xdp_exception_ctx* %0, i64 0, i32 3, !dbg !73
  %6 = load i32, i32* %5, align 8, !dbg !73, !tbaa !74
  call void @llvm.dbg.value(metadata i32 %6, metadata !65, metadata !DIExpression()), !dbg !71
  store i32 %6, i32* %2, align 4, !dbg !80, !tbaa !81
  %7 = getelementptr inbounds %struct.xdp_exception_ctx, %struct.xdp_exception_ctx* %0, i64 0, i32 2, !dbg !82
  %8 = load i32, i32* %7, align 4, !dbg !82, !tbaa !84
  %9 = icmp eq i32 %8, 0, !dbg !85
  br i1 %9, label %10, label %22, !dbg !86

10:                                               ; preds = %1
  call void @llvm.dbg.value(metadata i32* %2, metadata !65, metadata !DIExpression(DW_OP_deref)), !dbg !71
  %11 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @xdp_stats_map to i8*), i8* nonnull %4) #3, !dbg !87
  %12 = bitcast i8* %11 to i32*, !dbg !87
  call void @llvm.dbg.value(metadata i32* %12, metadata !66, metadata !DIExpression()), !dbg !71
  %13 = icmp eq i8* %11, null, !dbg !88
  br i1 %13, label %14, label %19, !dbg !89

14:                                               ; preds = %10
  %15 = bitcast i64* %3 to i8*, !dbg !90
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %15) #3, !dbg !90
  call void @llvm.dbg.value(metadata i64 1, metadata !68, metadata !DIExpression()), !dbg !91
  store i64 1, i64* %3, align 8, !dbg !92, !tbaa !93
  call void @llvm.dbg.value(metadata i32* %2, metadata !65, metadata !DIExpression(DW_OP_deref)), !dbg !71
  call void @llvm.dbg.value(metadata i64* %3, metadata !68, metadata !DIExpression(DW_OP_deref)), !dbg !91
  %16 = call i32 inttoptr (i64 2 to i32 (i8*, i8*, i8*, i64)*)(i8* bitcast (%struct.bpf_map_def* @xdp_stats_map to i8*), i8* nonnull %4, i8* nonnull %15, i64 0) #3, !dbg !94
  %17 = icmp ne i32 %16, 0, !dbg !94
  %18 = zext i1 %17 to i32, !dbg !94
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %15) #3, !dbg !95
  br label %22

19:                                               ; preds = %10
  %20 = load i32, i32* %12, align 4, !dbg !96, !tbaa !81
  %21 = add i32 %20, 1, !dbg !96
  store i32 %21, i32* %12, align 4, !dbg !96, !tbaa !81
  br label %22, !dbg !97

22:                                               ; preds = %1, %19, %14
  %23 = phi i32 [ 0, %19 ], [ %18, %14 ], [ 0, %1 ], !dbg !71
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %4) #3, !dbg !98
  ret i32 %23, !dbg !98
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #2

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!47, !48, !49}
!llvm.ident = !{!50}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "xdp_stats_map", scope: !2, file: !3, line: 5, type: !39, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "trace_prog_kern.c", directory: "/home/saif/Desktop/xdp-tutorial/tracing01-xdp-simple")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 2845, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "../headers/linux/bpf.h", directory: "/home/saif/Desktop/xdp-tutorial/tracing01-xdp-simple")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13}
!9 = !DIEnumerator(name: "XDP_ABORTED", value: 0, isUnsigned: true)
!10 = !DIEnumerator(name: "XDP_DROP", value: 1, isUnsigned: true)
!11 = !DIEnumerator(name: "XDP_PASS", value: 2, isUnsigned: true)
!12 = !DIEnumerator(name: "XDP_TX", value: 3, isUnsigned: true)
!13 = !DIEnumerator(name: "XDP_REDIRECT", value: 4, isUnsigned: true)
!14 = !{!0, !15, !21, !30}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 44, type: !17, isLocal: false, isDefinition: true)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 32, elements: !19)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !{!20}
!20 = !DISubrange(count: 4)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !23, line: 33, type: !24, isLocal: true, isDefinition: true)
!23 = !DIFile(filename: "../libbpf/src//build/usr/include/bpf/bpf_helper_defs.h", directory: "/home/saif/Desktop/xdp-tutorial/tracing01-xdp-simple")
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DISubroutineType(types: !26)
!26 = !{!27, !27, !28}
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!30 = !DIGlobalVariableExpression(var: !31, expr: !DIExpression())
!31 = distinct !DIGlobalVariable(name: "bpf_map_update_elem", scope: !2, file: !23, line: 55, type: !32, isLocal: true, isDefinition: true)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!33 = !DISubroutineType(types: !34)
!34 = !{!35, !27, !28, !28, !36}
!35 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !37, line: 31, baseType: !38)
!37 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "")
!38 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!39 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_map_def", file: !40, line: 33, size: 160, elements: !41)
!40 = !DIFile(filename: "../libbpf/src//build/usr/include/bpf/bpf_helpers.h", directory: "/home/saif/Desktop/xdp-tutorial/tracing01-xdp-simple")
!41 = !{!42, !43, !44, !45, !46}
!42 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !39, file: !40, line: 34, baseType: !7, size: 32)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "key_size", scope: !39, file: !40, line: 35, baseType: !7, size: 32, offset: 32)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "value_size", scope: !39, file: !40, line: 36, baseType: !7, size: 32, offset: 64)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !39, file: !40, line: 37, baseType: !7, size: 32, offset: 96)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !39, file: !40, line: 38, baseType: !7, size: 32, offset: 128)
!47 = !{i32 7, !"Dwarf Version", i32 4}
!48 = !{i32 2, !"Debug Info Version", i32 3}
!49 = !{i32 1, !"wchar_size", i32 4}
!50 = !{!"clang version 10.0.0-4ubuntu1 "}
!51 = distinct !DISubprogram(name: "trace_xdp_exception", scope: !3, file: !3, line: 20, type: !52, scopeLine: 21, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !63)
!52 = !DISubroutineType(types: !53)
!53 = !{!35, !54}
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_exception_ctx", file: !3, line: 12, size: 192, elements: !56)
!56 = !{!57, !58, !60, !62}
!57 = !DIDerivedType(tag: DW_TAG_member, name: "__pad", scope: !55, file: !3, line: 13, baseType: !36, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "prog_id", scope: !55, file: !3, line: 14, baseType: !59, size: 32, offset: 64)
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "__s32", file: !37, line: 26, baseType: !35)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "act", scope: !55, file: !3, line: 15, baseType: !61, size: 32, offset: 96)
!61 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !37, line: 27, baseType: !7)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !55, file: !3, line: 16, baseType: !59, size: 32, offset: 128)
!63 = !{!64, !65, !66, !68}
!64 = !DILocalVariable(name: "ctx", arg: 1, scope: !51, file: !3, line: 20, type: !54)
!65 = !DILocalVariable(name: "key", scope: !51, file: !3, line: 22, type: !59)
!66 = !DILocalVariable(name: "valp", scope: !51, file: !3, line: 23, type: !67)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!68 = !DILocalVariable(name: "one", scope: !69, file: !3, line: 36, type: !36)
!69 = distinct !DILexicalBlock(scope: !70, file: !3, line: 35, column: 13)
!70 = distinct !DILexicalBlock(scope: !51, file: !3, line: 35, column: 6)
!71 = !DILocation(line: 0, scope: !51)
!72 = !DILocation(line: 22, column: 2, scope: !51)
!73 = !DILocation(line: 22, column: 19, scope: !51)
!74 = !{!75, !79, i64 16}
!75 = !{!"xdp_exception_ctx", !76, i64 0, !79, i64 8, !79, i64 12, !79, i64 16}
!76 = !{!"long long", !77, i64 0}
!77 = !{!"omnipotent char", !78, i64 0}
!78 = !{!"Simple C/C++ TBAA"}
!79 = !{!"int", !77, i64 0}
!80 = !DILocation(line: 22, column: 8, scope: !51)
!81 = !{!79, !79, i64 0}
!82 = !DILocation(line: 26, column: 11, scope: !83)
!83 = distinct !DILexicalBlock(scope: !51, file: !3, line: 26, column: 6)
!84 = !{!75, !79, i64 12}
!85 = !DILocation(line: 26, column: 15, scope: !83)
!86 = !DILocation(line: 26, column: 6, scope: !51)
!87 = !DILocation(line: 30, column: 9, scope: !51)
!88 = !DILocation(line: 35, column: 7, scope: !70)
!89 = !DILocation(line: 35, column: 6, scope: !51)
!90 = !DILocation(line: 36, column: 3, scope: !69)
!91 = !DILocation(line: 0, scope: !69)
!92 = !DILocation(line: 36, column: 9, scope: !69)
!93 = !{!76, !76, i64 0}
!94 = !DILocation(line: 37, column: 10, scope: !69)
!95 = !DILocation(line: 38, column: 2, scope: !70)
!96 = !DILocation(line: 40, column: 9, scope: !51)
!97 = !DILocation(line: 41, column: 2, scope: !51)
!98 = !DILocation(line: 42, column: 1, scope: !51)
