; ModuleID = 'xdp_prog_kern.c'
source_filename = "xdp_prog_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-n32:64-S128"
target triple = "bpf"

%struct.bpf_map_def = type { i32, i32, i32, i32, i32 }
%struct.xdp_md = type { i32, i32, i32, i32, i32 }

@xdp_stats_map = dso_local global %struct.bpf_map_def { i32 6, i32 4, i32 16, i32 5, i32 0 }, section "maps", align 4, !dbg !0
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !47
@llvm.used = appending global [3 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (i32 (%struct.xdp_md*)* @dropper to i8*), i8* bitcast (%struct.bpf_map_def* @xdp_stats_map to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @dropper(%struct.xdp_md* nocapture readonly %0) #0 section "dropper_main" !dbg !74 {
  %2 = alloca i32, align 4
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !89, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 0, metadata !90, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 2, metadata !91, metadata !DIExpression()), !dbg !130
  %3 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !131
  %4 = load i32, i32* %3, align 4, !dbg !131, !tbaa !132
  %5 = zext i32 %4 to i64, !dbg !137
  %6 = inttoptr i64 %5 to i8*, !dbg !138
  call void @llvm.dbg.value(metadata i8* %6, metadata !92, metadata !DIExpression()), !dbg !130
  %7 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !139
  %8 = load i32, i32* %7, align 4, !dbg !139, !tbaa !140
  %9 = zext i32 %8 to i64, !dbg !141
  %10 = inttoptr i64 %9 to i8*, !dbg !142
  call void @llvm.dbg.value(metadata i8* %10, metadata !93, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i8* %6, metadata !94, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 14, metadata !90, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i8* %6, metadata !110, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 34, metadata !90, metadata !DIExpression()), !dbg !130
  %11 = getelementptr i8, i8* %6, i64 34, !dbg !143
  %12 = icmp ugt i8* %11, %10, !dbg !145
  br i1 %12, label %36, label %13, !dbg !146

13:                                               ; preds = %1
  call void @llvm.dbg.value(metadata i8* %6, metadata !110, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)), !dbg !130
  %14 = getelementptr i8, i8* %6, i64 23, !dbg !147
  %15 = load i8, i8* %14, align 1, !dbg !147, !tbaa !149
  %16 = icmp eq i8 %15, 17, !dbg !152
  %17 = select i1 %16, i32 1, i32 2, !dbg !153
  call void @llvm.dbg.value(metadata i32 %17, metadata !91, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.label(metadata !129), !dbg !154
  %18 = bitcast i32* %2 to i8*, !dbg !155
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %18), !dbg !155
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !160, metadata !DIExpression()) #3, !dbg !155
  call void @llvm.dbg.value(metadata i32 %17, metadata !161, metadata !DIExpression()) #3, !dbg !155
  store i32 %17, i32* %2, align 4, !tbaa !172
  call void @llvm.dbg.value(metadata i32* %2, metadata !161, metadata !DIExpression(DW_OP_deref)) #3, !dbg !155
  %19 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @xdp_stats_map to i8*), i8* nonnull %18) #3, !dbg !173
  call void @llvm.dbg.value(metadata i8* %19, metadata !162, metadata !DIExpression()) #3, !dbg !155
  %20 = icmp eq i8* %19, null, !dbg !174
  br i1 %20, label %34, label %21, !dbg !176

21:                                               ; preds = %13
  call void @llvm.dbg.value(metadata i8* %19, metadata !162, metadata !DIExpression()) #3, !dbg !155
  %22 = bitcast i8* %19 to i64*, !dbg !177
  %23 = load i64, i64* %22, align 8, !dbg !178, !tbaa !179
  %24 = add i64 %23, 1, !dbg !178
  store i64 %24, i64* %22, align 8, !dbg !178, !tbaa !179
  %25 = load i32, i32* %7, align 4, !dbg !182, !tbaa !140
  %26 = load i32, i32* %3, align 4, !dbg !183, !tbaa !132
  %27 = sub i32 %25, %26, !dbg !184
  %28 = zext i32 %27 to i64, !dbg !185
  %29 = getelementptr inbounds i8, i8* %19, i64 8, !dbg !186
  %30 = bitcast i8* %29 to i64*, !dbg !186
  %31 = load i64, i64* %30, align 8, !dbg !187, !tbaa !188
  %32 = add i64 %31, %28, !dbg !187
  store i64 %32, i64* %30, align 8, !dbg !187, !tbaa !188
  %33 = load i32, i32* %2, align 4, !dbg !189, !tbaa !172
  call void @llvm.dbg.value(metadata i32 %33, metadata !161, metadata !DIExpression()) #3, !dbg !155
  br label %34, !dbg !190

