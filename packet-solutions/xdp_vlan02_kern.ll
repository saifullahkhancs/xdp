; ModuleID = 'xdp_vlan02_kern.c'
source_filename = "xdp_vlan02_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-n32:64-S128"
target triple = "bpf"

%struct.xdp_md = type { i32, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.hdr_cursor = type { i8* }
%struct.collect_vlans = type { [10 x i16] }
%struct.vlan_hdr = type { i16, i16 }

@llvm.used = appending global [1 x i8*] [i8* bitcast (i32 (%struct.xdp_md*)* @xdp_vlan_02 to i8*)], section "llvm.metadata"

; Function Attrs: nounwind readonly
define dso_local i32 @xdp_vlan_02(%struct.xdp_md* nocapture readonly %0) #0 section "xdp_vlan02" !dbg !22 {
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !36, metadata !DIExpression()), !dbg !66
  %2 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !67
  %3 = load i32, i32* %2, align 4, !dbg !67, !tbaa !68
  %4 = zext i32 %3 to i64, !dbg !73
  %5 = inttoptr i64 %4 to i8*, !dbg !74
  call void @llvm.dbg.value(metadata i8* %5, metadata !37, metadata !DIExpression()), !dbg !66
  %6 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !75
  %7 = load i32, i32* %6, align 4, !dbg !75, !tbaa !76
  %8 = zext i32 %7 to i64, !dbg !77
  %9 = inttoptr i64 %8 to i8*, !dbg !78
  call void @llvm.dbg.value(metadata i8* %9, metadata !38, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.value(metadata i8* %9, metadata !39, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !52, metadata !DIExpression(DW_OP_deref)), !dbg !66
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !79, metadata !DIExpression()) #2, !dbg !100
  call void @llvm.dbg.value(metadata i8* %5, metadata !87, metadata !DIExpression()) #2, !dbg !100
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !88, metadata !DIExpression()) #2, !dbg !100
  call void @llvm.dbg.value(metadata %struct.collect_vlans* undef, metadata !89, metadata !DIExpression()) #2, !dbg !100
  call void @llvm.dbg.value(metadata i8* %9, metadata !90, metadata !DIExpression()) #2, !dbg !100
  call void @llvm.dbg.value(metadata i32 14, metadata !91, metadata !DIExpression()) #2, !dbg !100
  %10 = getelementptr i8, i8* %9, i64 14, !dbg !102
  %11 = icmp ugt i8* %10, %5, !dbg !104
  br i1 %11, label %35, label %12, !dbg !105

12:                                               ; preds = %1
  call void @llvm.dbg.value(metadata i8* %9, metadata !90, metadata !DIExpression()) #2, !dbg !100
  call void @llvm.dbg.value(metadata i8* %10, metadata !39, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.value(metadata i8* %10, metadata !92, metadata !DIExpression()) #2, !dbg !100
  %13 = getelementptr inbounds i8, i8* %9, i64 12, !dbg !106
  %14 = bitcast i8* %13 to i16*, !dbg !106
  %15 = load i16, i16* %14, align 1, !dbg !106, !tbaa !107
  call void @llvm.dbg.value(metadata i16 %15, metadata !98, metadata !DIExpression()) #2, !dbg !100
  call void @llvm.dbg.value(metadata i32 0, metadata !99, metadata !DIExpression()) #2, !dbg !100
  %16 = inttoptr i64 %4 to %struct.vlan_hdr*, !dbg !110
  call void @llvm.dbg.value(metadata i64 0, metadata !99, metadata !DIExpression()) #2, !dbg !100
  switch i16 %15, label %35 [
    i16 -22392, label %17
    i16 129, label %17
  ], !dbg !115

17:                                               ; preds = %12, %12
  %18 = getelementptr i8, i8* %9, i64 18, !dbg !116
  %19 = bitcast i8* %18 to %struct.vlan_hdr*, !dbg !116
  %20 = icmp ugt %struct.vlan_hdr* %19, %16, !dbg !117
  br i1 %20, label %35, label %21, !dbg !118

21:                                               ; preds = %17
  %22 = getelementptr i8, i8* %9, i64 16, !dbg !119
  %23 = bitcast i8* %22 to i16*, !dbg !119
  %24 = load i16, i16* %23, align 2, !dbg !119, !tbaa !120
  call void @llvm.dbg.value(metadata i16 %24, metadata !98, metadata !DIExpression()) #2, !dbg !100
  call void @llvm.dbg.value(metadata i16 undef, metadata !45, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 16)), !dbg !66
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %19, metadata !92, metadata !DIExpression()) #2, !dbg !100
  call void @llvm.dbg.value(metadata i64 1, metadata !99, metadata !DIExpression()) #2, !dbg !100
  call void @llvm.dbg.value(metadata i16 %24, metadata !98, metadata !DIExpression()) #2, !dbg !100
  switch i16 %24, label %35 [
    i16 -22392, label %25
    i16 129, label %25
  ], !dbg !115

