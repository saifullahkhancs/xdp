; ModuleID = 'xdp_vlan01_kern.c'
source_filename = "xdp_vlan01_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-n32:64-S128"
target triple = "bpf"

%struct.xdp_md = type { i32, i32, i32, i32, i32 }
%struct.hdr_cursor = type { i8* }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.vlan_hdr = type { i16, i16 }

@llvm.used = appending global [1 x i8*] [i8* bitcast (i32 (%struct.xdp_md*)* @xdp_vlan_01 to i8*)], section "llvm.metadata"

; Function Attrs: nounwind readonly
define dso_local i32 @xdp_vlan_01(%struct.xdp_md* nocapture readonly %0) #0 section "xdp_vlan01" !dbg !22 {
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !36, metadata !DIExpression()), !dbg !58
  %2 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !59
  %3 = load i32, i32* %2, align 4, !dbg !59, !tbaa !60
  %4 = zext i32 %3 to i64, !dbg !65
  %5 = inttoptr i64 %4 to i8*, !dbg !66
  call void @llvm.dbg.value(metadata i8* %5, metadata !37, metadata !DIExpression()), !dbg !58
  %6 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !67
  %7 = load i32, i32* %6, align 4, !dbg !67, !tbaa !68
  %8 = zext i32 %7 to i64, !dbg !69
  %9 = inttoptr i64 %8 to i8*, !dbg !70
  call void @llvm.dbg.value(metadata i8* %9, metadata !38, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.value(metadata i8* %9, metadata !39, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !71, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.value(metadata i8* %5, metadata !78, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.value(metadata i8* %9, metadata !80, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.value(metadata i32 14, metadata !81, metadata !DIExpression()), !dbg !90
  %10 = getelementptr i8, i8* %9, i64 14, !dbg !92
  %11 = icmp ugt i8* %10, %5, !dbg !94
  br i1 %11, label %20, label %12, !dbg !95

12:                                               ; preds = %1
  call void @llvm.dbg.value(metadata i8* %9, metadata !80, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.value(metadata i8* %10, metadata !39, metadata !DIExpression()), !dbg !58
  %13 = inttoptr i64 %8 to %struct.ethhdr*, !dbg !96
  call void @llvm.dbg.value(metadata i8* %10, metadata !82, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.value(metadata i16 undef, metadata !88, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.value(metadata i32 0, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.value(metadata i16 undef, metadata !88, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* undef, metadata !82, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* undef, metadata !39, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.value(metadata i16 undef, metadata !43, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.value(metadata %struct.ethhdr* %13, metadata !44, metadata !DIExpression()), !dbg !58
  %14 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %13, i64 0, i32 2, !dbg !97
  %15 = load i16, i16* %14, align 1, !dbg !97, !tbaa !99
  call void @llvm.dbg.value(metadata i16 %15, metadata !102, metadata !DIExpression()), !dbg !107
  %16 = icmp ne i16 %15, 129, !dbg !109
  %17 = icmp ne i16 %15, -22392, !dbg !110
  %18 = and i1 %16, %17, !dbg !111
  %19 = select i1 %18, i32 2, i32 1, !dbg !58
  br label %20, !dbg !58

20:                                               ; preds = %1, %12
  %21 = phi i32 [ %19, %12 ], [ 0, %1 ], !dbg !58
  ret i32 %21, !dbg !112
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!18, !19, !20}
!llvm.ident = !{!21}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !12, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "xdp_vlan01_kern.c", directory: "/home/saif/Desktop/xdp-tutorial/packet-solutions")
!2 = !{!3}
!3 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !4, line: 2845, baseType: !5, size: 32, elements: !6)
!4 = !DIFile(filename: "../headers/linux/bpf.h", directory: "/home/saif/Desktop/xdp-tutorial/packet-solutions")
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!7, !8, !9, !10, !11}
!7 = !DIEnumerator(name: "XDP_ABORTED", value: 0, isUnsigned: true)
!8 = !DIEnumerator(name: "XDP_DROP", value: 1, isUnsigned: true)
!9 = !DIEnumerator(name: "XDP_PASS", value: 2, isUnsigned: true)
!10 = !DIEnumerator(name: "XDP_TX", value: 3, isUnsigned: true)
!11 = !DIEnumerator(name: "XDP_REDIRECT", value: 4, isUnsigned: true)
!12 = !{!13, !14, !15}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!14 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !16, line: 24, baseType: !17)
!16 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "")
!17 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{!"clang version 10.0.0-4ubuntu1 "}
!22 = distinct !DISubprogram(name: "xdp_vlan_01", scope: !1, file: !1, line: 82, type: !23, scopeLine: 83, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !35)
!23 = !DISubroutineType(types: !24)
!24 = !{!25, !26}
!25 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !4, line: 2856, size: 160, elements: !28)
!28 = !{!29, !31, !32, !33, !34}
!29 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !27, file: !4, line: 2857, baseType: !30, size: 32)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !16, line: 27, baseType: !5)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !27, file: !4, line: 2858, baseType: !30, size: 32, offset: 32)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !27, file: !4, line: 2859, baseType: !30, size: 32, offset: 64)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !27, file: !4, line: 2861, baseType: !30, size: 32, offset: 96)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !27, file: !4, line: 2862, baseType: !30, size: 32, offset: 128)
!35 = !{!36, !37, !38, !39, !43, !44}
!36 = !DILocalVariable(name: "ctx", arg: 1, scope: !22, file: !1, line: 82, type: !26)
!37 = !DILocalVariable(name: "data_end", scope: !22, file: !1, line: 84, type: !13)
!38 = !DILocalVariable(name: "data", scope: !22, file: !1, line: 85, type: !13)
!39 = !DILocalVariable(name: "nh", scope: !22, file: !1, line: 88, type: !40)
!40 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !1, line: 17, size: 64, elements: !41)
!41 = !{!42}
!42 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !40, file: !1, line: 18, baseType: !13, size: 64)
!43 = !DILocalVariable(name: "nh_type", scope: !22, file: !1, line: 89, type: !25)
!44 = !DILocalVariable(name: "eth", scope: !22, file: !1, line: 92, type: !45)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64)
!46 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !47, line: 163, size: 112, elements: !48)
!47 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "")
!48 = !{!49, !54, !55}
!49 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !46, file: !47, line: 164, baseType: !50, size: 48)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 48, elements: !52)
!51 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!52 = !{!53}
!53 = !DISubrange(count: 6)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !46, file: !47, line: 165, baseType: !50, size: 48, offset: 48)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !46, file: !47, line: 166, baseType: !56, size: 16, offset: 96)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !57, line: 25, baseType: !15)
!57 = !DIFile(filename: "/usr/include/linux/types.h", directory: "")
!58 = !DILocation(line: 0, scope: !22)
!59 = !DILocation(line: 84, column: 38, scope: !22)
!60 = !{!61, !62, i64 4}
!61 = !{!"xdp_md", !62, i64 0, !62, i64 4, !62, i64 8, !62, i64 12, !62, i64 16}
!62 = !{!"int", !63, i64 0}
!63 = !{!"omnipotent char", !64, i64 0}
!64 = !{!"Simple C/C++ TBAA"}
!65 = !DILocation(line: 84, column: 27, scope: !22)
!66 = !DILocation(line: 84, column: 19, scope: !22)
!67 = !DILocation(line: 85, column: 34, scope: !22)
!68 = !{!61, !62, i64 0}
!69 = !DILocation(line: 85, column: 23, scope: !22)
!70 = !DILocation(line: 85, column: 15, scope: !22)
!71 = !DILocalVariable(name: "nh", arg: 1, scope: !72, file: !1, line: 42, type: !75)
!72 = distinct !DISubprogram(name: "parse_ethhdr", scope: !1, file: !1, line: 42, type: !73, scopeLine: 44, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !77)
!73 = !DISubroutineType(types: !74)
!74 = !{!25, !75, !13, !76}
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64)
!77 = !{!71, !78, !79, !80, !81, !82, !88, !89}
!78 = !DILocalVariable(name: "data_end", arg: 2, scope: !72, file: !1, line: 42, type: !13)
!79 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !72, file: !1, line: 43, type: !76)
!80 = !DILocalVariable(name: "eth", scope: !72, file: !1, line: 45, type: !45)
!81 = !DILocalVariable(name: "hdrsize", scope: !72, file: !1, line: 46, type: !25)
!82 = !DILocalVariable(name: "vlh", scope: !72, file: !1, line: 47, type: !83)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlan_hdr", file: !1, line: 32, size: 32, elements: !85)
!85 = !{!86, !87}
!86 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !84, file: !1, line: 33, baseType: !56, size: 16)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !84, file: !1, line: 34, baseType: !56, size: 16, offset: 16)
!88 = !DILocalVariable(name: "h_proto", scope: !72, file: !1, line: 48, type: !15)
!89 = !DILocalVariable(name: "i", scope: !72, file: !1, line: 49, type: !25)
!90 = !DILocation(line: 0, scope: !72, inlinedAt: !91)
!91 = distinct !DILocation(line: 93, column: 12, scope: !22)
!92 = !DILocation(line: 54, column: 14, scope: !93, inlinedAt: !91)
!93 = distinct !DILexicalBlock(scope: !72, file: !1, line: 54, column: 6)
!94 = !DILocation(line: 54, column: 24, scope: !93, inlinedAt: !91)
!95 = !DILocation(line: 54, column: 6, scope: !72, inlinedAt: !91)
!96 = !DILocation(line: 58, column: 10, scope: !72, inlinedAt: !91)
!97 = !DILocation(line: 108, column: 25, scope: !98)
!98 = distinct !DILexicalBlock(scope: !22, file: !1, line: 108, column: 6)
!99 = !{!100, !101, i64 12}
!100 = !{!"ethhdr", !63, i64 0, !63, i64 6, !101, i64 12}
!101 = !{!"short", !63, i64 0}
!102 = !DILocalVariable(name: "h_proto", arg: 1, scope: !103, file: !1, line: 21, type: !15)
!103 = distinct !DISubprogram(name: "proto_is_vlan", scope: !1, file: !1, line: 21, type: !104, scopeLine: 22, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !106)
!104 = !DISubroutineType(types: !105)
!105 = !{!25, !15}
!106 = !{!102}
!107 = !DILocation(line: 0, scope: !103, inlinedAt: !108)
!108 = distinct !DILocation(line: 108, column: 6, scope: !98)
!109 = !DILocation(line: 23, column: 20, scope: !103, inlinedAt: !108)
!110 = !DILocation(line: 23, column: 46, scope: !103, inlinedAt: !108)
!111 = !DILocation(line: 108, column: 6, scope: !98)
!112 = !DILocation(line: 115, column: 1, scope: !22)