34:                                               ; preds = %13, %21
  %35 = phi i32 [ %33, %21 ], [ 0, %13 ], !dbg !155
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %18), !dbg !191
  br label %36, !dbg !192

36:                                               ; preds = %1, %34
  %37 = phi i32 [ %35, %34 ], [ 2, %1 ], !dbg !130
  ret i32 %37, !dbg !193
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!70, !71, !72}
!llvm.ident = !{!73}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "xdp_stats_map", scope: !2, file: !61, line: 16, type: !62, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !43, globals: !46, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "xdp_prog_kern.c", directory: "/home/saif/Desktop/xdp-tutorial/packet01-apna")
!4 = !{!5, !14}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 2845, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "../headers/linux/bpf.h", directory: "/home/saif/Desktop/xdp-tutorial/packet01-apna")
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
!43 = !{!44, !45}
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!45 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!46 = !{!0, !47, !53}
!47 = !DIGlobalVariableExpression(var: !48, expr: !DIExpression())
!48 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 61, type: !49, isLocal: false, isDefinition: true)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !50, size: 32, elements: !51)
!50 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!51 = !{!52}
!52 = !DISubrange(count: 4)
!53 = !DIGlobalVariableExpression(var: !54, expr: !DIExpression())
!54 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !55, line: 33, type: !56, isLocal: true, isDefinition: true)
!55 = !DIFile(filename: "../libbpf/src//build/usr/include/bpf/bpf_helper_defs.h", directory: "/home/saif/Desktop/xdp-tutorial/packet01-apna")
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DISubroutineType(types: !58)
!58 = !{!44, !44, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!61 = !DIFile(filename: "./../common/xdp_stats_kern.h", directory: "/home/saif/Desktop/xdp-tutorial/packet01-apna")
!62 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_map_def", file: !63, line: 33, size: 160, elements: !64)
!63 = !DIFile(filename: "../libbpf/src//build/usr/include/bpf/bpf_helpers.h", directory: "/home/saif/Desktop/xdp-tutorial/packet01-apna")
!64 = !{!65, !66, !67, !68, !69}
!65 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !62, file: !63, line: 34, baseType: !7, size: 32)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "key_size", scope: !62, file: !63, line: 35, baseType: !7, size: 32, offset: 32)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "value_size", scope: !62, file: !63, line: 36, baseType: !7, size: 32, offset: 64)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !62, file: !63, line: 37, baseType: !7, size: 32, offset: 96)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !62, file: !63, line: 38, baseType: !7, size: 32, offset: 128)
!70 = !{i32 7, !"Dwarf Version", i32 4}
!71 = !{i32 2, !"Debug Info Version", i32 3}
!72 = !{i32 1, !"wchar_size", i32 4}
!73 = !{!"clang version 10.0.0-4ubuntu1 "}
!74 = distinct !DISubprogram(name: "dropper", scope: !3, file: !3, line: 34, type: !75, scopeLine: 34, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !88)
!75 = !DISubroutineType(types: !76)
!76 = !{!77, !78}
!77 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 2856, size: 160, elements: !80)
!80 = !{!81, !84, !85, !86, !87}
!81 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !79, file: !6, line: 2857, baseType: !82, size: 32)
!82 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !83, line: 27, baseType: !7)
!83 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "")
!84 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !79, file: !6, line: 2858, baseType: !82, size: 32, offset: 32)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !79, file: !6, line: 2859, baseType: !82, size: 32, offset: 64)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !79, file: !6, line: 2861, baseType: !82, size: 32, offset: 96)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !79, file: !6, line: 2862, baseType: !82, size: 32, offset: 128)
!88 = !{!89, !90, !91, !92, !93, !94, !110, !129}
!89 = !DILocalVariable(name: "ctx", arg: 1, scope: !74, file: !3, line: 34, type: !78)
!90 = !DILocalVariable(name: "ipsize", scope: !74, file: !3, line: 35, type: !77)
!91 = !DILocalVariable(name: "action", scope: !74, file: !3, line: 37, type: !82)
!92 = !DILocalVariable(name: "data", scope: !74, file: !3, line: 38, type: !44)
!93 = !DILocalVariable(name: "data_end", scope: !74, file: !3, line: 39, type: !44)
!94 = !DILocalVariable(name: "eth", scope: !74, file: !3, line: 41, type: !95)
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !97, line: 163, size: 112, elements: !98)
!97 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "")
!98 = !{!99, !104, !105}
!99 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !96, file: !97, line: 164, baseType: !100, size: 48)
!100 = !DICompositeType(tag: DW_TAG_array_type, baseType: !101, size: 48, elements: !102)
!101 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!102 = !{!103}
!103 = !DISubrange(count: 6)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !96, file: !97, line: 165, baseType: !100, size: 48, offset: 48)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !96, file: !97, line: 166, baseType: !106, size: 16, offset: 96)
!106 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !107, line: 25, baseType: !108)
!107 = !DIFile(filename: "/usr/include/linux/types.h", directory: "")
!108 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !83, line: 24, baseType: !109)
!109 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!110 = !DILocalVariable(name: "ip", scope: !74, file: !3, line: 45, type: !111)
!111 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !112, size: 64)
!112 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !113, line: 86, size: 160, elements: !114)
!113 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "")
!114 = !{!115, !117, !118, !119, !120, !121, !122, !123, !124, !126, !128}
!115 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !112, file: !113, line: 88, baseType: !116, size: 4, flags: DIFlagBitField, extraData: i64 0)
!116 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !83, line: 21, baseType: !101)
!117 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !112, file: !113, line: 89, baseType: !116, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !112, file: !113, line: 96, baseType: !116, size: 8, offset: 8)
!119 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !112, file: !113, line: 97, baseType: !106, size: 16, offset: 16)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !112, file: !113, line: 98, baseType: !106, size: 16, offset: 32)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !112, file: !113, line: 99, baseType: !106, size: 16, offset: 48)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !112, file: !113, line: 100, baseType: !116, size: 8, offset: 64)
!123 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !112, file: !113, line: 101, baseType: !116, size: 8, offset: 72)
!124 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !112, file: !113, line: 102, baseType: !125, size: 16, offset: 80)
!125 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !107, line: 31, baseType: !108)
!126 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !112, file: !113, line: 103, baseType: !127, size: 32, offset: 96)
!127 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !107, line: 27, baseType: !82)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !112, file: !113, line: 104, baseType: !127, size: 32, offset: 128)
!129 = !DILabel(scope: !74, name: "out", file: !3, line: 57)
!130 = !DILocation(line: 0, scope: !74)
!131 = !DILocation(line: 38, column: 35, scope: !74)
!132 = !{!133, !134, i64 0}
!133 = !{!"xdp_md", !134, i64 0, !134, i64 4, !134, i64 8, !134, i64 12, !134, i64 16}
!134 = !{!"int", !135, i64 0}
!135 = !{!"omnipotent char", !136, i64 0}
!136 = !{!"Simple C/C++ TBAA"}
!137 = !DILocation(line: 38, column: 24, scope: !74)
!138 = !DILocation(line: 38, column: 16, scope: !74)
!139 = !DILocation(line: 39, column: 39, scope: !74)
!140 = !{!133, !134, i64 4}
!141 = !DILocation(line: 39, column: 28, scope: !74)
!142 = !DILocation(line: 39, column: 20, scope: !74)
!143 = !DILocation(line: 47, column: 12, scope: !144)
!144 = distinct !DILexicalBlock(scope: !74, file: !3, line: 47, column: 7)
!145 = !DILocation(line: 47, column: 21, scope: !144)
!146 = !DILocation(line: 47, column: 7, scope: !74)
!147 = !DILocation(line: 51, column: 11, scope: !148)
!148 = distinct !DILexicalBlock(scope: !74, file: !3, line: 51, column: 7)
!149 = !{!150, !135, i64 9}
!150 = !{!"iphdr", !135, i64 0, !135, i64 0, !135, i64 1, !151, i64 2, !151, i64 4, !151, i64 6, !135, i64 8, !135, i64 9, !151, i64 10, !134, i64 12, !134, i64 16}
!151 = !{!"short", !135, i64 0}
!152 = !DILocation(line: 51, column: 20, scope: !148)
!153 = !DILocation(line: 51, column: 7, scope: !74)
!154 = !DILocation(line: 57, column: 1, scope: !74)
!155 = !DILocation(line: 0, scope: !156, inlinedAt: !171)
!156 = distinct !DISubprogram(name: "xdp_stats_record_action", scope: !61, file: !61, line: 24, type: !157, scopeLine: 25, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !159)
!157 = !DISubroutineType(types: !158)
!158 = !{!82, !78, !82}
!159 = !{!160, !161, !162}
!160 = !DILocalVariable(name: "ctx", arg: 1, scope: !156, file: !61, line: 24, type: !78)
!161 = !DILocalVariable(name: "action", arg: 2, scope: !156, file: !61, line: 24, type: !82)
!162 = !DILocalVariable(name: "rec", scope: !156, file: !61, line: 30, type: !163)
!163 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !164, size: 64)
!164 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "datarec", file: !165, line: 10, size: 128, elements: !166)
!165 = !DIFile(filename: "./../common/xdp_stats_kern_user.h", directory: "/home/saif/Desktop/xdp-tutorial/packet01-apna")
!166 = !{!167, !170}
!167 = !DIDerivedType(tag: DW_TAG_member, name: "rx_packets", scope: !164, file: !165, line: 11, baseType: !168, size: 64)
!168 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !83, line: 31, baseType: !169)
!169 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!170 = !DIDerivedType(tag: DW_TAG_member, name: "rx_bytes", scope: !164, file: !165, line: 12, baseType: !168, size: 64, offset: 64)
!171 = distinct !DILocation(line: 58, column: 9, scope: !74)
!172 = !{!134, !134, i64 0}
!173 = !DILocation(line: 30, column: 24, scope: !156, inlinedAt: !171)
!174 = !DILocation(line: 31, column: 7, scope: !175, inlinedAt: !171)
!175 = distinct !DILexicalBlock(scope: !156, file: !61, line: 31, column: 6)
!176 = !DILocation(line: 31, column: 6, scope: !156, inlinedAt: !171)
!177 = !DILocation(line: 38, column: 7, scope: !156, inlinedAt: !171)
!178 = !DILocation(line: 38, column: 17, scope: !156, inlinedAt: !171)
!179 = !{!180, !181, i64 0}
!180 = !{!"datarec", !181, i64 0, !181, i64 8}
!181 = !{!"long long", !135, i64 0}
!182 = !DILocation(line: 39, column: 25, scope: !156, inlinedAt: !171)
!183 = !DILocation(line: 39, column: 41, scope: !156, inlinedAt: !171)
!184 = !DILocation(line: 39, column: 34, scope: !156, inlinedAt: !171)
!185 = !DILocation(line: 39, column: 19, scope: !156, inlinedAt: !171)
!186 = !DILocation(line: 39, column: 7, scope: !156, inlinedAt: !171)
!187 = !DILocation(line: 39, column: 16, scope: !156, inlinedAt: !171)
!188 = !{!180, !181, i64 8}
!189 = !DILocation(line: 41, column: 9, scope: !156, inlinedAt: !171)
!190 = !DILocation(line: 41, column: 2, scope: !156, inlinedAt: !171)
!191 = !DILocation(line: 42, column: 1, scope: !156, inlinedAt: !171)
!192 = !DILocation(line: 58, column: 2, scope: !74)
!193 = !DILocation(line: 59, column: 1, scope: !74)