25:                                               ; preds = %21, %21
  %26 = getelementptr i8, i8* %9, i64 22, !dbg !116
  %27 = bitcast i8* %26 to %struct.vlan_hdr*, !dbg !116
  %28 = icmp ugt %struct.vlan_hdr* %27, %16, !dbg !117
  br i1 %28, label %35, label %29, !dbg !118

29:                                               ; preds = %25
  %30 = bitcast i8* %18 to i16*, !dbg !122
  %31 = load i16, i16* %30, align 2, !dbg !122, !tbaa !124
  %32 = and i16 %31, -241, !dbg !125
  call void @llvm.dbg.value(metadata i16 undef, metadata !45, metadata !DIExpression(DW_OP_LLVM_fragment, 16, 16)), !dbg !66
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %27, metadata !92, metadata !DIExpression()) #2, !dbg !100
  call void @llvm.dbg.value(metadata i64 2, metadata !99, metadata !DIExpression()) #2, !dbg !100
  %33 = icmp eq i16 %32, 10752, !dbg !115
  %34 = select i1 %33, i32 0, i32 2, !dbg !115
  br label %35, !dbg !115

35:                                               ; preds = %25, %21, %17, %12, %29, %1
  %36 = phi i32 [ 0, %1 ], [ 2, %12 ], [ 2, %17 ], [ 2, %21 ], [ 2, %25 ], [ %34, %29 ]
  ret i32 %36, !dbg !126
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!18, !19, !20}
!llvm.ident = !{!21}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !12, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "xdp_vlan02_kern.c", directory: "/home/saif/Desktop/xdp-tutorial/packet-solutions")
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
!22 = distinct !DISubprogram(name: "xdp_vlan_02", scope: !1, file: !1, line: 69, type: !23, scopeLine: 70, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !35)
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
!35 = !{!36, !37, !38, !39, !44, !45, !52}
!36 = !DILocalVariable(name: "ctx", arg: 1, scope: !22, file: !1, line: 69, type: !26)
!37 = !DILocalVariable(name: "data_end", scope: !22, file: !1, line: 71, type: !13)
!38 = !DILocalVariable(name: "data", scope: !22, file: !1, line: 72, type: !13)
!39 = !DILocalVariable(name: "nh", scope: !22, file: !1, line: 75, type: !40)
!40 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !41, line: 33, size: 64, elements: !42)
!41 = !DIFile(filename: "./../common/parsing_helpers.h", directory: "/home/saif/Desktop/xdp-tutorial/packet-solutions")
!42 = !{!43}
!43 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !40, file: !41, line: 34, baseType: !13, size: 64)
!44 = !DILocalVariable(name: "eth_type", scope: !22, file: !1, line: 76, type: !25)
!45 = !DILocalVariable(name: "vlans", scope: !22, file: !1, line: 79, type: !46)
!46 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "collect_vlans", file: !41, line: 64, size: 160, elements: !47)
!47 = !{!48}
!48 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !46, file: !41, line: 65, baseType: !49, size: 160)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 160, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 10)
!52 = !DILocalVariable(name: "eth", scope: !22, file: !1, line: 81, type: !53)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !55, line: 163, size: 112, elements: !56)
!55 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "")
!56 = !{!57, !62, !63}
!57 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !54, file: !55, line: 164, baseType: !58, size: 48)
!58 = !DICompositeType(tag: DW_TAG_array_type, baseType: !59, size: 48, elements: !60)
!59 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!60 = !{!61}
!61 = !DISubrange(count: 6)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !54, file: !55, line: 165, baseType: !58, size: 48, offset: 48)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !54, file: !55, line: 166, baseType: !64, size: 16, offset: 96)
!64 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !65, line: 25, baseType: !15)
!65 = !DIFile(filename: "/usr/include/linux/types.h", directory: "")
!66 = !DILocation(line: 0, scope: !22)
!67 = !DILocation(line: 71, column: 38, scope: !22)
!68 = !{!69, !70, i64 4}
!69 = !{!"xdp_md", !70, i64 0, !70, i64 4, !70, i64 8, !70, i64 12, !70, i64 16}
!70 = !{!"int", !71, i64 0}
!71 = !{!"omnipotent char", !72, i64 0}
!72 = !{!"Simple C/C++ TBAA"}
!73 = !DILocation(line: 71, column: 27, scope: !22)
!74 = !DILocation(line: 71, column: 19, scope: !22)
!75 = !DILocation(line: 72, column: 34, scope: !22)
!76 = !{!69, !70, i64 0}
!77 = !DILocation(line: 72, column: 23, scope: !22)
!78 = !DILocation(line: 72, column: 15, scope: !22)
!79 = !DILocalVariable(name: "nh", arg: 1, scope: !80, file: !41, line: 79, type: !83)
!80 = distinct !DISubprogram(name: "parse_ethhdr_vlan", scope: !41, file: !41, line: 79, type: !81, scopeLine: 83, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !86)
!81 = !DISubroutineType(types: !82)
!82 = !{!25, !83, !13, !84, !85}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64)
!86 = !{!79, !87, !88, !89, !90, !91, !92, !98, !99}
!87 = !DILocalVariable(name: "data_end", arg: 2, scope: !80, file: !41, line: 80, type: !13)
!88 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !80, file: !41, line: 81, type: !84)
!89 = !DILocalVariable(name: "vlans", arg: 4, scope: !80, file: !41, line: 82, type: !85)
!90 = !DILocalVariable(name: "eth", scope: !80, file: !41, line: 84, type: !53)
!91 = !DILocalVariable(name: "hdrsize", scope: !80, file: !41, line: 85, type: !25)
!92 = !DILocalVariable(name: "vlh", scope: !80, file: !41, line: 86, type: !93)
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlan_hdr", file: !41, line: 42, size: 32, elements: !95)
!95 = !{!96, !97}
!96 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !94, file: !41, line: 43, baseType: !64, size: 16)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !94, file: !41, line: 44, baseType: !64, size: 16, offset: 16)
!98 = !DILocalVariable(name: "h_proto", scope: !80, file: !41, line: 87, type: !15)
!99 = !DILocalVariable(name: "i", scope: !80, file: !41, line: 88, type: !25)
!100 = !DILocation(line: 0, scope: !80, inlinedAt: !101)
!101 = distinct !DILocation(line: 83, column: 13, scope: !22)
!102 = !DILocation(line: 93, column: 14, scope: !103, inlinedAt: !101)
!103 = distinct !DILexicalBlock(scope: !80, file: !41, line: 93, column: 6)
!104 = !DILocation(line: 93, column: 24, scope: !103, inlinedAt: !101)
!105 = !DILocation(line: 93, column: 6, scope: !80, inlinedAt: !101)
!106 = !DILocation(line: 99, column: 17, scope: !80, inlinedAt: !101)
!107 = !{!108, !109, i64 12}
!108 = !{!"ethhdr", !71, i64 0, !71, i64 6, !109, i64 12}
!109 = !{!"short", !71, i64 0}
!110 = !DILocation(line: 0, scope: !111, inlinedAt: !101)
!111 = distinct !DILexicalBlock(scope: !112, file: !41, line: 109, column: 7)
!112 = distinct !DILexicalBlock(scope: !113, file: !41, line: 105, column: 39)
!113 = distinct !DILexicalBlock(scope: !114, file: !41, line: 105, column: 2)
!114 = distinct !DILexicalBlock(scope: !80, file: !41, line: 105, column: 2)
!115 = !DILocation(line: 106, column: 7, scope: !112, inlinedAt: !101)
!116 = !DILocation(line: 109, column: 11, scope: !111, inlinedAt: !101)
!117 = !DILocation(line: 109, column: 15, scope: !111, inlinedAt: !101)
!118 = !DILocation(line: 109, column: 7, scope: !112, inlinedAt: !101)
!119 = !DILocation(line: 112, column: 18, scope: !112, inlinedAt: !101)
!120 = !{!121, !109, i64 2}
!121 = !{!"vlan_hdr", !109, i64 0, !109, i64 2}
!122 = !DILocation(line: 115, column: 6, scope: !123, inlinedAt: !101)
!123 = distinct !DILexicalBlock(scope: !112, file: !41, line: 113, column: 7)
!124 = !{!121, !109, i64 0}
!125 = !DILocation(line: 115, column: 33, scope: !123, inlinedAt: !101)
!126 = !DILocation(line: 127, column: 1, scope: !22)
