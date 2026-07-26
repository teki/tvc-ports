@ $4000 start
@ $4000 org
b $4000
c $40E5
  $40E5 #REGe=#REGd
  $40E6 #REGh=PEEK #REGhl
  $40E7 Jump to #R16713
b $40E9
c $40F1
  $40F1 Jump to #R16729
s $40F3
c $40F4
  $40F4 Jump to #R16630
b $40F6
c $41E5
  $41E5 #REGe=#REGd
  $41E6 #REGh=PEEK #REGhl
  $41E7 Jump to #R16969
b $41E9
c $41F1
  $41F1 Jump to #R16985
s $41F3
c $41F4
  $41F4 Jump to #R16886
b $41F6
t $4251
b $4255
t $4266
b $4269
t $4271
b $4276
t $4278
b $427B
t $42C5
b $42CA
c $42E5
  $42E5 #REGh=PEEK #REGhl
  $42E6 #REGh=PEEK #REGhl
  $42E7 Jump to #R17227
b $42E9
c $42F0
  $42F0 #REGl=#REGh
  $42F1 Jump to #R17241
b $42F3
t $4351
b $4355
t $4371
b $4376
t $43C5
b $43CA
c $43E5
  $43E5 #REGh=PEEK #REGhl
  $43E6 #REGh=PEEK #REGhl
  $43E7 Jump to #R17483
b $43E9
c $43F0
  $43F0 #REGl=#REGh
  $43F1 Jump to #R17497
b $43F3
t $4452
b $4456
t $4471
b $4475
t $44CE
b $44D1
t $44E5
b $44EA
t $44EE
c $44F1
  $44F1 #REGa=#REGa+1
  $44F2 #REGa=#REGa+1
  $44F3 Do nothing
  $44F4 Jump to #R17654
b $44F6
t $4552
b $4556
t $4571
b $4575
t $45CE
b $45D1
t $45E5
b $45EA
t $45EE
c $45F1
  $45F1 #REGa=#REGa+1
  $45F2 #REGa=#REGa+1
  $45F3 Do nothing
  $45F4 Jump to #R17910
b $45F6
t $464B
b $464F
t $4651
b $4656
t $46CD
b $46D1
t $474B
b $474F
t $4751
b $4756
t $47CD
b $47D1
c $4845
  $4845 Jump to #R18615
s $4847
c $4848
  $4848 Jump to #R18608
c $484A
  $484A #REGh=#REGb
  $484B Do nothing
  $484C #REGa=PEEK #REGhl
  $484D #REGb=#N(6,2,,1)($)
  $484F #REGa=PEEK #REGhl
  $4850 #REGb=#N(6,2,,1)($)
  $4852 Jump to #R18618
b $4854
t $4888
b $488D
c $4897
  $4897 Jump to #R18585
b $4899
c $48D1
  $48D1 #REGh=PEEK #REGhl
  $48D2 #REGh=PEEK #REGhl
  $48D3 Do nothing
  $48D4 Jump to #R18748
c $48D6
  $48D6 #REGh=#REGb
  $48D7 Do nothing
  $48D8 #REGh=PEEK #REGhl
  $48D9 Jump to #R18753
b $48DB
c $4945
  $4945 Jump to #R18871
s $4947
c $4948
  $4948 Jump to #R18864
c $494A
  $494A #REGh=#REGb
  $494B Do nothing
  $494C #REGa=PEEK #REGhl
  $494D #REGb=#N(6,2,,1)($)
  $494F #REGa=PEEK #REGhl
  $4950 #REGb=#N(6,2,,1)($)
  $4952 Jump to #R18874
b $4954
t $4988
b $498D
c $4997
  $4997 Jump to #R18841
b $4999
c $49D1
  $49D1 #REGh=PEEK #REGhl
  $49D2 #REGh=PEEK #REGhl
  $49D3 Do nothing
  $49D4 Jump to #R19004
c $49D6
  $49D6 #REGh=#REGb
  $49D7 Do nothing
  $49D8 #REGh=PEEK #REGhl
  $49D9 Jump to #R19009
b $49DB
c $4A25
  $4A25 Jump to #R19047
b $4A27
t $4A2C
b $4A35
c $4A45
  $4A45 Jump to #R19111
s $4A47
c $4A48
  $4A48 Jump to #R19120
b $4A4A
t $4A4C
c $4A52
  $4A52 Jump to #R19130
b $4A54
t $4A68
b $4A6C
t $4A71
b $4A76
t $4A88
b $4A8F
t $4A91
b $4A96
c $4A97
  $4A97 Jump to #R19097
b $4A99
t $4AAA
b $4AAD
t $4AB8
b $4ABB
t $4ACA
b $4ACD
c $4ACF
  $4ACF #REGh=#REGb
  $4AD0 #REGl=#REGh
  $4AD1 #REGh=PEEK #REGhl
  $4AD2 #REGh=PEEK #REGhl
  $4AD3 Do nothing
  $4AD4 Jump to #R19260
c $4AD6
  $4AD6 #REGh=#REGb
  $4AD7 Do nothing
  $4AD8 #REGh=PEEK #REGhl
  $4AD9 Jump to #R19265
b $4ADB
t $4AE8
b $4AEB
t $4AEE
b $4AF1
c $4B25
  $4B25 Jump to #R19303
b $4B27
t $4B2C
b $4B35
c $4B45
  $4B45 Jump to #R19367
s $4B47
c $4B48
  $4B48 Jump to #R19376
b $4B4A
t $4B4C
c $4B52
  $4B52 Jump to #R19386
b $4B54
t $4B68
b $4B6C
t $4B71
b $4B76
t $4B88
b $4B8F
t $4B91
b $4B96
c $4B97
  $4B97 Jump to #R19353
b $4B99
t $4BAA
b $4BAD
t $4BB8
b $4BBB
t $4BCA
b $4BCD
c $4BCF
  $4BCF #REGh=#REGb
  $4BD0 #REGl=#REGh
  $4BD1 #REGh=PEEK #REGhl
  $4BD2 #REGh=PEEK #REGhl
  $4BD3 Do nothing
  $4BD4 Jump to #R19516
c $4BD6
  $4BD6 #REGh=#REGb
  $4BD7 Do nothing
  $4BD8 #REGh=PEEK #REGhl
  $4BD9 Jump to #R19521
b $4BDB
t $4BE8
b $4BEB
t $4BEE
b $4BF1
c $4C48
  $4C48 Jump to #R19632
b $4C4A
t $4C4C
b $4C55
t $4C68
b $4C6E
c $4C88
  $4C88 #REGh=PEEK #REGhl
  $4C89 #REGa=#REGa+1
  $4C8A #REGa=#REGa+1
  $4C8B #REGh=PEEK #REGhl
  $4C8C #REGa=#REGh
  $4C8D #REGh=PEEK #REGhl
  $4C8E #REGa=#REGa+1
  $4C8F #REGa=PEEK #REGhl
  $4C90 Do nothing
  $4C91 #REGh=PEEK #REGhl
  $4C92 #REGa=#REGa+1
  $4C93 #REGa=#REGa+1
  $4C94 #REGh=PEEK #REGhl
  $4C95 #REGa=#REGa+1
  $4C96 #REGa=PEEK #REGhl
  $4C97 Jump to #R19609
b $4C99
t $4CB0
b $4CB3
c $4CC8
  $4CC8 #REGh=PEEK #REGhl
  $4CC9 #REGa=PEEK #REGhl
  $4CCA #REGa=#REGa+1
  $4CCB #REGa=#REGa+1
  $4CCC #REGa=#REGa+1
  $4CCD #REGa=PEEK #REGhl
  $4CCE Do nothing
  $4CCF #REGh=#REGb
  $4CD0 #REGh=PEEK #REGhl
  $4CD1 #REGa=#REGa+1
  $4CD2 #REGh=PEEK #REGhl
  $4CD3 Do nothing
  $4CD4 Jump to #R19772
b $4CD6
t $4CD8
b $4CDB
t $4CEE
b $4CF1
c $4D48
  $4D48 Jump to #R19888
b $4D4A
t $4D4C
b $4D55
t $4D68
b $4D6E
c $4D88
  $4D88 #REGh=PEEK #REGhl
  $4D89 #REGa=#REGa+1
  $4D8A #REGa=#REGa+1
  $4D8B #REGh=PEEK #REGhl
  $4D8C #REGa=#REGh
  $4D8D #REGh=PEEK #REGhl
  $4D8E #REGa=#REGa+1
  $4D8F #REGa=PEEK #REGhl
  $4D90 Do nothing
  $4D91 #REGh=PEEK #REGhl
  $4D92 #REGa=#REGa+1
  $4D93 #REGa=#REGa+1
  $4D94 #REGh=PEEK #REGhl
  $4D95 #REGa=#REGa+1
  $4D96 #REGa=PEEK #REGhl
  $4D97 Jump to #R19865
b $4D99
t $4DB0
b $4DB3
c $4DC8
  $4DC8 #REGh=PEEK #REGhl
  $4DC9 #REGa=PEEK #REGhl
  $4DCA #REGa=#REGa+1
  $4DCB #REGa=#REGa+1
  $4DCC #REGa=#REGa+1
  $4DCD #REGa=PEEK #REGhl
  $4DCE Do nothing
  $4DCF #REGh=#REGb
  $4DD0 #REGh=PEEK #REGhl
  $4DD1 #REGa=#REGa+1
  $4DD2 #REGh=PEEK #REGhl
  $4DD3 Do nothing
  $4DD4 Jump to #R20028
b $4DD6
t $4DD8
b $4DDB
t $4DEE
b $4DF1
t $4E2C
b $4E32
t $4E68
b $4E6C
t $4E6D
b $4E70
t $4E71
b $4E76
t $4EA8
b $4EAB
t $4EB0
b $4EB3
t $4EBA
b $4EBD
t $4EE8
b $4EED
t $4EEF
b $4EF2
t $4F2C
b $4F32
t $4F68
b $4F6C
t $4F6D
b $4F70
t $4F71
b $4F76
t $4FA8
b $4FAB
t $4FB0
b $4FB3
t $4FBA
b $4FBD
t $4FE8
b $4FED
t $4FEF
b $4FF2
c $5045
  $5045 #REGb=#N(112,2,,1)($)
  $5047 Do nothing
  $5048 #REGh=#REGb
  $5049 Jump to #R20679
b $504B
c $5145
  $5145 #REGb=#N(112,2,,1)($)
  $5147 Do nothing
  $5148 #REGh=#REGb
  $5149 Jump to #R20935
b $514B
t $5208
b $520B
t $520E
b $5211
t $522B
b $5231
c $524D
  $524D #REGb=PEEK #REGhl
  $524E Jump to #R21174
b $5250
t $5308
b $530B
t $530E
b $5311
t $532B
b $5331
c $534D
  $534D #REGb=PEEK #REGhl
  $534E Jump to #R21430
b $5350
c $5408
  $5408 #REGa=#REGa+1
  $5409 #REGh=PEEK #REGhl
  $540A Jump to #R21642
b $540C
t $540E
b $5411
t $5429
b $542D
t $544B
b $5451
c $5508
  $5508 #REGa=#REGa+1
  $5509 #REGh=PEEK #REGhl
  $550A Jump to #R21898
b $550C
t $550E
b $5511
t $5529
b $552D
t $554B
b $5551
c $5625
  $5625 #REGa=#REGh
  $5626 POKE #REGhl,#REGb
  $5627 Do nothing
  $5628 #REGa=#REGb
  $5629 Jump to #R22129
t $562B
b $562E
c $5725
  $5725 #REGa=#REGh
  $5726 POKE #REGhl,#REGb
  $5727 Do nothing
  $5728 #REGa=#REGb
  $5729 Jump to #R22385
t $572B
b $572E
t $5845
b $5849
t $584A
b $584F
t $5851
b $5856
t $5857
b $585B
t $5865
b $5869
t $586A
b $586F
t $5871
b $5876
t $5877
b $587B
t $58E5
b $58EA
t $58EB
b $58F5
t $5925
b $5935
t $5965
b $5978
t $59A5
b $59BD
t $59E5
b $59F2
t $5A25
b $5A31
t $5E1D
c $5E21
  $5E21 Jump to #R24177
b $5E23
c $5E34
  $5E34 #REGbc=#N(41619,4,,1)($)
  $5E37 Return if the carry flag is set
  $5E38 #REGa=#REGa|#REGc
  $5E39 Do nothing
  $5E3A #REGsp=#N(24121,4,,1)($)
  $5E3D Jump to #R45507
c $5E40
  $5E40 #REGa=PEEK #N(46854,4,,1)($)
  $5E43 Clear the carry flag and set the zero flag if #REGa=0
  $5E44 Return if #REGa=0
  $5E45 #REGa=PEEK #N(46866,4,,1)($)
  $5E48 POKE #N(24055,4,,1)($),#REGa
  $5E4B Return
c $5E4C
  $5E4C CALL #R45229
  $5E4F CALL #R41489
  $5E52 #REGa=0
  $5E53 POKE #N(46866,4,,1)($),#REGa
  $5E56 CALL #R40277
  $5E59 CALL #R41840
  $5E5C CALL #R29832
  $5E5F #REGa=0
  $5E60 CALL #R29096
  $5E63 #REGa=#N(1,2,,1)($)
  $5E65 POKE #N(46866,4,,1)($),#REGa
  $5E68 #REGa=PEEK #N(46854,4,,1)($)
  $5E6B Clear the carry flag and set the zero flag if #REGa=0
  $5E6C Jump to #R24180 if #REGa>0
  $5E6E CALL #R40277
  $5E71 CALL #R41840
  $5E74 CALL #R42100
  $5E77 CALL #R29143
  $5E7A #REGhl=#N(8723,4,,1)($)
  $5E7D POKE #N(46855,4,,1)($),#REGl; POKE #N(46856,4,,1)($),#REGh
  $5E80 POKE #N(46859,4,,1)($),#REGl; POKE #N(46860,4,,1)($),#REGh
  $5E83 #REGhl=#N(1285,4,,1)($)
  $5E86 POKE #N(46857,4,,1)($),#REGl; POKE #N(46858,4,,1)($),#REGh
  $5E89 POKE #N(46861,4,,1)($),#REGl; POKE #N(46862,4,,1)($),#REGh
  $5E8C CALL #R41710
  $5E8F CALL #R29832
  $5E92 CALL #R45559
  $5E95 #REGa=0
  $5E96 POKE #N(46866,4,,1)($),#REGa
  $5E99 POKE #N(23862,4,,1)($),#REGa
  $5E9C POKE #N(23830,4,,1)($),#REGa
  $5E9F #REGhl=#N(46865,4,,1)($)
  $5EA2 POKE #REGhl,(PEEK #REGhl)+1
  $5EA3 CALL #R41710
  $5EA6 #REGb=#N(20,2,,1)($)
  $5EA8 Push #REGbc onto the stack
  $5EA9 #REGa=#N(160,2,,1)($)
  $5EAB #REGa=#REGa-#REGb
  $5EAC POKE #N(23846,4,,1)($),#REGa
  $5EAF CALL #R26562
  $5EB2 #REGa=PEEK #N(46866,4,,1)($)
  $5EB5 Clear the carry flag and set the zero flag if #REGa=0
  $5EB6 Jump to #R24266 if #REGa>0
  $5EB8 #REGa=PEEK #N(23846,4,,1)($)
  $5EBB #REGa=#REGa-#N(140,2,,1)($)
  $5EBD #REGe=#REGa
  $5EBE #REGd=#N(0,2,,1)($)
  $5EC0 #REGhl=#N(46650,4,,1)($)
  $5EC3 #REGhl=#REGhl+#REGde
  $5EC4 #REGa=PEEK #REGhl
  $5EC5 Clear the carry flag and set the zero flag if #REGa=0
  $5EC6 Jump to #R24266 if #REGa=0
  $5EC8 #REGa=#REGa-1
  $5EC9 POKE #REGhl,#REGa
  $5ECA #REGa=PEEK (#REGix+#N(37,2,,1)($))
  $5ECD Keep only bit 0 of #REGa
  $5ECF #REGhl=#N(46866,4,,1)($)
  $5ED2 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $5ED3 Jump to #R24393 if #REGa<>PEEK #REGhl
  $5ED5 Reset bit 6 of (#REGix+#N(37,2,,1)($))
  $5ED9 CALL #R32402
  $5EDC #REGa=PEEK (#REGix+#N(27,2,,1)($))
  $5EDF #REGa=#REGa-PEEK (#REGix+#N(25,2,,1)($))
  $5EE2 POKE (#REGix+#N(5,2,,1)($)),#REGa
  $5EE5 POKE (#REGix+#N(6,2,,1)($)),#REGa
  $5EE8 CALL #R27433
  $5EEB #REGb=#REGa
  $5EEC #REGa=PEEK (#REGix+#N(6,2,,1)($))
  $5EEF #REGa=#REGa-#REGb
  $5EF0 #REGa=#REGa-PEEK (#REGix+#N(17,2,,1)($))
  $5EF3 POKE (#REGix+#N(6,2,,1)($)),#REGa
  $5EF6 #REGb=PEEK (#REGix+#N(5,2,,1)($))
  $5EF9 Shift #REGb right (copying bit 0 into the carry flag, and resetting bit 7)
  $5EFB #REGa=PEEK (#REGix+#N(34,2,,1)($))
  $5EFE Set the zero flag if #REGa=#REGb, or the carry flag if #REGa<#REGb
  $5EFF Jump to #R24361 if #REGa=#REGb
  $5F01 Jump to #R24337 if the carry flag is set
  $5F03 #REGa=#REGa-#REGb
  $5F04 #REGc=#REGa
  $5F05 #REGa=PEEK (#REGix+#N(10,2,,1)($))
  $5F08 #REGa=#REGa-#REGc
  $5F09 Jump to #R24332 if the carry flag is not set
  $5F0B #REGa=0
  $5F0C POKE (#REGix+#N(10,2,,1)($)),#REGa
  $5F0F Jump to #R24361
c $5F11
  $5F11 #REGa=#REGb
  $5F12 #REGa=#REGa-PEEK (#REGix+#N(34,2,,1)($))
  $5F15 #REGc=#REGa
  $5F16 #REGa=PEEK (#REGix+#N(10,2,,1)($))
  $5F19 #REGa=#REGa+#REGc
  $5F1A Jump to #R24350 if the carry flag is not set
  $5F1C #REGa=#N(255,2,,1)($)
  $5F1E Set the zero flag if #REGa=PEEK (#REGix+#N(9,2,,1)($)), or the carry flag if #REGa<PEEK (#REGix+#N(9,2,,1)($))
  $5F21 Jump to #R24358 if #REGa<PEEK (#REGix+#N(9,2,,1)($))
  $5F23 #REGa=PEEK (#REGix+#N(9,2,,1)($))
  $5F26 POKE (#REGix+#N(10,2,,1)($)),#REGa
  $5F29 POKE (#REGix+#N(34,2,,1)($)),0
  $5F2D #REGa=PEEK (#REGix+#N(10,2,,1)($))
  $5F30 Set the zero flag if #REGa=#N(32,2,,1)($), or the carry flag if #REGa<#N(32,2,,1)($)
  $5F32 Jump to #R24376 if #REGa>=#N(32,2,,1)($)
  $5F34 Shift (#REGix+#N(6,2,,1)($)) right (copying bit 0 into the carry flag, and resetting bit 7)
  $5F38 #REGa=PEEK (#REGix+#N(5,2,,1)($))
  $5F3B #REGb=#N(10,2,,1)($)
  $5F3D CALL #R27417
  $5F40 #REGa=#REGc
  $5F41 Set the zero flag if #REGa=PEEK (#REGix+#N(6,2,,1)($)), or the carry flag if #REGa<PEEK (#REGix+#N(6,2,,1)($))
  $5F44 Jump to #R24393 if #REGa<PEEK (#REGix+#N(6,2,,1)($))
  $5F46 POKE (#REGix+#N(6,2,,1)($)),#REGa
  $5F49 Pop last item from stack into #REGbc
  $5F4A #REGb=#REGb-1
  $5F4B Jump to #R24232 if #REGb>0
  $5F4E CALL #R30535
  $5F51 CALL #R24487
  $5F54 #REGa=PEEK #REGhl
  $5F55 POKE #N(23804,4,,1)($),#REGa
  $5F58 #REGhl=#REGhl+1
  $5F59 #REGa=PEEK #REGhl
  $5F5A POKE #N(23805,4,,1)($),#REGa
  $5F5D #REGhl=#REGhl+1
  $5F5E #REGa=PEEK #REGhl
  $5F5F POKE #N(23825,4,,1)($),#REGa
  $5F62 #REGhl=#REGhl+1
  $5F63 #REGa=PEEK #REGhl
  $5F64 POKE #N(23826,4,,1)($),#REGa
  $5F67 CALL #R24128
  $5F6A #REGa=PEEK #N(24055,4,,1)($)
  $5F6D Clear the carry flag and set the zero flag if #REGa=0
  $5F6E Jump to #R24437 if #REGa=0
  $5F70 CALL #R46625
  $5F73 Jump to #R24443
c $5F75
  $5F75 CALL #R24500
  $5F78 CALL #R26958
  $5F7B CALL #R24487
  $5F7E #REGa=PEEK #N(23804,4,,1)($)
  $5F81 POKE #REGhl,#REGa
  $5F82 #REGhl=#REGhl+1
  $5F83 #REGa=PEEK #N(23805,4,,1)($)
  $5F86 POKE #REGhl,#REGa
  $5F87 #REGhl=#REGhl+1
  $5F88 #REGa=PEEK #N(23825,4,,1)($)
  $5F8B POKE #REGhl,#REGa
  $5F8C #REGhl=#REGhl+1
  $5F8D #REGa=PEEK #N(23826,4,,1)($)
  $5F90 POKE #REGhl,#REGa
  $5F91 CALL #R46640
  $5F94 CALL #R40075
  $5F97 #REGhl=#N(46866,4,,1)($)
  $5F9A POKE #REGhl,(PEEK #REGhl)+1
  $5F9B #REGa=PEEK #REGhl
  $5F9C Set the zero flag if #REGa=#N(2,2,,1)($), or the carry flag if #REGa<#N(2,2,,1)($)
  $5F9E Jump to #R24230 if #REGa<#N(2,2,,1)($)
  $5FA1 CALL #R42148
  $5FA4 Jump to #R24210
c $5FA7
  $5FA7 #REGa=PEEK #N(46866,4,,1)($)
  $5FAA #REGl=#REGa
  $5FAB #REGh=#N(0,2,,1)($)
  $5FAD #REGde=#N(46855,4,,1)($)
  $5FB0 #REGhl=#REGhl+#REGhl
  $5FB1 #REGhl=#REGhl+#REGhl
  $5FB2 #REGhl=#REGhl+#REGde
  $5FB3 Return
c $5FB4
  $5FB4 CALL #R24620
  $5FB7 #REGa=#N(84,2,,1)($)
  $5FB9 CALL #R26462
  $5FBC #REGhl=#N(18183,4,,1)($)
  $5FBF POKE #N(23808,4,,1)($),#REGl; POKE #N(23809,4,,1)($),#REGh
  $5FC2 #REGhl=#N(3078,4,,1)($)
  $5FC5 #REGa=PEEK #N(46866,4,,1)($)
  $5FC8 #REGa=#REGa+#N(160,2,,1)($)
  $5FCA CALL #R27514
  $5FCD #REGa=PEEK #N(46865,4,,1)($)
  $5FD0 #REGhl=#N(2569,4,,1)($)
  $5FD3 POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $5FD6 CALL #R26360
  $5FD9 #REGhl=#N(46865,4,,1)($)
  $5FDC #REGa=PEEK #N(46849,4,,1)($)
  $5FDF #REGa=#REGa-PEEK #REGhl
  $5FE0 #REGhl=#N(6409,4,,1)($)
  $5FE3 POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $5FE6 CALL #R26360
  $5FE9 CALL #R24574
  $5FEC #REGa=#N(83,2,,1)($)
  $5FEE CALL #R26476
  $5FF1 CALL #R27245
  $5FF4 CALL #R30711
  $5FF7 CALL #R24620
  $5FFA CALL #R27245
  $5FFD Return
c $5FFE
  $5FFE #REGa=#N(104,2,,1)($)
  $6000 CALL #R26462
  $6003 #REGa=PEEK #N(46863,4,,1)($)
  $6006 #REGhl=#N(1296,4,,1)($)
  $6009 POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $600C CALL #R26360
  $600F #REGhl=#N(2576,4,,1)($)
  $6012 #REGa=#N(160,2,,1)($)
  $6014 CALL #R27514
  $6017 #REGa=PEEK #N(46864,4,,1)($)
  $601A #REGhl=#N(1299,4,,1)($)
  $601D POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $6020 CALL #R26360
  $6023 #REGa=#N(161,2,,1)($)
  $6025 #REGhl=#N(2579,4,,1)($)
  $6028 CALL #R27514
  $602B Return
c $602C
  $602C #REGa=0
  $602D #REGhl=#N(23295,4,,1)($)
  $6030 #REGde=#N(23294,4,,1)($)
  $6033 #REGbc=#N(767,4,,1)($)
  $6036 POKE #REGhl,#REGa
  $6037 POKE #REGde,PEEK #REGhl; #REGhl=#REGhl-1; #REGde=#REGde-1; #REGbc=#REGbc-1; repeat until #REGbc=0
  $6039 #REGhl=#REGhl-1
  $603A #REGde=#REGde-1
  $603B POKE #REGhl,#REGc
  $603C #REGbc=#N(6143,4,,1)($)
  $603F POKE #REGde,PEEK #REGhl; #REGhl=#REGhl-1; #REGde=#REGde-1; #REGbc=#REGbc-1; repeat until #REGbc=0
  $6041 Return
b $6042
t $6053
b $6056
t $6063
b $6066
c $6067
  $6067 #REGd=#REGb
  $6068 #REGh=#REGb
  $6069 #REGd=#REGb
  $606A #REGa=#REGa+#REGb
  $606B #REGd=#REGb
  $606C #REGa=#REGa&#REGb
  $606D #REGd=#REGb
  $606E Return if the zero flag is not set
  $606F #REGd=#REGb
  $6070 Return if the parity/overflow flag is not set (parity odd)
  $6071 #REGd=#REGb
  $6072 Push #REGhl onto the stack
  $6073 Push #REGde onto the stack
  $6074 Push #REGaf onto the stack
  $6075 #REGe=PEEK #N(23806,4,,1)($); #REGd=PEEK #N(23807,4,,1)($)
  $6079 #REGa=#REGd
  $607A #REGd=#N(0,2,,1)($)
  $607C #REGhl=#N(24642,4,,1)($)
  $607F #REGhl=#REGhl+#REGde
  $6080 #REGhl=#REGhl+#REGde
  $6081 #REGe=PEEK #REGhl
  $6082 #REGhl=#REGhl+1
  $6083 #REGd=PEEK #REGhl
  $6084 #REGl=#REGa
  $6085 #REGh=#N(0,2,,1)($)
  $6087 #REGhl=#REGhl+#REGde
  $6088 Pop last item from stack into #REGaf
  $6089 Push #REGhl onto the stack
  $608A #REGde=#N(45369,4,,1)($)
  $608D #REGh=#N(0,2,,1)($)
  $608F #REGl=#REGa
  $6090 #REGhl=#REGhl+#REGhl
  $6091 #REGhl=#REGhl+#REGhl
  $6092 #REGhl=#REGhl+#REGhl
  $6093 #REGhl=#REGhl+#REGde
  $6094 Pop last item from stack into #REGde
  $6095 #REGb=#N(8,2,,1)($)
  $6097 #REGa=PEEK #REGhl
  $6098 POKE #REGde,#REGa
  $6099 #REGd=#REGd+1
  $609A #REGhl=#REGhl+1
  $609B Decrement #REGb and jump to #R24727 if #REGb>0
  $609D Exchange #REGde and #REGhl
  $609E #REGh=#REGh-1
  $609F #REGa=#REGh
  $60A0 Rotate #REGa right circular (copying bit 0 into bit 7 and into the carry flag)
  $60A1 Rotate #REGa right circular (copying bit 0 into bit 7 and into the carry flag)
  $60A2 Rotate #REGa right circular (copying bit 0 into bit 7 and into the carry flag)
  $60A3 Keep only bits 0 and 1 of #REGa
  $60A5 Set bits 3, 4 and 6 of #REGa
  $60A7 #REGh=#REGa
  $60A8 #REGa=PEEK #N(23808,4,,1)($)
  $60AB POKE #REGhl,#REGa
  $60AC Pop last item from stack into #REGde
  $60AD Pop last item from stack into #REGhl
  $60AE Return
c $60AF
  $60AF #REGl=#REGa
  $60B0 #REGh=#N(0,2,,1)($)
  $60B2 #REGhl=#REGhl+#REGhl
  $60B3 #REGhl=#REGhl+#REGhl
  $60B4 #REGhl=#REGhl+#REGhl
  $60B5 #REGhl=#REGhl+#REGhl
  $60B6 #REGhl=#REGhl+#REGhl
  $60B7 #REGbc=#N(59615,4,,1)($)
  $60BA #REGhl=#REGhl+#REGbc
  $60BB POKE #N(23822,4,,1)($),#REGl; POKE #N(23823,4,,1)($),#REGh
  $60BE #REGe=PEEK #N(23806,4,,1)($); #REGd=PEEK #N(23807,4,,1)($)
  $60C2 #REGa=#REGd
  $60C3 #REGd=#N(0,2,,1)($)
  $60C5 #REGhl=#N(24642,4,,1)($)
  $60C8 #REGhl=#REGhl+#REGde
  $60C9 #REGhl=#REGhl+#REGde
  $60CA #REGe=PEEK #REGhl
  $60CB #REGhl=#REGhl+1
  $60CC #REGd=PEEK #REGhl
  $60CD #REGhl=#REGhl+1
  $60CE #REGc=PEEK #REGhl
  $60CF #REGhl=#REGhl+1
  $60D0 #REGb=PEEK #REGhl
  $60D1 #REGl=#REGa
  $60D2 #REGh=#N(0,2,,1)($)
  $60D4 #REGhl=#REGhl+#REGbc
  $60D5 Push #REGhl onto the stack
  $60D6 #REGl=#REGa
  $60D7 #REGh=#N(0,2,,1)($)
  $60D9 #REGhl=#REGhl+#REGde
  $60DA #REGe=PEEK #N(23822,4,,1)($); #REGd=PEEK #N(23823,4,,1)($)
  $60DE CALL #R24839
  $60E1 #REGhl=#REGhl+1
  $60E2 CALL #R24839
  $60E5 Pop last item from stack into #REGhl
  $60E6 CALL #R24839
  $60E9 #REGhl=#REGhl+1
  $60EA CALL #R24839
  $60ED #REGa=#REGh
  $60EE #REGa=#REGa+#N(7,2,,1)($)
  $60F0 Rotate #REGa right circular (copying bit 0 into bit 7 and into the carry flag)
  $60F1 Rotate #REGa right circular (copying bit 0 into bit 7 and into the carry flag)
  $60F2 Rotate #REGa right circular (copying bit 0 into bit 7 and into the carry flag)
  $60F3 Keep only bits 0 and 1 of #REGa
  $60F5 Set bits 3, 4 and 6 of #REGa
  $60F7 #REGh=#REGa
  $60F8 #REGa=PEEK #N(23808,4,,1)($)
  $60FB POKE #REGhl,#REGa
  $60FC #REGhl=#REGhl-1
  $60FD POKE #REGhl,#REGa
  $60FE #REGbc=#N(31,4,,1)($)
  $6101 #REGhl=#REGhl-carry-#REGbc
  $6103 POKE #REGhl,#REGa
  $6104 #REGhl=#REGhl-1
  $6105 POKE #REGhl,#REGa
  $6106 Return
c $6107
  $6107 Push #REGhl onto the stack
  $6108 #REGb=#N(8,2,,1)($)
  $610A #REGa=PEEK #REGde
  $610B POKE #REGhl,#REGa
  $610C #REGde=#REGde+1
  $610D #REGh=#REGh+1
  $610E Decrement #REGb and jump to #R24842 if #REGb>0
  $6110 Pop last item from stack into #REGhl
  $6111 Return
c $6112
  $6112 #REGl=#REGe
  $6113 #REGh=#N(0,2,,1)($)
  $6115 #REGhl=#REGhl+#REGhl
  $6116 #REGhl=#REGhl+#REGhl
  $6117 #REGhl=#REGhl+#REGhl
  $6118 #REGhl=#REGhl+#REGhl
  $6119 #REGhl=#REGhl+#REGhl
  $611A #REGhl=#REGhl+#REGhl
  $611B #REGa=#REGd
  $611C #REGd=#N(0,2,,1)($)
  $611E #REGb=#N(16,2,,1)($)
  $6120 #REGhl=#REGhl+#REGde
  $6121 Decrement #REGb and jump to #R24864 if #REGb>0
  $6123 #REGe=#REGa
  $6124 #REGhl=#REGhl+#REGde
  $6125 #REGde=#N(54975,4,,1)($)
  $6128 #REGhl=#REGhl+#REGde
  $6129 Return
c $612A
  $612A #REGa=0
  $612B POKE #N(46869,4,,1)($),#REGa
  $612E #REGe=PEEK #N(23804,4,,1)($); #REGd=PEEK #N(23805,4,,1)($)
  $6132 CALL #R24850
  $6135 POKE #N(23810,4,,1)($),#REGl; POKE #N(23811,4,,1)($),#REGh
  $6138 #REGa=#N(1,2,,1)($)
  $613A POKE #N(23806,4,,1)($),#REGa
  $613D #REGb=#N(11,2,,1)($)
  $613F Push #REGbc onto the stack
  $6140 #REGa=#N(1,2,,1)($)
  $6142 POKE #N(23807,4,,1)($),#REGa
  $6145 #REGb=#N(11,2,,1)($)
  $6147 Push #REGbc onto the stack
  $6148 #REGl=PEEK #N(23810,4,,1)($); #REGh=PEEK #N(23811,4,,1)($)
  $614B #REGa=PEEK #REGhl
  $614C #REGhl=#REGhl+1
  $614D POKE #N(23810,4,,1)($),#REGl; POKE #N(23811,4,,1)($),#REGh
  $6150 CALL #R24942
  $6153 #REGhl=#N(23807,4,,1)($)
  $6156 POKE #REGhl,(PEEK #REGhl)+1
  $6157 POKE #REGhl,(PEEK #REGhl)+1
  $6158 Pop last item from stack into #REGbc
  $6159 Decrement #REGb and jump to #R24903 if #REGb>0
  $615B #REGl=PEEK #N(23810,4,,1)($); #REGh=PEEK #N(23811,4,,1)($)
  $615E #REGde=#N(69,4,,1)($)
  $6161 #REGhl=#REGhl+#REGde
  $6162 POKE #N(23810,4,,1)($),#REGl; POKE #N(23811,4,,1)($),#REGh
  $6165 #REGhl=#N(23806,4,,1)($)
  $6168 POKE #REGhl,(PEEK #REGhl)+1
  $6169 POKE #REGhl,(PEEK #REGhl)+1
  $616A Pop last item from stack into #REGbc
  $616B Decrement #REGb and jump to #R24895 if #REGb>0
  $616D Return
c $616E
  $616E #REGh=#N(0,2,,1)($)
  $6170 #REGl=#REGa
  $6171 #REGhl=#REGhl+#REGhl
  $6172 #REGe=PEEK #N(46870,4,,1)($); #REGd=PEEK #N(46871,4,,1)($)
  $6176 #REGhl=#REGhl+#REGde
  $6177 #REGa=PEEK #REGhl
  $6178 POKE #N(23808,4,,1)($),#REGa
  $617B #REGhl=#REGhl+1
  $617C #REGa=PEEK #REGhl
  $617D CALL #R24751
  $6180 Return
c $6181
  $6181 #REGe=PEEK #N(23804,4,,1)($); #REGd=PEEK #N(23805,4,,1)($)
  $6185 CALL #R24850
  $6188 POKE #N(23810,4,,1)($),#REGl; POKE #N(23811,4,,1)($),#REGh
  $618B #REGc=#N(11,2,,1)($)
  $618D #REGa=#N(1,2,,1)($)
  $618F POKE #N(23807,4,,1)($),#REGa
  $6192 #REGa=#N(1,2,,1)($)
  $6194 POKE #N(23806,4,,1)($),#REGa
  $6197 #REGb=#N(11,2,,1)($)
  $6199 Push #REGbc onto the stack
  $619A #REGl=PEEK #N(23810,4,,1)($); #REGh=PEEK #N(23811,4,,1)($)
  $619D #REGa=PEEK #REGhl
  $619E #REGde=#N(80,4,,1)($)
  $61A1 #REGhl=#REGhl+#REGde
  $61A2 POKE #N(23810,4,,1)($),#REGl; POKE #N(23811,4,,1)($),#REGh
  $61A5 CALL #R24942
  $61A8 #REGhl=#N(23806,4,,1)($)
  $61AB POKE #REGhl,(PEEK #REGhl)+1
  $61AC POKE #REGhl,(PEEK #REGhl)+1
  $61AD Pop last item from stack into #REGbc
  $61AE Decrement #REGb and jump to #R24985 if #REGb>0
  $61B0 #REGl=PEEK #N(23810,4,,1)($); #REGh=PEEK #N(23811,4,,1)($)
  $61B3 #REGde=#N(64657,4,,1)($)
  $61B6 #REGhl=#REGhl+#REGde
  $61B7 POKE #N(23810,4,,1)($),#REGl; POKE #N(23811,4,,1)($),#REGh
  $61BA #REGhl=#N(23807,4,,1)($)
  $61BD POKE #REGhl,(PEEK #REGhl)+1
  $61BE POKE #REGhl,(PEEK #REGhl)+1
  $61BF #REGc=#REGc-1
  $61C0 Jump to #R24978 if #REGc>0
  $61C2 Return
c $61C3
  $61C3 Push #REGaf onto the stack
  $61C4 Push #REGbc onto the stack
  $61C5 Push #REGde onto the stack
  $61C6 Push #REGhl onto the stack
  $61C7 #REGhl=#N(46874,4,,1)($)
  $61CA POKE #REGhl,(PEEK #REGhl)-1
  $61CB #REGa=PEEK #N(46874,4,,1)($)
  $61CE Clear the carry flag and set the zero flag if #REGa=0
  $61CF Jump to #R25074 if #REGa>0
  $61D1 #REGa=PEEK #N(23830,4,,1)($)
  $61D4 Clear the carry flag and set the zero flag if #REGa=0
  $61D5 Jump to #R25062 if #REGa>0
  $61D7 CALL #R25654
  $61DA #REGa=#N(1,2,,1)($)
  $61DC POKE #N(23830,4,,1)($),#REGa
  $61DF #REGhl=#N(46874,4,,1)($)
  $61E2 POKE #REGhl,#N(255,2,,1)($)
  $61E4 Jump to #R25074
c $61E6
  $61E6 CALL #R25674
  $61E9 #REGa=0
  $61EA POKE #N(23830,4,,1)($),#REGa
  $61ED #REGhl=#N(46874,4,,1)($)
  $61F0 POKE #REGhl,#N(140,2,,1)($)
  $61F2 CALL #R45256
  $61F5 #REGb=#N(120,2,,1)($)
  $61F7 Decrement #REGb and jump to #R25079 if #REGb>0
  $61F9 CALL #R25334
  $61FC CALL #R25252
  $61FF #REGa=PEEK #N(23837,4,,1)($)
  $6202 Clear the carry flag and set the zero flag if #REGa=0
  $6203 Jump to #R25104 if #REGa=0
  $6205 #REGhl=#N(46874,4,,1)($)
  $6208 POKE #REGhl,#N(1,2,,1)($)
  $620A #REGa=0
  $620B POKE #N(23830,4,,1)($),#REGa
  $620E Jump to #R25031
c $6210
  $6210 Pop last item from stack into #REGhl
  $6211 Pop last item from stack into #REGde
  $6212 Pop last item from stack into #REGbc
  $6213 Pop last item from stack into #REGaf
  $6214 Return
c $6215
  $6215 Push #REGaf onto the stack
  $6216 Push #REGbc onto the stack
  $6217 Push #REGde onto the stack
  $6218 Push #REGhl onto the stack
  $6219 #REGhl=#N(23831,4,,1)($)
  $621C POKE #REGhl,(PEEK #REGhl)-1
  $621D CALL #R25156 if (PEEK #REGhl)=0
  $6220 CALL #R45256
  $6223 #REGa=PEEK #N(23850,4,,1)($)
  $6226 Set the zero flag if bit 0 of #REGa is 0
  $6228 Jump to #R25151 if bit 0 of #REGa is reset
  $622A Set bits 0, 5, 6 and 7 of #REGa
  $622C Set the zero flag if #REGa=#N(255,2,,1)($), or the carry flag if #REGa<#N(255,2,,1)($)
  $622E Jump to #R25143 if #REGa<>#N(255,2,,1)($)
  $6230 #REGa=0
  $6231 POKE #N(23832,4,,1)($),#REGa
  $6234 POKE #N(23835,4,,1)($),#REGa
  $6237 CALL #R25167 if the zero flag is not set
  $623A CALL #R25311
  $623D Jump to #R25113
c $623F
  $623F Pop last item from stack into #REGhl
  $6240 Pop last item from stack into #REGde
  $6241 Pop last item from stack into #REGbc
  $6242 Pop last item from stack into #REGaf
  $6243 Return
c $6244
  $6244 #REGa=#N(1,2,,1)($)
  $6246 #REGhl=#N(23834,4,,1)($)
  $6249 #REGa=#REGa-PEEK #REGhl
  $624A POKE #REGhl,#REGa
  $624B CALL #R35706
  $624E Return
c $624F
  $624F #REGa=PEEK #N(23834,4,,1)($)
  $6252 Clear the carry flag and set the zero flag if #REGa=0
  $6253 CALL #R35706 if #REGa>0
  $6256 CALL #R25345
  $6259 #REGa=PEEK #N(25435,4,,1)($)
  $625C Clear the carry flag and set the zero flag if #REGa=0
  $625D Jump to #R25194 if #REGa=0
  $625F CALL #R25610
  $6262 #REGa=0
  $6263 POKE #N(23834,4,,1)($),#REGa
  $6266 POKE #N(25435,4,,1)($),#REGa
  $6269 Return
c $626A
  $626A CALL #R35706
  $626D #REGa=PEEK #N(23832,4,,1)($)
  $6270 Clear the carry flag and set the zero flag if #REGa=0
  $6271 CALL #R25321 if #REGa=0
  $6274 CALL #R25222
  $6277 #REGa=0
  $6278 POKE #N(23831,4,,1)($),#REGa
  $627B POKE #N(25435,4,,1)($),#REGa
  $627E #REGa=#REGa+1
  $627F POKE #N(23834,4,,1)($),#REGa
  $6282 POKE #N(23832,4,,1)($),#REGa
  $6285 Return
c $6286
  $6286 #REGb=#N(12,2,,1)($)
  $6288 Push #REGbc onto the stack
  $6289 #REGa=PEEK #N(23835,4,,1)($)
  $628C #REGb=#REGa
  $628D Do nothing
  $628E Decrement #REGb and jump to #R25229 if #REGb>0
  $6290 Pop last item from stack into #REGbc
  $6291 Decrement #REGb and jump to #R25224 if #REGb>0
  $6293 #REGa=PEEK #N(23835,4,,1)($)
  $6296 #REGa=#REGa-#N(6,2,,1)($)
  $6298 POKE #N(23835,4,,1)($),#REGa
  $629B Set the zero flag if #REGa=#N(8,2,,1)($), or the carry flag if #REGa<#N(8,2,,1)($)
  $629D Return if #REGa>=#N(8,2,,1)($)
  $629E #REGa=#N(8,2,,1)($)
  $62A0 POKE #N(23835,4,,1)($),#REGa
  $62A3 Return
c $62A4
  $62A4 #REGa=PEEK #N(23837,4,,1)($)
  $62A7 Clear the carry flag and set the zero flag if #REGa=0
  $62A8 #REGa=PEEK #N(23824,4,,1)($)
  $62AB Jump to #R25281 if the zero flag is not set
  $62AD Clear the carry flag and set the zero flag if #REGa=0
  $62AE Return if #REGa>0
  $62AF #REGa=#REGa+1
  $62B0 POKE #N(23824,4,,1)($),#REGa
  $62B3 #REGa=PEEK #N(41839,4,,1)($)
  $62B6 Clear the carry flag and set the zero flag if #REGa=0
  $62B7 Return if #REGa>0
  $62B8 #REGa=#N(3,2,,1)($)
  $62BA CALL #R26462
  $62BD CALL #R26648
  $62C0 Return
c $62C1
  $62C1 Clear the carry flag and set the zero flag if #REGa=0
  $62C2 Return if #REGa=0
  $62C3 #REGa=PEEK #N(41839,4,,1)($)
  $62C6 Clear the carry flag and set the zero flag if #REGa=0
  $62C7 Jump to #R25294 if #REGa>0
  $62C9 #REGa=#N(3,2,,1)($)
  $62CB CALL #R26462
  $62CE #REGb=#N(160,2,,1)($)
  $62D0 CALL #R25311
  $62D3 Decrement #REGb and jump to #R25296 if #REGb>0
  $62D5 #REGa=0
  $62D6 POKE #N(23824,4,,1)($),#REGa
  $62D9 Return
c $62DA
  $62DA Push #REGbc onto the stack
  $62DB #REGb=#N(3,2,,1)($)
  $62DD Jump to #R25324
c $62DF
  $62DF Push #REGbc onto the stack
  $62E0 #REGb=#N(1,2,,1)($)
  $62E2 Jump to #R25324
c $62E4
  $62E4 Push #REGbc onto the stack
  $62E5 #REGb=#N(40,2,,1)($)
  $62E7 Jump to #R25324
c $62E9
  $62E9 Push #REGbc onto the stack
  $62EA #REGb=#N(200,2,,1)($)
  $62EC Push #REGbc onto the stack
  $62ED #REGb=#N(255,2,,1)($)
  $62EF Decrement #REGb and jump to #R25327 if #REGb>0
  $62F1 Pop last item from stack into #REGbc
  $62F2 Decrement #REGb and jump to #R25324 if #REGb>0
  $62F4 Pop last item from stack into #REGbc
  $62F5 Return
c $62F6
  $62F6 CALL #R25345
  $62F9 #REGa=PEEK #N(23837,4,,1)($)
  $62FC Clear the carry flag and set the zero flag if #REGa=0
  $62FD CALL #R25570 if #REGa>0
  $6300 Return
c $6301
  $6301 #REGa=0
  $6302 POKE #N(23836,4,,1)($),#REGa
  $6305 POKE #N(23837,4,,1)($),#REGa
  $6308 POKE #N(23838,4,,1)($),#REGa
  $630B #REGl=PEEK #N(23825,4,,1)($); #REGh=PEEK #N(23826,4,,1)($)
  $630E POKE #N(23827,4,,1)($),#REGl; POKE #N(23828,4,,1)($),#REGh
  $6311 #REGa=PEEK #N(23850,4,,1)($)
  $6314 Set the zero flag if bit 1 of #REGa is 0
  $6316 CALL #R25389 if bit 1 of #REGa is reset
  $6319 Set the zero flag if bit 2 of #REGa is 0
  $631B CALL #R25398 if bit 2 of #REGa is reset
  $631E Set the zero flag if bit 3 of #REGa is 0
  $6320 CALL #R25407 if bit 3 of #REGa is reset
  $6323 Set the zero flag if bit 4 of #REGa is 0
  $6325 CALL #R25416 if bit 4 of #REGa is reset
  $6328 #REGhl=#N(23838,4,,1)($)
  $632B POKE #REGhl,(PEEK #REGhl)-1
  $632C Return
c $632D
  $632D Push #REGaf onto the stack
  $632E CALL #R25504
  $6331 CALL #R25425
  $6334 Pop last item from stack into #REGaf
  $6335 Return
c $6336
  $6336 Push #REGaf onto the stack
  $6337 CALL #R25536
  $633A CALL #R25425
  $633D Pop last item from stack into #REGaf
  $633E Return
c $633F
  $633F Push #REGaf onto the stack
  $6340 CALL #R25436
  $6343 CALL #R25425
  $6346 Pop last item from stack into #REGaf
  $6347 Return
c $6348
  $6348 Push #REGaf onto the stack
  $6349 CALL #R25472
  $634C CALL #R25425
  $634F Pop last item from stack into #REGaf
  $6350 Return
c $6351
  $6351 #REGa=#N(1,2,,1)($)
  $6353 POKE #N(23837,4,,1)($),#REGa
  $6356 #REGhl=#N(23838,4,,1)($)
  $6359 POKE #REGhl,(PEEK #REGhl)+1
  $635A Return
s $635B
c $635C
  $635C #REGl=PEEK #N(23825,4,,1)($); #REGh=PEEK #N(23826,4,,1)($)
  $635F #REGa=PEEK #N(46872,4,,1)($)
  $6362 Set the zero flag if #REGa=#REGh, or the carry flag if #REGa<#REGh
  $6363 Jump to #R25467 if #REGa<>#REGh
  $6365 #REGl=PEEK #N(23804,4,,1)($); #REGh=PEEK #N(23805,4,,1)($)
  $6368 #REGa=#N(69,2,,1)($)
  $636A Set the zero flag if #REGa=#REGh, or the carry flag if #REGa<#REGh
  $636B Return if #REGa=#REGh
  $636C #REGh=#REGh+1
  $636D POKE #N(23804,4,,1)($),#REGl; POKE #N(23805,4,,1)($),#REGh
  $6370 #REGa=#N(1,2,,1)($)
  $6372 POKE #N(25435,4,,1)($),#REGa
  $6375 #REGhl=#N(23836,4,,1)($)
  $6378 Set bit 3 of (#REGhl)
  $637A Return
c $637B
  $637B #REGh=#REGh+1
  $637C POKE #N(23825,4,,1)($),#REGl; POKE #N(23826,4,,1)($),#REGh
  $637F Return
c $6380
  $6380 #REGl=PEEK #N(23825,4,,1)($); #REGh=PEEK #N(23826,4,,1)($)
  $6383 #REGa=PEEK #N(46873,4,,1)($)
  $6386 Set the zero flag if #REGa=#REGh, or the carry flag if #REGa<#REGh
  $6387 Jump to #R25501 if #REGa<>#REGh
  $6389 #REGl=PEEK #N(23804,4,,1)($); #REGh=PEEK #N(23805,4,,1)($)
  $638C #REGa=0
  $638D Set the zero flag if #REGa=#REGh, or the carry flag if #REGa<#REGh
  $638E Return if #REGa=#REGh
  $638F #REGh=#REGh-1
  $6390 POKE #N(23804,4,,1)($),#REGl; POKE #N(23805,4,,1)($),#REGh
  $6393 #REGa=#REGa+1
  $6394 POKE #N(25435,4,,1)($),#REGa
  $6397 #REGhl=#N(23836,4,,1)($)
  $639A Set bit 2 of (#REGhl)
  $639C Return
c $639D
  $639D #REGh=#REGh-1
  $639E Jump to #R25468
c $63A0
  $63A0 #REGl=PEEK #N(23825,4,,1)($); #REGh=PEEK #N(23826,4,,1)($)
  $63A3 #REGa=PEEK #N(46873,4,,1)($)
  $63A6 Set the zero flag if #REGa=#REGl, or the carry flag if #REGa<#REGl
  $63A7 Jump to #R25533 if #REGa<>#REGl
  $63A9 #REGl=PEEK #N(23804,4,,1)($); #REGh=PEEK #N(23805,4,,1)($)
  $63AC #REGa=0
  $63AD Set the zero flag if #REGa=#REGl, or the carry flag if #REGa<#REGl
  $63AE Return if #REGa=#REGl
  $63AF #REGl=#REGl-1
  $63B0 POKE #N(23804,4,,1)($),#REGl; POKE #N(23805,4,,1)($),#REGh
  $63B3 #REGhl=#N(23836,4,,1)($)
  $63B6 Set bit 0 of (#REGhl)
  $63B8 #REGa=#REGa+1
  $63B9 POKE #N(25435,4,,1)($),#REGa
  $63BC Return
c $63BD
  $63BD #REGl=#REGl-1
  $63BE Jump to #R25468
c $63C0
  $63C0 #REGl=PEEK #N(23825,4,,1)($); #REGh=PEEK #N(23826,4,,1)($)
  $63C3 #REGa=PEEK #N(46872,4,,1)($)
  $63C6 Set the zero flag if #REGa=#REGl, or the carry flag if #REGa<#REGl
  $63C7 Jump to #R25567 if #REGa<>#REGl
  $63C9 #REGl=PEEK #N(23804,4,,1)($); #REGh=PEEK #N(23805,4,,1)($)
  $63CC #REGa=#N(39,2,,1)($)
  $63CE Set the zero flag if #REGa=#REGl, or the carry flag if #REGa<#REGl
  $63CF Return if #REGa=#REGl
  $63D0 #REGl=#REGl+1
  $63D1 POKE #N(23804,4,,1)($),#REGl; POKE #N(23805,4,,1)($),#REGh
  $63D4 #REGhl=#N(23836,4,,1)($)
  $63D7 Set bit 1 of (#REGhl)
  $63D9 #REGa=#N(1,2,,1)($)
  $63DB POKE #N(25435,4,,1)($),#REGa
  $63DE Return
c $63DF
  $63DF #REGl=#REGl+1
  $63E0 Jump to #R25468
c $63E2
  $63E2 #REGa=PEEK #N(25435,4,,1)($)
  $63E5 Clear the carry flag and set the zero flag if #REGa=0
  $63E6 Jump to #R25587 if #REGa=0
  $63E8 #REGa=0
  $63E9 POKE #N(25435,4,,1)($),#REGa
  $63EC CALL #R25610
  $63EF CALL #R25654
  $63F2 Return
c $63F3
  $63F3 CALL #R25654
  $63F6 #REGb=#N(80,2,,1)($)
  $63F8 #REGe=PEEK #N(23804,4,,1)($); #REGd=PEEK #N(23805,4,,1)($)
  $63FC #REGl=PEEK #N(23827,4,,1)($); #REGh=PEEK #N(23828,4,,1)($)
  $63FF CALL #R25686
  $6402 #REGb=#N(80,2,,1)($)
  $6404 CALL #R25311
  $6407 Decrement #REGb and jump to #R25604 if #REGb>0
  $6409 Return
c $640A
  $640A #REGa=PEEK #N(23836,4,,1)($)
  $640D #REGa=#REGa-1
  $640E #REGd=#N(0,2,,1)($)
  $6410 #REGe=#REGa
  $6411 #REGhl=#N(25624,4,,1)($)
  $6414 #REGhl=#REGhl+#REGde
  $6415 #REGhl=#REGhl+#REGde
  $6416 #REGhl=#REGhl+#REGde
  $6417 Jump to #REGhl
c $6418
  $6418 Jump to #R25708
c $641B
  $641B Jump to #R24874
c $641E
  $641E Return
s $641F
c $6421
  $6421 Jump to #R25776
c $6424
  $6424 Jump to #R25708
c $6427
  $6427 Jump to #R24874
c $642A
  $642A Return
s $642B
c $642D
  $642D Jump to #R24961
c $6430
  $6430 Jump to #R25708
c $6433
  $6433 Jump to #R24874
c $6436
  $6436 #REGl=PEEK #N(23825,4,,1)($); #REGh=PEEK #N(23826,4,,1)($)
  $6439 #REGhl=#REGhl+#REGhl
  $643A #REGh=#REGh+1
  $643B #REGl=#REGl+1
  $643C POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $643F #REGa=#N(71,2,,1)($)
  $6441 POKE #N(23808,4,,1)($),#REGa
  $6444 #REGa=#N(175,2,,1)($)
  $6446 CALL #R24751
  $6449 Return
c $644A
  $644A #REGa=PEEK #N(46875,4,,1)($)
  $644D Clear the carry flag and set the zero flag if #REGa=0
  $644E Return if #REGa>0
  $644F #REGe=PEEK #N(23804,4,,1)($); #REGd=PEEK #N(23805,4,,1)($)
  $6453 #REGl=PEEK #N(23825,4,,1)($); #REGh=PEEK #N(23826,4,,1)($)
  $6456 POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $6459 #REGhl=#REGhl+#REGde
  $645A Exchange #REGde and #REGhl
  $645B CALL #R24850
  $645E #REGa=PEEK #REGhl
  $645F #REGl=PEEK #N(23806,4,,1)($); #REGh=PEEK #N(23807,4,,1)($)
  $6462 #REGhl=#REGhl+#REGhl
  $6463 #REGh=#REGh+1
  $6464 #REGl=#REGl+1
  $6465 POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $6468 CALL #R24942
  $646B Return
c $646C
  $646C #REGe=PEEK #N(23804,4,,1)($); #REGd=PEEK #N(23805,4,,1)($)
  $6470 #REGa=#N(10,2,,1)($)
  $6472 #REGa=#REGa+#REGe
  $6473 #REGe=#REGa
  $6474 CALL #R24850
  $6477 POKE #N(23810,4,,1)($),#REGl; POKE #N(23811,4,,1)($),#REGh
  $647A #REGb=#N(11,2,,1)($)
  $647C #REGa=#N(21,2,,1)($)
  $647E POKE #N(23806,4,,1)($),#REGa
  $6481 Push #REGbc onto the stack
  $6482 #REGa=#N(1,2,,1)($)
  $6484 POKE #N(23807,4,,1)($),#REGa
  $6487 #REGb=#N(11,2,,1)($)
  $6489 Push #REGbc onto the stack
  $648A #REGl=PEEK #N(23810,4,,1)($); #REGh=PEEK #N(23811,4,,1)($)
  $648D #REGa=PEEK #REGhl
  $648E #REGhl=#REGhl+1
  $648F POKE #N(23810,4,,1)($),#REGl; POKE #N(23811,4,,1)($),#REGh
  $6492 CALL #R24942
  $6495 #REGhl=#N(23807,4,,1)($)
  $6498 POKE #REGhl,(PEEK #REGhl)+1
  $6499 POKE #REGhl,(PEEK #REGhl)+1
  $649A Pop last item from stack into #REGbc
  $649B Decrement #REGb and jump to #R25737 if #REGb>0
  $649D #REGl=PEEK #N(23810,4,,1)($); #REGh=PEEK #N(23811,4,,1)($)
  $64A0 #REGde=#N(65445,4,,1)($)
  $64A3 #REGhl=#REGhl+#REGde
  $64A4 POKE #N(23810,4,,1)($),#REGl; POKE #N(23811,4,,1)($),#REGh
  $64A7 Pop last item from stack into #REGbc
  $64A8 #REGhl=#N(23806,4,,1)($)
  $64AB POKE #REGhl,(PEEK #REGhl)-1
  $64AC POKE #REGhl,(PEEK #REGhl)-1
  $64AD Decrement #REGb and jump to #R25729 if #REGb>0
  $64AF Return
c $64B0
  $64B0 #REGe=PEEK #N(23804,4,,1)($); #REGd=PEEK #N(23805,4,,1)($)
  $64B4 #REGa=#N(10,2,,1)($)
  $64B6 #REGa=#REGa+#REGd
  $64B7 #REGd=#REGa
  $64B8 CALL #R24850
  $64BB POKE #N(23810,4,,1)($),#REGl; POKE #N(23811,4,,1)($),#REGh
  $64BE #REGb=#N(11,2,,1)($)
  $64C0 #REGa=#N(21,2,,1)($)
  $64C2 POKE #N(23807,4,,1)($),#REGa
  $64C5 Push #REGbc onto the stack
  $64C6 #REGa=#N(1,2,,1)($)
  $64C8 POKE #N(23806,4,,1)($),#REGa
  $64CB #REGb=#N(11,2,,1)($)
  $64CD Push #REGbc onto the stack
  $64CE #REGl=PEEK #N(23810,4,,1)($); #REGh=PEEK #N(23811,4,,1)($)
  $64D1 #REGa=PEEK #REGhl
  $64D2 #REGde=#N(80,4,,1)($)
  $64D5 #REGhl=#REGhl+#REGde
  $64D6 POKE #N(23810,4,,1)($),#REGl; POKE #N(23811,4,,1)($),#REGh
  $64D9 CALL #R24942
  $64DC #REGhl=#N(23806,4,,1)($)
  $64DF POKE #REGhl,(PEEK #REGhl)+1
  $64E0 POKE #REGhl,(PEEK #REGhl)+1
  $64E1 Pop last item from stack into #REGbc
  $64E2 Decrement #REGb and jump to #R25805 if #REGb>0
  $64E4 #REGl=PEEK #N(23810,4,,1)($); #REGh=PEEK #N(23811,4,,1)($)
  $64E7 #REGde=#N(64655,4,,1)($)
  $64EA #REGhl=#REGhl+#REGde
  $64EB POKE #N(23810,4,,1)($),#REGl; POKE #N(23811,4,,1)($),#REGh
  $64EE Pop last item from stack into #REGbc
  $64EF #REGhl=#N(23807,4,,1)($)
  $64F2 POKE #REGhl,(PEEK #REGhl)-1
  $64F3 POKE #REGhl,(PEEK #REGhl)-1
  $64F4 Decrement #REGb and jump to #R25797 if #REGb>0
  $64F6 Return
c $64F7
  $64F7 Push #REGhl onto the stack
  $64F8 Push #REGde onto the stack
  $64F9 Push #REGbc onto the stack
  $64FA Push #REGaf onto the stack
  $64FB POKE #N(23812,4,,1)($),#REGa
  $64FE #REGe=PEEK #N(23806,4,,1)($); #REGd=PEEK #N(23807,4,,1)($)
  $6502 #REGa=#REGd
  $6503 #REGd=#N(0,2,,1)($)
  $6505 #REGhl=#N(24642,4,,1)($)
  $6508 #REGhl=#REGhl+#REGde
  $6509 #REGhl=#REGhl+#REGde
  $650A #REGe=PEEK #REGhl
  $650B #REGhl=#REGhl+1
  $650C #REGd=PEEK #REGhl
  $650D #REGhl=#REGhl+1
  $650E #REGc=PEEK #REGhl
  $650F #REGhl=#REGhl+1
  $6510 #REGb=PEEK #REGhl
  $6511 #REGl=#REGa
  $6512 #REGh=#N(0,2,,1)($)
  $6514 #REGhl=#REGhl+#REGbc
  $6515 Push #REGhl onto the stack
  $6516 #REGl=#REGa
  $6517 #REGh=#N(0,2,,1)($)
  $6519 #REGhl=#REGhl+#REGde
  $651A Push #REGhl onto the stack
  $651B #REGde=#N(45369,4,,1)($)
  $651E #REGh=#N(0,2,,1)($)
  $6520 #REGa=PEEK #N(23812,4,,1)($)
  $6523 #REGl=#REGa
  $6524 #REGhl=#REGhl+#REGhl
  $6525 #REGhl=#REGhl+#REGhl
  $6526 #REGhl=#REGhl+#REGhl
  $6527 #REGhl=#REGhl+#REGde
  $6528 Pop last item from stack into #REGde
  $6529 #REGc=#N(2,2,,1)($)
  $652B #REGb=#N(4,2,,1)($)
  $652D #REGa=PEEK #REGhl
  $652E POKE #REGde,#REGa
  $652F #REGd=#REGd+1
  $6530 POKE #REGde,#REGa
  $6531 #REGd=#REGd+1
  $6532 #REGhl=#REGhl+1
  $6533 Decrement #REGb and jump to #R25901 if #REGb>0
  $6535 #REGc=#REGc-1
  $6536 Jump to #R25915 if #REGc=0
  $6538 Pop last item from stack into #REGde
  $6539 Jump to #R25899
c $653B
  $653B Exchange #REGde and #REGhl
  $653C #REGh=#REGh-1
  $653D #REGa=#REGh
  $653E Rotate #REGa right circular (copying bit 0 into bit 7 and into the carry flag)
  $653F Rotate #REGa right circular (copying bit 0 into bit 7 and into the carry flag)
  $6540 Rotate #REGa right circular (copying bit 0 into bit 7 and into the carry flag)
  $6541 Keep only bits 0 and 1 of #REGa
  $6543 Set bits 3, 4 and 6 of #REGa
  $6545 #REGh=#REGa
  $6546 #REGa=PEEK #N(23809,4,,1)($)
  $6549 POKE #REGhl,#REGa
  $654A #REGde=#N(65504,4,,1)($)
  $654D #REGhl=#REGhl+#REGde
  $654E #REGa=PEEK #N(23808,4,,1)($)
  $6551 POKE #REGhl,#REGa
  $6552 Pop last item from stack into #REGaf
  $6553 Pop last item from stack into #REGbc
  $6554 Pop last item from stack into #REGde
  $6555 Pop last item from stack into #REGhl
  $6556 Return
c $6557
  $6557 Push #REGhl onto the stack
  $6558 Push #REGde onto the stack
  $6559 Push #REGbc onto the stack
  $655A #REGb=#REGa
  $655B #REGl=PEEK #N(23839,4,,1)($); #REGh=PEEK #N(23840,4,,1)($)
  $655E #REGhl=#REGhl-1
  $655F #REGhl=#REGhl+1
  $6560 #REGa=PEEK #REGhl
  $6561 Set the zero flag if #REGa=#N(124,2,,1)($), or the carry flag if #REGa<#N(124,2,,1)($)
  $6563 Jump to #R25951 if #REGa<>#N(124,2,,1)($)
  $6565 Decrement #REGb and jump to #R25951 if #REGb>0
  $6567 POKE #N(23818,4,,1)($),#REGl; POKE #N(23819,4,,1)($),#REGh
  $656A #REGl=PEEK #N(23813,4,,1)($); #REGh=PEEK #N(23814,4,,1)($)
  $656D POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $6570 #REGl=PEEK #N(23818,4,,1)($); #REGh=PEEK #N(23819,4,,1)($)
  $6573 #REGhl=#REGhl+1
  $6574 POKE #N(23818,4,,1)($),#REGl; POKE #N(23819,4,,1)($),#REGh
  $6577 #REGa=PEEK #REGhl
  $6578 Set the zero flag if #REGa=#N(124,2,,1)($), or the carry flag if #REGa<#N(124,2,,1)($)
  $657A Jump to #R26016 if #REGa=#N(124,2,,1)($)
  $657C Set the zero flag if #REGa=#N(241,2,,1)($), or the carry flag if #REGa<#N(241,2,,1)($)
  $657E Jump to #R25995 if #REGa<#N(241,2,,1)($)
  $6580 CALL #R26175
  $6583 #REGl=PEEK #N(23841,4,,1)($); #REGh=PEEK #N(23842,4,,1)($)
  $6586 POKE #N(23818,4,,1)($),#REGl; POKE #N(23819,4,,1)($),#REGh
  $6589 Jump to #R25968
c $658B
  $658B Set the zero flag if #REGa=#N(47,2,,1)($), or the carry flag if #REGa<#N(47,2,,1)($)
  $658D Jump to #R26004 if #REGa<>#N(47,2,,1)($)
  $658F CALL #R26135
  $6592 Jump to #R25968
c $6594
  $6594 #REGhl=#N(23817,4,,1)($)
  $6597 Set the zero flag if bit 2 of (#REGhl) is 0
  $6599 Jump to #R26020 if bit 2 of PEEK #REGhl is reset
  $659B CALL #R26087
  $659E Jump to #R25968
c $65A0
  $65A0 Pop last item from stack into #REGbc
  $65A1 Pop last item from stack into #REGde
  $65A2 Pop last item from stack into #REGhl
  $65A3 Return
c $65A4
  $65A4 #REGl=PEEK #N(23815,4,,1)($); #REGh=PEEK #N(23816,4,,1)($)
  $65A7 #REGhl=#REGhl-1
  $65A8 #REGb=#REGa
  $65A9 #REGhl=#REGhl+1
  $65AA #REGa=PEEK #REGhl
  $65AB Set the zero flag if #REGa=#N(124,2,,1)($), or the carry flag if #REGa<#N(124,2,,1)($)
  $65AD Jump to #R26025 if #REGa<>#N(124,2,,1)($)
  $65AF Decrement #REGb and jump to #R26025 if #REGb>0
  $65B1 POKE #N(23820,4,,1)($),#REGl; POKE #N(23821,4,,1)($),#REGh
  $65B4 #REGl=PEEK #N(23820,4,,1)($); #REGh=PEEK #N(23821,4,,1)($)
  $65B7 #REGhl=#REGhl+1
  $65B8 POKE #N(23820,4,,1)($),#REGl; POKE #N(23821,4,,1)($),#REGh
  $65BB #REGa=PEEK #REGhl
  $65BC Set the zero flag if #REGa=#N(124,2,,1)($), or the carry flag if #REGa<#N(124,2,,1)($)
  $65BE Jump to #R26058 if #REGa<>#N(124,2,,1)($)
  $65C0 #REGhl=#N(23817,4,,1)($)
  $65C3 Set the zero flag if bit 1 of (#REGhl) is 0
  $65C5 CALL #R26108 if bit 1 of PEEK #REGhl is reset
  $65C8 Jump to #R25968
c $65CA
  $65CA Set the zero flag if #REGa=#N(128,2,,1)($), or the carry flag if #REGa<#N(128,2,,1)($)
  $65CC Jump to #R26073 if #REGa<#N(128,2,,1)($)
  $65CE CALL #R26175
  $65D1 #REGl=PEEK #N(23841,4,,1)($); #REGh=PEEK #N(23842,4,,1)($)
  $65D4 POKE #N(23820,4,,1)($),#REGl; POKE #N(23821,4,,1)($),#REGh
  $65D7 Jump to #R26036
c $65D9
  $65D9 Set the zero flag if #REGa=#N(47,2,,1)($), or the carry flag if #REGa<#N(47,2,,1)($)
  $65DB Jump to #R26082 if #REGa<>#N(47,2,,1)($)
  $65DD CALL #R26135
  $65E0 Jump to #R26036
c $65E2
  $65E2 CALL #R26087
  $65E5 Jump to #R26036
c $65E7
  $65E7 #REGhl=#N(23817,4,,1)($)
  $65EA Set the zero flag if bit 3 of (#REGhl) is 0
  $65EC Jump to #R26101 if bit 3 of PEEK #REGhl is set
  $65EE CALL #R24690
  $65F1 CALL #R26108
  $65F4 Return
c $65F5
  $65F5 CALL #R25847
  $65F8 CALL #R26108
  $65FB Return
c $65FC
  $65FC #REGhl=#N(23817,4,,1)($)
  $65FF Set the zero flag if bit 4 of (#REGhl) is 0
  $6601 Jump to #R26120 if bit 4 of PEEK #REGhl is set
  $6603 #REGhl=#N(23807,4,,1)($)
  $6606 POKE #REGhl,(PEEK #REGhl)+1
  $6607 Return
c $6608
  $6608 #REGa=PEEK #N(23806,4,,1)($)
  $660B #REGa=#REGa+1
  $660C POKE #N(23806,4,,1)($),#REGa
  $660F Set the zero flag if bit 3 of (#REGhl) is 0
  $6611 Return if bit 3 of PEEK #REGhl is reset
  $6612 #REGa=#REGa+1
  $6613 POKE #N(23806,4,,1)($),#REGa
  $6616 Return
c $6617
  $6617 #REGhl=#N(23817,4,,1)($)
  $661A Set the zero flag if bit 0 of (#REGhl) is 0
  $661C Jump to #R26108 if bit 0 of PEEK #REGhl is set
  $661E Set the zero flag if bit 4 of (#REGhl) is 0
  $6620 Jump to #R26153 if bit 4 of PEEK #REGhl is reset
  $6622 #REGe=PEEK #N(23813,4,,1)($); #REGd=PEEK #N(23814,4,,1)($)
  $6626 #REGd=#REGd+1
  $6627 Jump to #R26166
c $6629
  $6629 #REGe=PEEK #N(23813,4,,1)($); #REGd=PEEK #N(23814,4,,1)($)
  $662D #REGe=#REGe+1
  $662E #REGhl=#N(23817,4,,1)($)
  $6631 Set the zero flag if bit 3 of (#REGhl) is 0
  $6633 Jump to #R26166 if bit 3 of PEEK #REGhl is reset
  $6635 #REGe=#REGe+1
  $6636 POKE #N(23813,4,,1)($),#REGe; POKE #N(23814,4,,1)($),#REGd
  $663A POKE #N(23806,4,,1)($),#REGe; POKE #N(23807,4,,1)($),#REGd
  $663E Return
c $663F
  $663F POKE #N(23841,4,,1)($),#REGl; POKE #N(23842,4,,1)($),#REGh
  $6642 #REGa=#REGa+1
  $6643 Jump to #R26188 if #REGa>0
  $6645 #REGhl=#N(44038,4,,1)($)
  $6648 POKE #N(23815,4,,1)($),#REGl; POKE #N(23816,4,,1)($),#REGh
  $664B Return
c $664C
  $664C #REGa=#REGa+1
  $664D Jump to #R26198 if #REGa>0
  $664F #REGl=PEEK #N(46884,4,,1)($); #REGh=PEEK #N(46885,4,,1)($)
  $6652 POKE #N(23815,4,,1)($),#REGl; POKE #N(23816,4,,1)($),#REGh
  $6655 Return
c $6656
  $6656 #REGa=#REGa+1
  $6657 Jump to #R26208 if #REGa>0
  $6659 #REGhl=#N(44038,4,,1)($)
  $665C POKE #N(23815,4,,1)($),#REGl; POKE #N(23816,4,,1)($),#REGh
  $665F Return
c $6660
  $6660 #REGhl=#N(23817,4,,1)($)
  $6663 #REGa=#REGa+1
  $6664 Jump to #R26217 if #REGa>0
  $6666 Reset bit 2 of (#REGhl)
  $6668 Return
c $6669
  $6669 #REGa=#REGa+1
  $666A Jump to #R26223 if #REGa>0
  $666C Set bit 2 of (#REGhl)
  $666E Return
c $666F
  $666F #REGa=#REGa+1
  $6670 Jump to #R26229 if #REGa>0
  $6672 Set bit 3 of (#REGhl)
  $6674 Return
c $6675
  $6675 #REGa=#REGa+1
  $6676 Jump to #R26235 if #REGa>0
  $6678 Reset bit 3 of (#REGhl)
  $667A Return
c $667B
  $667B #REGa=#REGa+1
  $667C Jump to #R26241 if #REGa>0
  $667E Reset bit 4 of (#REGhl)
  $6680 Return
c $6681
  $6681 #REGa=#REGa+1
  $6682 Jump to #R26247 if #REGa>0
  $6684 Set bit 4 of (#REGhl)
  $6686 Return
c $6687
  $6687 #REGa=#REGa+1
  $6688 Jump to #R26276 if #REGa>0
  $668A #REGl=PEEK #N(23841,4,,1)($); #REGh=PEEK #N(23842,4,,1)($)
  $668D #REGhl=#REGhl+1
  $668E POKE #N(23841,4,,1)($),#REGl; POKE #N(23842,4,,1)($),#REGh
  $6691 #REGa=PEEK #REGhl
  $6692 POKE #N(23808,4,,1)($),#REGa
  $6695 #REGa=PEEK #N(23817,4,,1)($)
  $6698 Set the zero flag if bit 3 of #REGa is 0
  $669A Return if bit 3 of #REGa is reset
  $669B #REGhl=#REGhl+1
  $669C POKE #N(23841,4,,1)($),#REGl; POKE #N(23842,4,,1)($),#REGh
  $669F #REGa=PEEK #REGhl
  $66A0 POKE #N(23809,4,,1)($),#REGa
  $66A3 Return
c $66A4
  $66A4 #REGa=#REGa+1
  $66A5 Jump to #R26298 if #REGa>0
  $66A7 #REGl=PEEK #N(23841,4,,1)($); #REGh=PEEK #N(23842,4,,1)($)
  $66AA #REGhl=#REGhl+1
  $66AB #REGc=PEEK #REGhl
  $66AC #REGhl=#REGhl+1
  $66AD #REGb=PEEK #REGhl
  $66AE POKE #N(23841,4,,1)($),#REGl; POKE #N(23842,4,,1)($),#REGh
  $66B1 POKE #N(23813,4,,1)($),#REGc; POKE #N(23814,4,,1)($),#REGb
  $66B5 POKE #N(23806,4,,1)($),#REGc; POKE #N(23807,4,,1)($),#REGb
  $66B9 Return
c $66BA
  $66BA #REGa=#REGa+1
  $66BB Jump to #R26304 if #REGa>0
  $66BD Reset bit 1 of (#REGhl)
  $66BF Return
c $66C0
  $66C0 #REGa=#REGa+1
  $66C1 Jump to #R26310 if #REGa>0
  $66C3 Set bit 1 of (#REGhl)
  $66C5 Return
c $66C6
  $66C6 #REGa=#REGa+1
  $66C7 Jump to #R26316 if #REGa>0
  $66C9 Reset bit 0 of (#REGhl)
  $66CB Return
c $66CC
  $66CC #REGa=#REGa+1
  $66CD Return if #REGa>0
  $66CE Set bit 0 of (#REGhl)
  $66D0 Return
c $66D1
  $66D1 #REGhl=#N(23803,4,,1)($)
  $66D4 #REGde=#N(23850,4,,1)($)
  $66D7 #REGa=PEEK #REGde
  $66D8 #REGa=#REGa+1
  $66D9 Jump to #R26333 if #REGa>0
  $66DB POKE #REGhl,#REGa
  $66DC Return
c $66DD
  $66DD #REGa=PEEK #REGhl
  $66DE Clear the carry flag and set the zero flag if #REGa=0
  $66DF #REGb=#N(40,2,,1)($)
  $66E1 #REGa=#N(1,2,,1)($)
  $66E3 POKE #REGhl,#REGa
  $66E4 Jump to #R26344 if the zero flag is not set
  $66E6 #REGb=#N(110,2,,1)($)
  $66E8 #REGa=PEEK #N(23850,4,,1)($)
  $66EB #REGa=#REGa+1
  $66EC Return if #REGa=0
  $66ED Push #REGbc onto the stack
  $66EE CALL #R25306
  $66F1 CALL #R45256
  $66F4 Pop last item from stack into #REGbc
  $66F5 Decrement #REGb and jump to #R26344 if #REGb>0
  $66F7 Return
c $66F8
  $66F8 Set the zero flag if #REGa=#N(10,2,,1)($), or the carry flag if #REGa<#N(10,2,,1)($)
  $66FA Jump to #R26378 if #REGa>=#N(10,2,,1)($)
  $66FC CALL #R26434
  $66FF #REGa=#N(32,2,,1)($)
  $6701 CALL #R26436
  $6704 #REGa=#N(32,2,,1)($)
  $6706 CALL #R26444
  $6709 Return
c $670A
  $670A Set the zero flag if #REGa=#N(100,2,,1)($), or the carry flag if #REGa<#N(100,2,,1)($)
  $670C Jump to #R26391 if #REGa>=#N(100,2,,1)($)
  $670E CALL #R26411
  $6711 #REGhl=#N(23807,4,,1)($)
  $6714 POKE #REGhl,(PEEK #REGhl)+1
  $6715 Jump to #R26372
c $6717
  $6717 Set the zero flag if #REGa=#N(200,2,,1)($), or the carry flag if #REGa<#N(200,2,,1)($)
  $6719 Jump to #R26402 if #REGa<#N(200,2,,1)($)
  $671B #REGa=#REGa-#N(200,2,,1)($)
  $671D #REGc=#REGa
  $671E #REGa=#N(50,2,,1)($)
  $6720 Jump to #R26407
c $6722
  $6722 #REGa=#REGa-#N(100,2,,1)($)
  $6724 #REGc=#REGa
  $6725 #REGa=#N(49,2,,1)($)
  $6727 CALL #R26436
  $672A #REGa=#REGc
  $672B #REGb=#N(0,2,,1)($)
  $672D Set the zero flag if #REGa=#N(10,2,,1)($), or the carry flag if #REGa<#N(10,2,,1)($)
  $672F Jump to #R26422 if #REGa<#N(10,2,,1)($)
  $6731 #REGa=#REGa-#N(10,2,,1)($)
  $6733 #REGb=#REGb+1
  $6734 Jump to #R26413
c $6736
  $6736 #REGc=#REGa
  $6737 #REGa=#REGb
  $6738 CALL #R26434
  $673B #REGa=#REGc
  $673C #REGa=#REGa+#N(48,2,,1)($)
  $673E CALL #R26444
  $6741 Return
c $6742
  $6742 #REGa=#REGa+#N(48,2,,1)($)
  $6744 CALL #R26444
  $6747 #REGhl=#N(23807,4,,1)($)
  $674A POKE #REGhl,(PEEK #REGhl)+1
  $674B Return
c $674C
  $674C Push #REGhl onto the stack
  $674D #REGhl=#N(23817,4,,1)($)
  $6750 Set the zero flag if bit 3 of (#REGhl) is 0
  $6752 Jump to #R26457 if bit 3 of PEEK #REGhl is reset
  $6754 CALL #R25847
  $6757 Pop last item from stack into #REGhl
  $6758 Return
c $6759
  $6759 CALL #R24690
  $675C Pop last item from stack into #REGhl
  $675D Return
c $675E
  $675E Push #REGhl onto the stack
  $675F #REGhl=#N(23817,4,,1)($)
  $6762 POKE #REGhl,#N(8,2,,1)($)
  $6764 #REGhl=#N(17926,4,,1)($)
  $6767 POKE #N(23808,4,,1)($),#REGl; POKE #N(23809,4,,1)($),#REGh
  $676A Jump to #R26484
c $676C
  $676C Push #REGhl onto the stack
  $676D #REGhl=#N(23817,4,,1)($)
  $6770 POKE #REGhl,#N(0,2,,1)($)
  $6772 Jump to #R26484
c $6774
  $6774 #REGhl=#N(44038,4,,1)($)
  $6777 POKE #N(23815,4,,1)($),#REGl; POKE #N(23816,4,,1)($),#REGh
  $677A #REGhl=#N(42574,4,,1)($)
  $677D POKE #N(23839,4,,1)($),#REGl; POKE #N(23840,4,,1)($),#REGh
  $6780 CALL #R25943
  $6783 Pop last item from stack into #REGhl
  $6784 Return
c $6785
  $6785 #REGl=PEEK #N(46866,4,,1)($); #REGh=PEEK #N(46867,4,,1)($)
  $6788 #REGh=#N(0,2,,1)($)
  $678A #REGde=#N(46850,4,,1)($)
  $678D #REGhl=#REGhl+#REGde
  $678E #REGa=PEEK #REGhl
  $678F POKE #N(23808,4,,1)($),#REGa
  $6792 #REGa=#N(1,2,,1)($)
  $6794 CALL #R26476
  $6797 #REGa=#N(2,2,,1)($)
  $6799 CALL #R26476
  $679C #REGa=#N(114,2,,1)($)
  $679E POKE #N(23808,4,,1)($),#REGa
  $67A1 #REGhl=#N(2583,4,,1)($)
  $67A4 POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $67A7 #REGa=PEEK #N(46865,4,,1)($)
  $67AA CALL #R26360
  $67AD #REGhl=#N(4119,4,,1)($)
  $67B0 POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $67B3 #REGa=PEEK #N(46866,4,,1)($)
  $67B6 #REGd=#N(0,2,,1)($)
  $67B8 #REGe=#REGa
  $67B9 #REGhl=#N(46863,4,,1)($)
  $67BC #REGhl=#REGhl+#REGde
  $67BD #REGa=PEEK #REGhl
  $67BE CALL #R26360
  $67C1 Return
b $67C2
t $67C6
b $67CC
c $67D7
  $67D7 #REGix=#N(54175,4,,1)($)
  $67DB Exchange #REGde and #REGhl
  $67DC #REGix=#REGix+#REGde
  $67DE Return
c $67DF
  $67DF #REGa=#REGa-#N(110,2,,1)($)
  $67E1 #REGh=#N(0,2,,1)($)
  $67E3 #REGl=#REGa
  $67E4 #REGhl=#REGhl+#REGhl
  $67E5 #REGhl=#REGhl+#REGhl
  $67E6 #REGhl=#REGhl+#REGhl
  $67E7 #REGhl=#REGhl+#REGhl
  $67E8 #REGd=#N(0,2,,1)($)
  $67EA #REGe=#REGa
  $67EB #REGhl=#REGhl+#REGde
  $67EC #REGhl=#REGhl+#REGde
  $67ED #REGhl=#REGhl+#REGde
  $67EE #REGhl=#REGhl+#REGde
  $67EF Exchange #REGde and #REGhl
  $67F0 #REGixl=PEEK #N(46888,4,,1)($); #REGixh=PEEK #N(46889,4,,1)($)
  $67F4 #REGix=#REGix+#REGde
  $67F6 Return
c $67F7
  $67F7 #REGh=#N(0,2,,1)($)
  $67F9 #REGl=#REGa
  $67FA #REGhl=#REGhl+#REGhl
  $67FB #REGhl=#REGhl+#REGhl
  $67FC #REGhl=#REGhl+#REGhl
  $67FD #REGd=#N(0,2,,1)($)
  $67FF #REGe=#REGa
  $6800 #REGhl=#REGhl+#REGde
  $6801 #REGhl=#REGhl+#REGde
  $6802 #REGhl=#REGhl+#REGde
  $6803 #REGhl=#REGhl+#REGde
  $6804 #REGiyl=PEEK #N(46886,4,,1)($); #REGiyh=PEEK #N(46887,4,,1)($)
  $6808 Exchange #REGde and #REGhl
  $6809 #REGiy=#REGiy+#REGde
  $680B Return
c $680C
  $680C #REGe=PEEK #N(23825,4,,1)($); #REGd=PEEK #N(23826,4,,1)($)
  $6810 #REGl=PEEK #N(23804,4,,1)($); #REGh=PEEK #N(23805,4,,1)($)
  $6813 #REGhl=#REGhl+#REGde
  $6814 POKE #N(23844,4,,1)($),#REGl; POKE #N(23845,4,,1)($),#REGh
  $6817 Return
c $6818
  $6818 #REGe=PEEK #N(23825,4,,1)($); #REGd=PEEK #N(23826,4,,1)($)
  $681C #REGl=PEEK #N(23804,4,,1)($); #REGh=PEEK #N(23805,4,,1)($)
  $681F #REGhl=#REGhl+#REGde
  $6820 Exchange #REGde and #REGhl
  $6821 CALL #R24850
  $6824 #REGa=PEEK #REGhl
  $6825 POKE #N(23802,4,,1)($),#REGa
  $6828 Set the zero flag if #REGa=#N(140,2,,1)($), or the carry flag if #REGa<#N(140,2,,1)($)
  $682A Jump to #R26679 if #REGa>=#N(140,2,,1)($)
  $682C Set the zero flag if #REGa=#N(110,2,,1)($), or the carry flag if #REGa<#N(110,2,,1)($)
  $682E Jump to #R26738 if #REGa>=#N(110,2,,1)($)
  $6830 #REGhl=#N(6148,4,,1)($)
  $6833 CALL #R26784
  $6836 Return
c $6837
  $6837 #REGhl=#N(6158,4,,1)($)
  $683A CALL #R26784
  $683D #REGa=PEEK #N(23802,4,,1)($)
  $6840 CALL #R26562
  $6843 #REGa=PEEK (#REGix+#N(23,2,,1)($))
  $6846 Clear the carry flag and set the zero flag if #REGa=0
  $6847 Jump to #R26709 if #REGa=0
  $6849 CALL #R26763
  $684C #REGa=PEEK (#REGiy+#N(0,2,,1)($))
  $684F #REGhl=#N(6164,4,,1)($)
  $6852 CALL #R26784
  $6855 #REGa=PEEK (#REGix+#N(22,2,,1)($))
  $6858 Set the zero flag if #REGa=#N(110,2,,1)($), or the carry flag if #REGa<#N(110,2,,1)($)
  $685A Jump to #R26731 if #REGa<#N(110,2,,1)($)
  $685C #REGhl=#N(6153,4,,1)($)
  $685F CALL #R26784
  $6862 CALL #R26636
  $6865 CALL #R32159
  $6868 #REGa=PEEK #N(23843,4,,1)($)
  $686B #REGhl=#N(6148,4,,1)($)
  $686E CALL #R26784
  $6871 Return
c $6872
  $6872 CALL #R26636
  $6875 CALL #R32159
  $6878 #REGa=PEEK #N(23843,4,,1)($)
  $687B #REGhl=#N(6148,4,,1)($)
  $687E CALL #R26784
  $6881 #REGa=PEEK #N(23802,4,,1)($)
  $6884 #REGhl=#N(6153,4,,1)($)
  $6887 CALL #R26784
  $688A Return
c $688B
  $688B Clear the carry flag and set the zero flag if #REGa=0
  $688C Return if #REGa=0
  $688D #REGa=#REGa-1
  $688E #REGl=#REGa
  $688F #REGh=#N(0,2,,1)($)
  $6891 #REGhl=#REGhl+#REGhl
  $6892 #REGhl=#REGhl+#REGhl
  $6893 #REGd=#N(0,2,,1)($)
  $6895 #REGe=#REGa
  $6896 #REGhl=#REGhl+#REGde
  $6897 #REGhl=#REGhl+#REGde
  $6898 Exchange #REGde and #REGhl
  $6899 #REGiyl=PEEK #N(46890,4,,1)($); #REGiyh=PEEK #N(46891,4,,1)($)
  $689D #REGiy=#REGiy+#REGde
  $689F Return
c $68A0
  $68A0 POKE #N(23813,4,,1)($),#REGl; POKE #N(23814,4,,1)($),#REGh
  $68A3 #REGhl=#N(23817,4,,1)($)
  $68A6 POKE #REGhl,#N(8,2,,1)($)
  $68A8 #REGe=PEEK #N(46884,4,,1)($); #REGd=PEEK #N(46885,4,,1)($)
  $68AC POKE #N(23815,4,,1)($),#REGe; POKE #N(23816,4,,1)($),#REGd
  $68B0 #REGe=PEEK #N(46882,4,,1)($); #REGd=PEEK #N(46883,4,,1)($)
  $68B4 POKE #N(23839,4,,1)($),#REGe; POKE #N(23840,4,,1)($),#REGd
  $68B8 #REGde=#N(17926,4,,1)($)
  $68BB POKE #N(23808,4,,1)($),#REGe; POKE #N(23809,4,,1)($),#REGd
  $68BF #REGa=#REGa+1
  $68C0 CALL #R25943
  $68C3 Return
c $68C4
  $68C4 #REGa=0
  $68C5 POKE #N(23851,4,,1)($),#REGa
  $68C8 CALL #R26904
  $68CB CALL #R45256
  $68CE #REGhl=#N(23851,4,,1)($)
  $68D1 #REGa=PEEK #N(23850,4,,1)($)
  $68D4 Rotate #REGa right circular (copying bit 0 into bit 7 and into the carry flag)
  $68D5 Jump to #R26883 if the carry flag is not set
  $68D7 Rotate #REGa right circular (copying bit 0 into bit 7 and into the carry flag)
  $68D8 Jump to #R26858 if the carry flag is set
  $68DA CALL #R26904
  $68DD #REGa=PEEK #REGhl
  $68DE #REGa=#REGa-#N(1,2,,1)($)
  $68E0 POKE #REGhl,#REGa
  $68E1 Jump to #R26875 if the carry flag is not set
  $68E3 #REGa=PEEK #N(23852,4,,1)($)
  $68E6 #REGa=#REGa-1
  $68E7 POKE #REGhl,#REGa
  $68E8 Jump to #R26875
c $68EA
  $68EA Rotate #REGa right circular (copying bit 0 into bit 7 and into the carry flag)
  $68EB Jump to #R26878 if the carry flag is set
  $68ED CALL #R26904
  $68F0 #REGa=PEEK #N(23852,4,,1)($)
  $68F3 #REGb=#REGa
  $68F4 POKE #REGhl,(PEEK #REGhl)+1
  $68F5 #REGa=PEEK #REGhl
  $68F6 Set the zero flag if #REGa=#REGb, or the carry flag if #REGa<#REGb
  $68F7 Jump to #R26875 if #REGa<#REGb
  $68F9 POKE #REGhl,#N(0,2,,1)($)
  $68FB CALL #R26904
  $68FE CALL #R26321
  $6901 Jump to #R26827
c $6903
  $6903 #REGb=#N(4,2,,1)($)
  $6905 Push #REGbc onto the stack
  $6906 CALL #R26904
  $6909 #REGa=#N(5,2,,1)($)
  $690B CALL #R46526
  $690E CALL #R26904
  $6911 CALL #R46549
  $6914 Pop last item from stack into #REGbc
  $6915 Decrement #REGb and jump to #R26885 if #REGb>0
  $6917 Return
c $6918
  $6918 Push #REGhl onto the stack
  $6919 #REGl=PEEK #N(23853,4,,1)($); #REGh=PEEK #N(23854,4,,1)($)
  $691C #REGde=#N(64,4,,1)($)
  $691F #REGa=PEEK #N(23851,4,,1)($)
  $6922 #REGb=#REGa
  $6923 #REGb=#REGb+1
  $6924 #REGhl=#REGhl+#REGde
  $6925 Decrement #REGb and jump to #R26916 if #REGb>0
  $6927 #REGb=#N(2,2,,1)($)
  $6929 Push #REGbc onto the stack
  $692A #REGb=#N(8,2,,1)($)
  $692C #REGa=PEEK #REGhl
  $692D #REGc=#N(0,2,,1)($)
  $692F Rotate #REGa right circular (copying bit 0 into bit 7 and into the carry flag)
  $6930 Rotate #REGc right through the carry flag
  $6932 Rotate #REGa right circular (copying bit 0 into bit 7 and into the carry flag)
  $6933 Rotate #REGc right through the carry flag
  $6935 Rotate #REGa right circular (copying bit 0 into bit 7 and into the carry flag)
  $6936 Rotate #REGc right through the carry flag
  $6938 Shift #REGc right (copying bit 0 into the carry flag, and resetting bit 7)
  $693A Shift #REGc right (copying bit 0 into the carry flag, and resetting bit 7)
  $693C Keep only bits 0, 1 and 2 of #REGa
  $693E #REGa=#REGa|#REGc
  $693F Set bit 6 of #REGa
  $6941 POKE #REGhl,#REGa
  $6942 #REGhl=#REGhl+1
  $6943 Decrement #REGb and jump to #R26924 if #REGb>0
  $6945 Pop last item from stack into #REGbc
  $6946 #REGde=#N(24,4,,1)($)
  $6949 #REGhl=#REGhl+#REGde
  $694A Decrement #REGb and jump to #R26921 if #REGb>0
  $694C Pop last item from stack into #REGhl
  $694D Return
c $694E
  $694E CALL #R26501
  $6951 CALL #R24874
  $6954 #REGa=#N(3,2,,1)($)
  $6956 CALL #R26462
  $6959 #REGa=#N(4,2,,1)($)
  $695B CALL #R26476
  $695E CALL #R26648
  $6961 CALL #R25027
  $6964 #REGa=PEEK #N(23850,4,,1)($)
  $6967 Set the zero flag if bit 0 of #REGa is 0
  $6969 Jump to #R26977 if bit 0 of #REGa is set
  $696B CALL #R27118
  $696E CALL #R26636
  $6971 #REGe=PEEK #N(23844,4,,1)($); #REGd=PEEK #N(23845,4,,1)($)
  $6975 CALL #R24850
  $6978 POKE #N(23855,4,,1)($),#REGl; POKE #N(23856,4,,1)($),#REGh
  $697B #REGa=PEEK #REGhl
  $697C Set the zero flag if #REGa=#N(140,2,,1)($), or the carry flag if #REGa<#N(140,2,,1)($)
  $697E Jump to #R27032 if #REGa<#N(140,2,,1)($)
  $6980 CALL #R27091
  $6983 Jump to #R27022 if the zero flag is not set
  $6985 #REGa=0
  $6986 CALL #R27152
  $6989 #REGa=#N(7,2,,1)($)
  $698B CALL #R26462
  $698E #REGa=#N(1,2,,1)($)
  $6990 CALL #R27152
  $6993 #REGa=#N(8,2,,1)($)
  $6995 CALL #R26462
  $6998 #REGa=#N(9,2,,1)($)
  $699A CALL #R26462
  $699D #REGa=#N(2,2,,1)($)
  $699F CALL #R27152
  $69A2 #REGa=#REGa+1
  $69A3 CALL #R27152
  $69A6 #REGa=#REGa+1
  $69A7 CALL #R27152
  $69AA #REGa=#REGa+1
  $69AB CALL #R27152
  $69AE CALL #R27245
  $69B1 CALL #R26820
  $69B4 #REGhl=#N(27189,4,,1)($)
  $69B7 CALL #R27167
  $69BA CALL #R27085
  $69BD #REGa=#N(4,2,,1)($)
  $69BF CALL #R26476
  $69C2 CALL #R26648
  $69C5 CALL #R25674
  $69C8 CALL #R27245
  $69CB Jump to #R26977
c $69CD
  $69CD #REGa=#N(5,2,,1)($)
  $69CF CALL #R26462
  $69D2 Return
c $69D3
  $69D3 CALL #R26562
  $69D6 POKE #N(23859,4,,1)($),#REGixl; POKE #N(23860,4,,1)($),#REGixh
  $69DA #REGa=PEEK (#REGix+#N(37,2,,1)($))
  $69DD Keep only bit 0 of #REGa
  $69DF #REGhl=#N(46866,4,,1)($)
  $69E2 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $69E3 Return if #REGa<>PEEK #REGhl
  $69E4 #REGa=PEEK (#REGix+#N(6,2,,1)($))
  $69E7 Clear the carry flag and set the zero flag if #REGa=0
  $69E8 Jump to #R27116 if #REGa=0
  $69EA #REGa=0
  $69EB Return
c $69EC
  $69EC #REGa=#REGa+1
  $69ED Return
c $69EE
  $69EE CALL #R25674
  $69F1 CALL #R27085
  $69F4 #REGhl=#N(22616,4,,1)($)
  $69F7 POKE #N(23853,4,,1)($),#REGl; POKE #N(23854,4,,1)($),#REGh
  $69FA #REGa=#N(6,2,,1)($)
  $69FC CALL #R26476
  $69FF #REGa=0
  $6A00 POKE #N(23852,4,,1)($),#REGa
  $6A03 #REGhl=#N(23296,4,,1)($)
  $6A06 POKE #N(23857,4,,1)($),#REGl; POKE #N(23858,4,,1)($),#REGh
  $6A09 #REGhl=#N(6148,4,,1)($)
  $6A0C POKE #N(23813,4,,1)($),#REGl; POKE #N(23814,4,,1)($),#REGh
  $6A0F Return
c $6A10
  $6A10 Push #REGaf onto the stack
  $6A11 #REGl=PEEK #N(23857,4,,1)($); #REGh=PEEK #N(23858,4,,1)($)
  $6A14 POKE #REGhl,#REGa
  $6A15 #REGhl=#REGhl+1
  $6A16 POKE #N(23857,4,,1)($),#REGl; POKE #N(23858,4,,1)($),#REGh
  $6A19 #REGhl=#N(23852,4,,1)($)
  $6A1C POKE #REGhl,(PEEK #REGhl)+1
  $6A1D Pop last item from stack into #REGaf
  $6A1E Return
c $6A1F
  $6A1F Push #REGhl onto the stack
  $6A20 #REGhl=#N(23296,4,,1)($)
  $6A23 #REGd=#N(0,2,,1)($)
  $6A25 #REGa=PEEK #N(23851,4,,1)($)
  $6A28 #REGe=#REGa
  $6A29 #REGhl=#REGhl+#REGde
  $6A2A #REGe=PEEK #REGhl
  $6A2B #REGd=#N(0,2,,1)($)
  $6A2D Pop last item from stack into #REGhl
  $6A2E #REGhl=#REGhl+#REGde
  $6A2F #REGhl=#REGhl+#REGde
  $6A30 #REGe=PEEK #REGhl
  $6A31 #REGhl=#REGhl+1
  $6A32 #REGd=PEEK #REGhl
  $6A33 Exchange #REGde and #REGhl
  $6A34 Jump to #REGhl
b $6A35
t $6A3D
c $6A41
  $6A41 CALL #R27085
  $6A44 #REGa=#N(3,2,,1)($)
  $6A46 CALL #R26462
  $6A49 CALL #R27118
  $6A4C #REGa=#N(82,2,,1)($)
  $6A4E CALL #R26462
  $6A51 #REGa=0
  $6A52 CALL #R27152
  $6A55 #REGa=#REGa+1
  $6A56 CALL #R27152
  $6A59 CALL #R27245
  $6A5C CALL #R26820
  $6A5F #REGhl=#N(27238,4,,1)($)
  $6A62 CALL #R27167
  $6A65 Return
t $6A66
c $6A6A
  $6A6A Pop last item from stack into #REGhl
  $6A6B Pop last item from stack into #REGhl
  $6A6C Return
c $6A6D
  $6A6D Push #REGaf onto the stack
  $6A6E #REGa=PEEK #N(24055,4,,1)($)
  $6A71 Clear the carry flag and set the zero flag if #REGa=0
  $6A72 Jump to #R27273 if #REGa>0
  $6A74 CALL #R654
  $6A77 #REGhl=#N(23964,4,,1)($)
  $6A7A POKE #REGhl,(PEEK #REGhl)+1
  $6A7B #REGa=#REGe
  $6A7C Set the zero flag if #REGa=#N(255,2,,1)($), or the carry flag if #REGa<#N(255,2,,1)($)
  $6A7E Jump to #R27252 if #REGa<>#N(255,2,,1)($)
  $6A80 CALL #R45256
  $6A83 #REGa=PEEK #N(23850,4,,1)($)
  $6A86 #REGa=#REGa+1
  $6A87 Jump to #R27252 if #REGa>0
  $6A89 Pop last item from stack into #REGaf
  $6A8A Return
c $6A8B
  $6A8B #REGixl=PEEK #N(23859,4,,1)($); #REGixh=PEEK #N(23860,4,,1)($)
  $6A8F #REGa=PEEK (#REGix+#N(8,2,,1)($))
  $6A92 Clear the carry flag and set the zero flag if #REGa=0
  $6A93 Return if #REGa=0
  $6A94 CALL #R27085
  $6A97 #REGhl=#N(6144,4,,1)($)
  $6A9A #REGa=PEEK #N(23846,4,,1)($)
  $6A9D CALL #R26784
  $6AA0 #REGa=#N(10,2,,1)($)
  $6AA2 CALL #R26462
  $6AA5 #REGa=#N(70,2,,1)($)
  $6AA7 POKE #N(23808,4,,1)($),#REGa
  $6AAA #REGhl=#N(7437,4,,1)($)
  $6AAD POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $6AB0 CALL #R27433
  $6AB3 CALL #R26360
  $6AB6 #REGhl=#N(7438,4,,1)($)
  $6AB9 POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $6ABC #REGa=PEEK (#REGix+#N(25,2,,1)($))
  $6ABF CALL #R26360
  $6AC2 #REGhl=#N(6154,4,,1)($)
  $6AC5 POKE #N(23813,4,,1)($),#REGl; POKE #N(23814,4,,1)($),#REGh
  $6AC8 #REGa=PEEK (#REGix+#N(12,2,,1)($))
  $6ACB Rotate #REGa left circular (copying bit 7 into bit 0 and into the carry flag)
  $6ACC Rotate #REGa left circular (copying bit 7 into bit 0 and into the carry flag)
  $6ACD Rotate #REGa left circular (copying bit 7 into bit 0 and into the carry flag)
  $6ACE Keep only bits 0, 1 and 2 of #REGa
  $6AD0 #REGa=#REGa+#N(46,2,,1)($)
  $6AD2 CALL #R26476
  $6AD5 #REGhl=#N(6156,4,,1)($)
  $6AD8 POKE #N(23813,4,,1)($),#REGl; POKE #N(23814,4,,1)($),#REGh
  $6ADB #REGa=#N(70,2,,1)($)
  $6ADD POKE #N(23808,4,,1)($),#REGa
  $6AE0 #REGa=PEEK (#REGix+#N(10,2,,1)($))
  $6AE3 Rotate #REGa left circular (copying bit 7 into bit 0 and into the carry flag)
  $6AE4 Rotate #REGa left circular (copying bit 7 into bit 0 and into the carry flag)
  $6AE5 Rotate #REGa left circular (copying bit 7 into bit 0 and into the carry flag)
  $6AE6 Keep only bits 0, 1 and 2 of #REGa
  $6AE8 #REGa=#REGa+#N(54,2,,1)($)
  $6AEA CALL #R26476
  $6AED #REGhl=#N(6152,4,,1)($)
  $6AF0 POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $6AF3 #REGa=#N(5,2,,1)($)
  $6AF5 POKE #N(23808,4,,1)($),#REGa
  $6AF8 #REGa=0
  $6AF9 POKE #N(23817,4,,1)($),#REGa
  $6AFC #REGa=PEEK (#REGix+#N(5,2,,1)($))
  $6AFF Shift #REGa right (copying bit 0 into the carry flag, and resetting bit 7)
  $6B01 CALL #R26360
  $6B04 CALL #R27580
  $6B07 Return
c $6B08
  $6B08 #REGhl=#N(23964,4,,1)($)
  $6B0B POKE #REGhl,(PEEK #REGhl)+1
  $6B0C #REGa=0
  $6B0D #REGa=IN (#N(256,,,1)($)*#REGa+#N(254,2,,1)($))
  $6B0F Set bits 5, 6 and 7 of #REGa
  $6B11 #REGa=#REGa+1
  $6B12 Jump to #R27400 if #REGa=0
  $6B14 #REGa=0
  $6B15 CALL #R46526
  $6B18 Return
c $6B19
  $6B19 #REGc=#N(0,2,,1)($)
  $6B1B Set the zero flag if #REGa=#REGb, or the carry flag if #REGa<#REGb
  $6B1C Jump to #R27426 if #REGa<#REGb
  $6B1E #REGa=#REGa-#REGb
  $6B1F #REGc=#REGc+1
  $6B20 Jump to #R27419
c $6B22
  $6B22 #REGb=#REGb+1
  $6B23 Shift #REGb right (copying bit 0 into the carry flag, and resetting bit 7)
  $6B25 Set the zero flag if #REGa=#REGb, or the carry flag if #REGa<#REGb
  $6B26 Return if #REGa<#REGb
  $6B27 #REGc=#REGc+1
  $6B28 Return
c $6B29
  $6B29 #REGa=PEEK (#REGix+#N(7,2,,1)($))
  $6B2C #REGa=#REGa-PEEK (#REGix+#N(8,2,,1)($))
  $6B2F #REGb=PEEK (#REGix+#N(24,2,,1)($))
  $6B32 CALL #R27417
  $6B35 #REGa=#REGc
  $6B36 Return
c $6B37
  $6B37 #REGa=#N(11,2,,1)($)
  $6B39 CALL #R26476
  $6B3C #REGa=#N(4,2,,1)($)
  $6B3E POKE #N(23817,4,,1)($),#REGa
  $6B41 #REGa=PEEK (#REGix+#N(33,2,,1)($))
  $6B44 #REGa=#REGa+#N(12,2,,1)($)
  $6B46 CALL #R25943
  $6B49 Return
c $6B4A
  $6B4A #REGe=PEEK #N(23866,4,,1)($); #REGd=PEEK #N(23867,4,,1)($)
  $6B4E CALL #R24850
  $6B51 #REGa=PEEK #REGhl
  $6B52 Set the zero flag if #REGa=#N(140,2,,1)($), or the carry flag if #REGa<#N(140,2,,1)($)
  $6B54 Jump to #R27496 if #REGa<#N(140,2,,1)($)
  $6B56 Push #REGix onto the stack
  $6B58 CALL #R26562
  $6B5B #REGa=PEEK (#REGix+#N(22,2,,1)($))
  $6B5E Pop last item from stack into #REGix
  $6B60 Set the zero flag if #REGa=#N(110,2,,1)($), or the carry flag if #REGa<#N(110,2,,1)($)
  $6B62 Jump to #R27504 if #REGa>=#N(110,2,,1)($)
  $6B64 POKE #N(23843,4,,1)($),#REGa
  $6B67 Return
c $6B68
  $6B68 Set the zero flag if #REGa=#N(110,2,,1)($), or the carry flag if #REGa<#N(110,2,,1)($)
  $6B6A Jump to #R27504 if #REGa>=#N(110,2,,1)($)
  $6B6C POKE #N(23843,4,,1)($),#REGa
  $6B6F Return
c $6B70
  $6B70 #REGl=PEEK #N(23866,4,,1)($); #REGh=PEEK #N(23867,4,,1)($)
  $6B73 CALL #R32159
  $6B76 #REGa=PEEK #N(23843,4,,1)($)
  $6B79 Return
c $6B7A
  $6B7A POKE #N(23813,4,,1)($),#REGl; POKE #N(23814,4,,1)($),#REGh
  $6B7D #REGl=PEEK #N(46884,4,,1)($); #REGh=PEEK #N(46885,4,,1)($)
  $6B80 POKE #N(23815,4,,1)($),#REGl; POKE #N(23816,4,,1)($),#REGh
  $6B83 #REGl=PEEK #N(46882,4,,1)($); #REGh=PEEK #N(46883,4,,1)($)
  $6B86 POKE #N(23839,4,,1)($),#REGl; POKE #N(23840,4,,1)($),#REGh
  $6B89 #REGhl=#N(23817,4,,1)($)
  $6B8C POKE #REGhl,#N(8,2,,1)($)
  $6B8E #REGa=#REGa+1
  $6B8F CALL #R25943
  $6B92 Return
c $6B93
  $6B93 Push #REGhl onto the stack
  $6B94 Push #REGaf onto the stack
  $6B95 #REGa=0
  $6B96 POKE #N(23817,4,,1)($),#REGa
  $6B99 POKE #N(23813,4,,1)($),#REGl; POKE #N(23814,4,,1)($),#REGh
  $6B9C #REGa=#N(21,2,,1)($)
  $6B9E CALL #R26476
  $6BA1 Pop last item from stack into #REGaf
  $6BA2 Pop last item from stack into #REGhl
  $6BA3 POKE #N(23813,4,,1)($),#REGl; POKE #N(23814,4,,1)($),#REGh
  $6BA6 #REGhl=#N(23808,4,,1)($)
  $6BA9 POKE #REGhl,#N(70,2,,1)($)
  $6BAB #REGl=PEEK #N(46884,4,,1)($); #REGh=PEEK #N(46885,4,,1)($)
  $6BAE POKE #N(23815,4,,1)($),#REGl; POKE #N(23816,4,,1)($),#REGh
  $6BB1 #REGl=PEEK #N(46882,4,,1)($); #REGh=PEEK #N(46883,4,,1)($)
  $6BB4 POKE #N(23839,4,,1)($),#REGl; POKE #N(23840,4,,1)($),#REGh
  $6BB7 #REGa=#REGa+1
  $6BB8 CALL #R25943
  $6BBB Return
c $6BBC
  $6BBC #REGixl=PEEK #N(23859,4,,1)($); #REGixh=PEEK #N(23860,4,,1)($)
  $6BC0 CALL #R27447
  $6BC3 #REGa=#N(8,2,,1)($)
  $6BC5 POKE #N(23817,4,,1)($),#REGa
  $6BC8 #REGhl=#N(17990,4,,1)($)
  $6BCB POKE #N(23808,4,,1)($),#REGl; POKE #N(23809,4,,1)($),#REGh
  $6BCE #REGhl=#N(6150,4,,1)($)
  $6BD1 POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $6BD4 #REGa=PEEK (#REGix+#N(6,2,,1)($))
  $6BD7 CALL #R26360
  $6BDA #REGa=0
  $6BDB POKE #N(23817,4,,1)($),#REGa
  $6BDE #REGa=PEEK (#REGix+#N(23,2,,1)($))
  $6BE1 Clear the carry flag and set the zero flag if #REGa=0
  $6BE2 Jump to #R27629 if #REGa=0
  $6BE4 #REGa=PEEK (#REGix+#N(35,2,,1)($))
  $6BE7 #REGhl=#N(6160,4,,1)($)
  $6BEA CALL #R27539
  $6BED #REGa=PEEK (#REGix+#N(22,2,,1)($))
  $6BF0 Set the zero flag if #REGa=#N(110,2,,1)($), or the carry flag if #REGa<#N(110,2,,1)($)
  $6BF2 Jump to #R27663 if #REGa<#N(110,2,,1)($)
  $6BF4 Set the zero flag if #REGa=#N(140,2,,1)($), or the carry flag if #REGa<#N(140,2,,1)($)
  $6BF6 Jump to #R27654 if #REGa<#N(140,2,,1)($)
  $6BF8 CALL #R26562
  $6BFB #REGa=PEEK (#REGix+#N(22,2,,1)($))
  $6BFE #REGixl=PEEK #N(23859,4,,1)($); #REGixh=PEEK #N(23860,4,,1)($)
  $6C02 Set the zero flag if #REGa=#N(110,2,,1)($), or the carry flag if #REGa<#N(110,2,,1)($)
  $6C04 Jump to #R27663 if #REGa<#N(110,2,,1)($)
  $6C06 #REGl=PEEK #N(23844,4,,1)($); #REGh=PEEK #N(23845,4,,1)($)
  $6C09 CALL #R32159
  $6C0C #REGa=PEEK #N(23843,4,,1)($)
  $6C0F Push #REGaf onto the stack
  $6C10 CALL #R26615
  $6C13 Pop last item from stack into #REGaf
  $6C14 #REGhl=#N(6163,4,,1)($)
  $6C17 CALL #R27539
  $6C1A #REGhl=#N(7445,4,,1)($)
  $6C1D POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $6C20 #REGa=PEEK (#REGiy+#N(6,2,,1)($))
  $6C23 CALL #R26360
  $6C26 CALL #R29951
  $6C29 Return
b $6C2A
t $6C99
c $6CA5
  $6CA5 Clear the carry flag and set the zero flag if #REGa=0
  $6CA6 CALL #R30602 if #REGa=0
  $6CA9 CALL #R28173
  $6CAC CALL #R28719
  $6CAF CALL #R27245
  $6CB2 Return
c $6CB3
  $6CB3 CALL #R27690
  $6CB6 CALL #R25674
  $6CB9 #REGb=#N(255,2,,1)($)
  $6CBB Push #REGbc onto the stack
  $6CBC CALL #R27881
  $6CBF Jump to #R27879 if the zero flag is set
  $6CC1 CALL #R26321
  $6CC4 Pop last item from stack into #REGbc
  $6CC5 Decrement #REGb and jump to #R27835 if #REGb>0
  $6CC7 #REGa=0
  $6CC8 POKE #N(23808,4,,1)($),#REGa
  $6CCB #REGl=PEEK #N(23825,4,,1)($); #REGh=PEEK #N(23826,4,,1)($)
  $6CCE #REGhl=#REGhl+#REGhl
  $6CCF #REGh=#REGh+1
  $6CD0 #REGl=#REGl+1
  $6CD1 POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $6CD4 CALL #R24751
  $6CD7 #REGb=#N(130,2,,1)($)
  $6CD9 Push #REGbc onto the stack
  $6CDA CALL #R27881
  $6CDD Jump to #R27879 if the zero flag is set
  $6CDF CALL #R26321
  $6CE2 Pop last item from stack into #REGbc
  $6CE3 Decrement #REGb and jump to #R27865 if #REGb>0
  $6CE5 Jump to #R27830
c $6CE7
  $6CE7 Pop last item from stack into #REGbc
  $6CE8 Return
c $6CE9
  $6CE9 CALL #R45256
  $6CEC #REGb=#N(118,2,,1)($)
  $6CEE Decrement #REGb and jump to #R27886 if #REGb>0
  $6CF0 #REGa=PEEK #N(23850,4,,1)($)
  $6CF3 Rotate #REGa right circular (copying bit 0 into bit 7 and into the carry flag)
  $6CF4 Jump to #R30925 if the carry flag is not set
  $6CF7 Rotate #REGa right circular (copying bit 0 into bit 7 and into the carry flag)
  $6CF8 Jump to #R28245 if the carry flag is not set
  $6CFB Rotate #REGa right circular (copying bit 0 into bit 7 and into the carry flag)
  $6CFC Jump to #R28256 if the carry flag is not set
  $6CFF Rotate #REGa right circular (copying bit 0 into bit 7 and into the carry flag)
  $6D00 Jump to #R28079 if the carry flag is not set
  $6D03 Rotate #REGa right circular (copying bit 0 into bit 7 and into the carry flag)
  $6D04 Jump to #R28126 if the carry flag is not set
  $6D07 #REGixl=PEEK #N(23859,4,,1)($); #REGixh=PEEK #N(23860,4,,1)($)
  $6D0B #REGa=PEEK (#REGix+#N(8,2,,1)($))
  $6D0E Clear the carry flag and set the zero flag if #REGa=0
  $6D0F Return
c $6D10
  $6D10 #REGa=PEEK (#REGix+#N(0,2,,1)($))
  $6D13 Rotate #REGa right circular (copying bit 0 into bit 7 and into the carry flag)
  $6D14 Rotate #REGa right circular (copying bit 0 into bit 7 and into the carry flag)
  $6D15 Rotate #REGa right circular (copying bit 0 into bit 7 and into the carry flag)
  $6D16 #REGh=#N(0,2,,1)($)
  $6D18 #REGl=#REGa
  $6D19 #REGe=PEEK #N(46876,4,,1)($); #REGd=PEEK #N(46877,4,,1)($)
  $6D1D #REGhl=#REGhl+#REGde
  $6D1E #REGa=PEEK (#REGix+#N(23,2,,1)($))
  $6D21 Clear the carry flag and set the zero flag if #REGa=0
  $6D22 Jump to #R27945 if #REGa=0
  $6D24 #REGa=PEEK (#REGix+#N(35,2,,1)($))
  $6D27 #REGa=#REGa-#N(109,2,,1)($)
  $6D29 #REGe=#REGa
  $6D2A #REGd=#N(0,2,,1)($)
  $6D2C #REGhl=#REGhl+#REGde
  $6D2D #REGa=PEEK #REGhl
  $6D2E #REGl=#REGa
  $6D2F #REGh=#REGd
  $6D30 #REGhl=#REGhl+#REGhl
  $6D31 #REGhl=#REGhl+#REGhl
  $6D32 #REGhl=#REGhl+#REGhl
  $6D33 #REGe=PEEK #N(46878,4,,1)($); #REGd=PEEK #N(46879,4,,1)($)
  $6D37 #REGhl=#REGhl+#REGde
  $6D38 #REGe=PEEK (#REGix+#N(33,2,,1)($))
  $6D3B #REGd=#N(0,2,,1)($)
  $6D3D #REGhl=#REGhl+#REGde
  $6D3E #REGa=PEEK #REGhl
  $6D3F Push #REGaf onto the stack
  $6D40 #REGa=PEEK #N(23846,4,,1)($)
  $6D43 #REGl=#REGa
  $6D44 #REGh=#REGd
  $6D45 #REGhl=#REGhl+#REGhl
  $6D46 #REGde=#N(58976,4,,1)($)
  $6D49 #REGhl=#REGhl+#REGde
  $6D4A Pop last item from stack into #REGaf
  $6D4B POKE #REGhl,#REGa
  $6D4C Return
s $6D4D
c $6D4E
  $6D4E #REGa=0
  $6D4F POKE #N(23863,4,,1)($),#REGa
  $6D52 #REGhl=#N(27981,4,,1)($)
  $6D55 POKE #REGhl,#REGb
  $6D56 #REGa=PEEK (#REGix+#N(6,2,,1)($))
  $6D59 #REGa=#REGa-#REGb
  $6D5A Jump to #R28000 if the carry flag is set
  $6D5C POKE #N(23861,4,,1)($),#REGa
  $6D5F Return
c $6D60
  $6D60 #REGa=#N(20,2,,1)($)
  $6D62 CALL #R28012
  $6D65 #REGa=#N(1,2,,1)($)
  $6D67 POKE #N(23863,4,,1)($),#REGa
  $6D6A Set the carry flag
  $6D6B Return
c $6D6C
  $6D6C Push #REGaf onto the stack
  $6D6D CALL #R27085
  $6D70 #REGhl=#N(23817,4,,1)($)
  $6D73 POKE #REGhl,#N(8,2,,1)($)
  $6D75 #REGhl=#N(6144,4,,1)($)
  $6D78 POKE #N(23813,4,,1)($),#REGl; POKE #N(23814,4,,1)($),#REGh
  $6D7B #REGhl=#N(17926,4,,1)($)
  $6D7E POKE #N(23808,4,,1)($),#REGl; POKE #N(23809,4,,1)($),#REGh
  $6D81 Pop last item from stack into #REGaf
  $6D82 CALL #R25943
  $6D85 #REGa=#N(11,2,,1)($)
  $6D87 CALL #R46526
  $6D8A Jump to #R28053
c $6D8C
  $6D8C CALL #R25321
  $6D8F CALL #R25321
  $6D92 CALL #R25321
  $6D95 #REGa=PEEK #N(24055,4,,1)($)
  $6D98 Clear the carry flag and set the zero flag if #REGa=0
  $6D99 Return if #REGa>0
  $6D9A #REGb=#N(65,2,,1)($)
  $6D9C Push #REGbc onto the stack
  $6D9D CALL #R45256
  $6DA0 CALL #R25316
  $6DA3 #REGa=PEEK #N(23850,4,,1)($)
  $6DA6 #REGa=#REGa+1
  $6DA7 Jump to #R28077 if #REGa>0
  $6DA9 Pop last item from stack into #REGbc
  $6DAA Decrement #REGb and jump to #R28060 if #REGb>0
  $6DAC Return
c $6DAD
  $6DAD Pop last item from stack into #REGbc
  $6DAE Return
c $6DAF
  $6DAF #REGb=#N(1,2,,1)($)
  $6DB1 CALL #R27982
  $6DB4 Jump to #R28121 if the carry flag is set
  $6DB6 #REGa=PEEK (#REGix+#N(33,2,,1)($))
  $6DB9 #REGa=#REGa+1
  $6DBA Set the zero flag if #REGa=#N(8,2,,1)($), or the carry flag if #REGa<#N(8,2,,1)($)
  $6DBC Jump to #R28095 if #REGa<>#N(8,2,,1)($)
  $6DBE #REGa=0
  $6DBF POKE (#REGix+#N(33,2,,1)($)),#REGa
  $6DC2 #REGa=PEEK #N(23861,4,,1)($)
  $6DC5 POKE (#REGix+#N(6,2,,1)($)),#REGa
  $6DC8 CALL #R27920
  $6DCB CALL #R29730
  $6DCE #REGa=PEEK #N(23862,4,,1)($)
  $6DD1 Clear the carry flag and set the zero flag if #REGa=0
  $6DD2 CALL #R24874 if #REGa=0
  $6DD5 CALL #R30737
  $6DD8 Return
c $6DD9
  $6DD9 CALL #R27275
  $6DDC #REGa=0
  $6DDD Return
c $6DDE
  $6DDE #REGb=#N(1,2,,1)($)
  $6DE0 CALL #R27982
  $6DE3 Jump to #R28168 if the carry flag is set
  $6DE5 #REGa=PEEK (#REGix+#N(33,2,,1)($))
  $6DE8 #REGa=#REGa-#N(1,2,,1)($)
  $6DEA Jump to #R28142 if the carry flag is not set
  $6DEC #REGa=#N(7,2,,1)($)
  $6DEE POKE (#REGix+#N(33,2,,1)($)),#REGa
  $6DF1 #REGa=PEEK #N(23861,4,,1)($)
  $6DF4 POKE (#REGix+#N(6,2,,1)($)),#REGa
  $6DF7 CALL #R27920
  $6DFA CALL #R29730
  $6DFD #REGa=PEEK #N(23862,4,,1)($)
  $6E00 Clear the carry flag and set the zero flag if #REGa=0
  $6E01 CALL #R24874 if #REGa=0
  $6E04 CALL #R30737
  $6E07 Return
c $6E08
  $6E08 CALL #R27275
  $6E0B #REGa=0
  $6E0C Return
c $6E0D
  $6E0D CALL #R26636
  $6E10 #REGl=PEEK #N(23844,4,,1)($); #REGh=PEEK #N(23845,4,,1)($)
  $6E13 #REGa=#REGh
  $6E14 Set the zero flag if #REGa=#N(5,2,,1)($), or the carry flag if #REGa<#N(5,2,,1)($)
  $6E16 Jump to #R28186 if #REGa>=#N(5,2,,1)($)
  $6E18 #REGa=#N(5,2,,1)($)
  $6E1A Set the zero flag if #REGa=#N(74,2,,1)($), or the carry flag if #REGa<#N(74,2,,1)($)
  $6E1C Jump to #R28192 if #REGa<#N(74,2,,1)($)
  $6E1E #REGa=#N(74,2,,1)($)
  $6E20 #REGa=#REGa-#N(5,2,,1)($)
  $6E22 POKE #N(23805,4,,1)($),#REGa
  $6E25 #REGb=#REGa
  $6E26 #REGa=#REGh
  $6E27 #REGa=#REGa-#REGb
  $6E28 POKE #N(23826,4,,1)($),#REGa
  $6E2B #REGa=#REGl
  $6E2C Set the zero flag if #REGa=#N(5,2,,1)($), or the carry flag if #REGa<#N(5,2,,1)($)
  $6E2E Jump to #R28210 if #REGa>=#N(5,2,,1)($)
  $6E30 #REGa=#N(5,2,,1)($)
  $6E32 Set the zero flag if #REGa=#N(44,2,,1)($), or the carry flag if #REGa<#N(44,2,,1)($)
  $6E34 Jump to #R28216 if #REGa<#N(44,2,,1)($)
  $6E36 #REGa=#N(44,2,,1)($)
  $6E38 #REGa=#REGa-#N(5,2,,1)($)
  $6E3A POKE #N(23804,4,,1)($),#REGa
  $6E3D #REGb=#REGa
  $6E3E #REGa=#REGl
  $6E3F #REGa=#REGa-#REGb
  $6E40 POKE #N(23825,4,,1)($),#REGa
  $6E43 #REGhl=#N(46874,4,,1)($)
  $6E46 POKE #REGhl,#N(1,2,,1)($)
  $6E48 #REGa=0
  $6E49 POKE #N(23830,4,,1)($),#REGa
  $6E4C #REGa=PEEK #N(23862,4,,1)($)
  $6E4F Clear the carry flag and set the zero flag if #REGa=0
  $6E50 Return if #REGa>0
  $6E51 CALL #R24874
  $6E54 Return
c $6E55
  $6E55 #REGa=0
  $6E56 POKE #N(23864,4,,1)($),#REGa
  $6E59 #REGa=PEEK (#REGix+#N(33,2,,1)($))
  $6E5C CALL #R32459
  $6E5F Return
c $6E60
  $6E60 #REGa=#N(1,2,,1)($)
  $6E62 POKE #N(23864,4,,1)($),#REGa
  $6E65 #REGa=PEEK (#REGix+#N(33,2,,1)($))
  $6E68 #REGa=#REGa+#N(4,2,,1)($)
  $6E6A Set the zero flag if #REGa=#N(8,2,,1)($), or the carry flag if #REGa<#N(8,2,,1)($)
  $6E6C Jump to #R28272 if #REGa<#N(8,2,,1)($)
  $6E6E #REGa=#REGa-#N(8,2,,1)($)
  $6E70 CALL #R32459
  $6E73 Return
c $6E74
  $6E74 #REGe=#REGa
  $6E75 #REGd=#N(0,2,,1)($)
  $6E77 #REGhl=#N(28327,4,,1)($)
  $6E7A #REGhl=#REGhl+#REGde
  $6E7B #REGhl=#REGhl+#REGde
  $6E7C #REGhl=#REGhl+#REGde
  $6E7D #REGa=PEEK #N(23844,4,,1)($)
  $6E80 #REGa=#REGa+PEEK #REGhl
  $6E81 Set the zero flag if #REGa=#N(255,2,,1)($), or the carry flag if #REGa<#N(255,2,,1)($)
  $6E83 Jump to #R28325 if #REGa=#N(255,2,,1)($)
  $6E85 Set the zero flag if #REGa=#N(50,2,,1)($), or the carry flag if #REGa<#N(50,2,,1)($)
  $6E87 Jump to #R28325 if #REGa=#N(50,2,,1)($)
  $6E89 POKE #N(23866,4,,1)($),#REGa
  $6E8C #REGa=PEEK #N(23845,4,,1)($)
  $6E8F #REGhl=#REGhl+1
  $6E90 #REGa=#REGa+PEEK #REGhl
  $6E91 Set the zero flag if #REGa=#N(255,2,,1)($), or the carry flag if #REGa<#N(255,2,,1)($)
  $6E93 Jump to #R28325 if #REGa=#N(255,2,,1)($)
  $6E95 Set the zero flag if #REGa=#N(80,2,,1)($), or the carry flag if #REGa<#N(80,2,,1)($)
  $6E97 Jump to #R28325 if #REGa=#N(80,2,,1)($)
  $6E99 POKE #N(23867,4,,1)($),#REGa
  $6E9C #REGhl=#REGhl+1
  $6E9D #REGa=PEEK #REGhl
  $6E9E POKE #N(23838,4,,1)($),#REGa
  $6EA1 #REGa=#N(1,2,,1)($)
  $6EA3 Clear the carry flag and set the zero flag if #REGa=0
  $6EA4 Return
c $6EA5
  $6EA5 #REGa=0
  $6EA6 Return
b $6EA7
c $6EB6
  $6EB6 #REGbc=#N(767,4,,1)($)
  $6EB9 Do nothing
  $6EBA CALL #R56
  $6EBB Do nothing
  $6EBC CALL #R56
  $6EBD CALL #R56
  $6EBE POKE #REGbc,#REGa
  $6EBF #REGa=0
  $6EC0 POKE #N(23848,4,,1)($),#REGa
  $6EC3 #REGe=PEEK #N(23866,4,,1)($); #REGd=PEEK #N(23867,4,,1)($)
  $6EC7 CALL #R24850
  $6ECA POKE #N(23870,4,,1)($),#REGl; POKE #N(23871,4,,1)($),#REGh
  $6ECD #REGa=PEEK #N(23864,4,,1)($)
  $6ED0 Clear the carry flag and set the zero flag if #REGa=0
  $6ED1 CALL #R30768 if #REGa>0
  $6ED4 #REGl=PEEK #N(23870,4,,1)($); #REGh=PEEK #N(23871,4,,1)($)
  $6ED7 #REGa=PEEK #REGhl
  $6ED8 POKE #N(23847,4,,1)($),#REGa
  $6EDB POKE #N(23865,4,,1)($),#REGa
  $6EDE Set the zero flag if #REGa=#N(140,2,,1)($), or the carry flag if #REGa<#N(140,2,,1)($)
  $6EE0 Jump to #R28455 if #REGa<#N(140,2,,1)($)
  $6EE2 CALL #R26562
  $6EE5 #REGa=PEEK (#REGix+#N(37,2,,1)($))
  $6EE8 Keep only bit 0 of #REGa
  $6EEA #REGhl=#N(46866,4,,1)($)
  $6EED Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $6EEE #REGhl=#N(23849,4,,1)($)
  $6EF1 Jump to #R28428 if the zero flag is set
  $6EF3 POKE #REGhl,#N(0,2,,1)($)
  $6EF5 POKE #N(23868,4,,1)($),#REGixl; POKE #N(23869,4,,1)($),#REGixh
  $6EF9 #REGixl=PEEK #N(23859,4,,1)($); #REGixh=PEEK #N(23860,4,,1)($)
  $6EFD #REGa=PEEK #N(23864,4,,1)($)
  $6F00 Clear the carry flag and set the zero flag if #REGa=0
  $6F01 Jump to #R28425 if #REGa>0
  $6F03 #REGa=PEEK (#REGix+#N(22,2,,1)($))
  $6F06 Set the zero flag if #REGa=#N(140,2,,1)($), or the carry flag if #REGa<#N(140,2,,1)($)
  $6F08 Return if #REGa<#N(140,2,,1)($)
  $6F09 POKE #REGhl,#N(3,2,,1)($)
  $6F0B Return
c $6F0C
  $6F0C #REGa=PEEK (#REGix+#N(22,2,,1)($))
  $6F0F POKE #N(23847,4,,1)($),#REGa
  $6F12 #REGb=PEEK (#REGix+#N(2,2,,1)($))
  $6F15 #REGixl=PEEK #N(23859,4,,1)($); #REGixh=PEEK #N(23860,4,,1)($)
  $6F19 #REGa=PEEK (#REGix+#N(2,2,,1)($))
  $6F1C #REGa=#REGa+#REGb
  $6F1D Set the zero flag if #REGa=#N(21,2,,1)($), or the carry flag if #REGa<#N(21,2,,1)($)
  $6F1F Jump to #R28452 if #REGa<#N(21,2,,1)($)
  $6F21 POKE #REGhl,#N(4,2,,1)($)
  $6F23 Return
c $6F24
  $6F24 #REGa=PEEK #N(23847,4,,1)($)
  $6F27 Set the zero flag if #REGa=#N(110,2,,1)($), or the carry flag if #REGa<#N(110,2,,1)($)
  $6F29 Jump to #R28480 if #REGa<#N(110,2,,1)($)
  $6F2B CALL #R26591
  $6F2E #REGa=PEEK (#REGix+#N(3,2,,1)($))
  $6F31 POKE #N(23848,4,,1)($),#REGa
  $6F34 #REGl=PEEK #N(23866,4,,1)($); #REGh=PEEK #N(23867,4,,1)($)
  $6F37 CALL #R32159
  $6F3A #REGa=PEEK #N(23843,4,,1)($)
  $6F3D POKE #N(23847,4,,1)($),#REGa
  $6F40 #REGa=PEEK #N(23847,4,,1)($)
  $6F43 CALL #R26615
  $6F46 #REGixl=PEEK #N(23859,4,,1)($); #REGixh=PEEK #N(23860,4,,1)($)
  $6F4A #REGe=PEEK (#REGix+#N(4,2,,1)($))
  $6F4D #REGd=#N(0,2,,1)($)
  $6F4F #REGiy=#REGiy+#REGde
  $6F51 #REGa=PEEK (#REGiy+#N(0,2,,1)($))
  $6F54 Set the zero flag if #REGa=#N(255,2,,1)($), or the carry flag if #REGa<#N(255,2,,1)($)
  $6F56 Jump to #R28516 if #REGa<>#N(255,2,,1)($)
  $6F58 #REGa=PEEK (#REGix+#N(22,2,,1)($))
  $6F5B Set the zero flag if #REGa=#N(140,2,,1)($), or the carry flag if #REGa<#N(140,2,,1)($)
  $6F5D #REGhl=#N(23849,4,,1)($)
  $6F60 Jump to #R28425 if the carry flag is not set
  $6F62 POKE #REGhl,#REGa
  $6F63 Return
c $6F64
  $6F64 #REGhl=#N(23848,4,,1)($)
  $6F67 #REGa=#REGa+PEEK #REGhl
  $6F68 #REGhl=#N(23838,4,,1)($)
  $6F6B #REGa=#REGa+PEEK #REGhl
  $6F6C POKE #N(23848,4,,1)($),#REGa
  $6F6F #REGa=PEEK #N(23864,4,,1)($)
  $6F72 Clear the carry flag and set the zero flag if #REGa=0
  $6F73 #REGhl=#N(23848,4,,1)($)
  $6F76 Jump to #R28538 if the zero flag is set
  $6F78 Shift (#REGhl) left (copying bit 7 into the carry flag, and resetting bit 0)
  $6F7A #REGa=PEEK (#REGix+#N(6,2,,1)($))
  $6F7D Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $6F7E #REGhl=#N(23849,4,,1)($)
  $6F81 Jump to #R28550 if the carry flag is not set
  $6F83 POKE #REGhl,#N(2,2,,1)($)
  $6F85 Return
c $6F86
  $6F86 POKE #REGhl,#N(5,2,,1)($)
  $6F88 Return
b $6F89
t $6FAE
c $6FC4
  $6FC4 CALL #R29889
  $6FC7 CALL #R29290
  $6FCA CALL #R29730
  $6FCD CALL #R28176
  $6FD0 #REGa=PEEK #N(24055,4,,1)($)
  $6FD3 Clear the carry flag and set the zero flag if #REGa=0
  $6FD4 #REGa=#N(3,2,,1)($)
  $6FD6 CALL #R46526 if the zero flag is set
  $6FD9 #REGa=PEEK (#REGix+#N(6,2,,1)($))
  $6FDC Clear the carry flag and set the zero flag if #REGa=0
  $6FDD Jump to #R28645 if #REGa>0
  $6FDF CALL #R39446
  $6FE2 Jump to #R28738 if the zero flag is not set
  $6FE5 CALL #R39446
  $6FE8 CALL #R28719 if the zero flag is set
  $6FEB #REGa=PEEK #N(23901,4,,1)($)
  $6FEE Clear the carry flag and set the zero flag if #REGa=0
  $6FEF CALL #R30045 if #REGa=0
  $6FF2 #REGa=PEEK #N(24055,4,,1)($)
  $6FF5 Clear the carry flag and set the zero flag if #REGa=0
  $6FF6 Jump to #R28705 if #REGa=0
  $6FF8 #REGa=PEEK #N(23862,4,,1)($)
  $6FFB Clear the carry flag and set the zero flag if #REGa=0
  $6FFC Jump to #R28675 if #REGa=0
  $6FFE CALL #R46634
  $7001 Jump to #R28705
c $7003
  $7003 #REGa=PEEK #N(46869,4,,1)($)
  $7006 Clear the carry flag and set the zero flag if #REGa=0
  $7007 Jump to #R28705 if #REGa=0
  $7009 #REGa=0
  $700A POKE #N(46866,4,,1)($),#REGa
  $700D CALL #R30535
  $7010 #REGa=#N(1,2,,1)($)
  $7012 POKE #N(46866,4,,1)($),#REGa
  $7015 CALL #R24874
  $7018 CALL #R29290
  $701B CALL #R29730
  $701E CALL #R28044
  $7021 #REGa=PEEK (#REGix+#N(8,2,,1)($))
  $7024 Clear the carry flag and set the zero flag if #REGa=0
  $7025 Return if #REGa=0
  $7026 #REGa=PEEK (#REGix+#N(6,2,,1)($))
  $7029 Clear the carry flag and set the zero flag if #REGa=0
  $702A Return if #REGa=0
  $702B #REGa=#N(1,2,,1)($)
  $702D Clear the carry flag and set the zero flag if #REGa=0
  $702E Return
c $702F
  $702F #REGl=PEEK #N(23844,4,,1)($); #REGh=PEEK #N(23845,4,,1)($)
  $7032 POKE #N(23872,4,,1)($),#REGl; POKE #N(23873,4,,1)($),#REGh
  $7035 #REGa=PEEK (#REGix+#N(6,2,,1)($))
  $7038 POKE #N(23874,4,,1)($),#REGa
  $703B #REGa=PEEK (#REGix+#N(33,2,,1)($))
  $703E POKE #N(23875,4,,1)($),#REGa
  $7041 Return
c $7042
  $7042 #REGa=PEEK (#REGix+#N(22,2,,1)($))
  $7045 #REGl=PEEK #N(23855,4,,1)($); #REGh=PEEK #N(23856,4,,1)($)
  $7048 POKE #REGhl,#REGa
  $7049 #REGe=PEEK #N(23872,4,,1)($); #REGd=PEEK #N(23873,4,,1)($)
  $704D POKE #N(23804,4,,1)($),#REGe; POKE #N(23805,4,,1)($),#REGd
  $7051 POKE #N(23844,4,,1)($),#REGe; POKE #N(23845,4,,1)($),#REGd
  $7055 CALL #R24850
  $7058 POKE #N(23855,4,,1)($),#REGl; POKE #N(23856,4,,1)($),#REGh
  $705B #REGa=PEEK #REGhl
  $705C POKE (#REGix+#N(22,2,,1)($)),#REGa
  $705F #REGa=PEEK #N(23846,4,,1)($)
  $7062 POKE #REGhl,#REGa
  $7063 #REGhl=#N(0,4,,1)($)
  $7066 POKE #N(23825,4,,1)($),#REGl; POKE #N(23826,4,,1)($),#REGh
  $7069 #REGa=PEEK #N(23874,4,,1)($)
  $706C POKE (#REGix+#N(6,2,,1)($)),#REGa
  $706F #REGa=PEEK #N(23875,4,,1)($)
  $7072 POKE (#REGix+#N(33,2,,1)($)),#REGa
  $7075 CALL #R27920
  $7078 CALL #R28173
  $707B #REGa=PEEK #N(23846,4,,1)($)
  $707E CALL #R29889
  $7081 CALL #R27580
  $7084 CALL #R27245
  $7087 CALL #R28719
  $708A #REGa=#N(1,2,,1)($)
  $708C POKE #N(23863,4,,1)($),#REGa
  $708F Clear the carry flag and set the zero flag if #REGa=0
  $7090 Return
s $7091
c $70B3
  $70B3 #REGl=PEEK #N(28841,4,,1)($); #REGh=PEEK #N(28842,4,,1)($)
  $70B6 #REGe=PEEK #N(28845,4,,1)($); #REGd=PEEK #N(28846,4,,1)($)
  $70BA #REGhl=#REGhl+#REGde
  $70BB POKE #N(28841,4,,1)($),#REGl; POKE #N(28842,4,,1)($),#REGh
  $70BE #REGe=PEEK #N(28843,4,,1)($); #REGd=PEEK #N(28844,4,,1)($)
  $70C2 #REGa=0
  $70C3 #REGhl=#REGhl-carry-#REGde
  $70C5 Return if the carry flag is set
  $70C6 POKE #N(28841,4,,1)($),#REGl; POKE #N(28842,4,,1)($),#REGh
  $70C9 Return
c $70CA
  $70CA #REGl=PEEK #N(28821,4,,1)($); #REGh=PEEK #N(28822,4,,1)($)
  $70CD #REGe=PEEK #N(28817,4,,1)($); #REGd=PEEK #N(28818,4,,1)($)
  $70D1 Clear the carry flag and set the zero flag if #REGa=0
  $70D2 #REGhl=#REGhl-carry-#REGde
  $70D4 Jump to #R28897 if the carry flag is set
  $70D6 POKE #N(28829,4,,1)($),#REGl; POKE #N(28830,4,,1)($),#REGh
  $70D9 #REGhl=#N(1,4,,1)($)
  $70DC POKE #N(28835,4,,1)($),#REGl; POKE #N(28836,4,,1)($),#REGh
  $70DF Jump to #R28916
c $70E1
  $70E1 #REGl=PEEK #N(28817,4,,1)($); #REGh=PEEK #N(28818,4,,1)($)
  $70E4 #REGe=PEEK #N(28821,4,,1)($); #REGd=PEEK #N(28822,4,,1)($)
  $70E8 Clear the carry flag and set the zero flag if #REGa=0
  $70E9 #REGhl=#REGhl-carry-#REGde
  $70EB POKE #N(28829,4,,1)($),#REGl; POKE #N(28830,4,,1)($),#REGh
  $70EE #REGhl=#N(65535,4,,1)($)
  $70F1 POKE #N(28835,4,,1)($),#REGl; POKE #N(28836,4,,1)($),#REGh
  $70F4 #REGl=PEEK #N(28823,4,,1)($); #REGh=PEEK #N(28824,4,,1)($)
  $70F7 #REGe=PEEK #N(28819,4,,1)($); #REGd=PEEK #N(28820,4,,1)($)
  $70FB Clear the carry flag and set the zero flag if #REGa=0
  $70FC #REGhl=#REGhl-carry-#REGde
  $70FE Jump to #R28939 if the carry flag is set
  $7100 POKE #N(28831,4,,1)($),#REGl; POKE #N(28832,4,,1)($),#REGh
  $7103 #REGhl=#N(1,4,,1)($)
  $7106 POKE #N(28833,4,,1)($),#REGl; POKE #N(28834,4,,1)($),#REGh
  $7109 Jump to #R28958
c $710B
  $710B #REGl=PEEK #N(28819,4,,1)($); #REGh=PEEK #N(28820,4,,1)($)
  $710E #REGe=PEEK #N(28823,4,,1)($); #REGd=PEEK #N(28824,4,,1)($)
  $7112 Clear the carry flag and set the zero flag if #REGa=0
  $7113 #REGhl=#REGhl-carry-#REGde
  $7115 POKE #N(28831,4,,1)($),#REGl; POKE #N(28832,4,,1)($),#REGh
  $7118 #REGhl=#N(65535,4,,1)($)
  $711B POKE #N(28833,4,,1)($),#REGl; POKE #N(28834,4,,1)($),#REGh
  $711E #REGl=PEEK #N(28829,4,,1)($); #REGh=PEEK #N(28830,4,,1)($)
  $7121 #REGe=PEEK #N(28831,4,,1)($); #REGd=PEEK #N(28832,4,,1)($)
  $7125 Clear the carry flag and set the zero flag if #REGa=0
  $7126 #REGhl=#REGhl-carry-#REGde
  $7128 Jump to #R28996 if the carry flag is set
  $712A #REGl=PEEK #N(28831,4,,1)($); #REGh=PEEK #N(28832,4,,1)($)
  $712D POKE #N(28845,4,,1)($),#REGl; POKE #N(28846,4,,1)($),#REGh
  $7130 #REGl=PEEK #N(28829,4,,1)($); #REGh=PEEK #N(28830,4,,1)($)
  $7133 POKE #N(28843,4,,1)($),#REGl; POKE #N(28844,4,,1)($),#REGh
  $7136 #REGl=PEEK #N(28835,4,,1)($); #REGh=PEEK #N(28836,4,,1)($)
  $7139 POKE #N(28839,4,,1)($),#REGl; POKE #N(28840,4,,1)($),#REGh
  $713C #REGhl=#N(0,4,,1)($)
  $713F POKE #N(28837,4,,1)($),#REGl; POKE #N(28838,4,,1)($),#REGh
  $7142 Jump to #R29020
c $7144
  $7144 #REGl=PEEK #N(28829,4,,1)($); #REGh=PEEK #N(28830,4,,1)($)
  $7147 POKE #N(28845,4,,1)($),#REGl; POKE #N(28846,4,,1)($),#REGh
  $714A #REGl=PEEK #N(28831,4,,1)($); #REGh=PEEK #N(28832,4,,1)($)
  $714D POKE #N(28843,4,,1)($),#REGl; POKE #N(28844,4,,1)($),#REGh
  $7150 #REGl=PEEK #N(28833,4,,1)($); #REGh=PEEK #N(28834,4,,1)($)
  $7153 POKE #N(28837,4,,1)($),#REGl; POKE #N(28838,4,,1)($),#REGh
  $7156 #REGhl=#N(0,4,,1)($)
  $7159 POKE #N(28839,4,,1)($),#REGl; POKE #N(28840,4,,1)($),#REGh
  $715C #REGl=PEEK #N(28843,4,,1)($); #REGh=PEEK #N(28844,4,,1)($)
  $715F Clear the carry flag and set the zero flag if #REGa=0
  $7160 Rotate #REGh right through the carry flag
  $7162 Rotate #REGl right through the carry flag
  $7164 POKE #N(28841,4,,1)($),#REGl; POKE #N(28842,4,,1)($),#REGh
  $7167 Return
c $7168
  $7168 CALL #R28851
  $716B Jump to #R29066 if the carry flag is not set
  $716D #REGa=PEEK #N(28827,4,,1)($)
  $7170 #REGhl=#N(28837,4,,1)($)
  $7173 #REGa=#REGa+PEEK #REGhl
  $7174 POKE #N(28827,4,,1)($),#REGa
  $7177 #REGa=PEEK #N(28825,4,,1)($)
  $717A #REGhl=#N(28839,4,,1)($)
  $717D #REGa=#REGa+PEEK #REGhl
  $717E POKE #N(28825,4,,1)($),#REGa
  $7181 #REGl=PEEK #N(28849,4,,1)($); #REGh=PEEK #N(28850,4,,1)($)
  $7184 #REGhl=#REGhl+1
  $7185 #REGhl=#REGhl+1
  $7186 POKE #N(28849,4,,1)($),#REGl; POKE #N(28850,4,,1)($),#REGh
  $7189 Return
c $718A
  $718A #REGa=PEEK #N(28827,4,,1)($)
  $718D #REGhl=#N(28833,4,,1)($)
  $7190 #REGa=#REGa+PEEK #REGhl
  $7191 POKE #N(28827,4,,1)($),#REGa
  $7194 #REGa=PEEK #N(28825,4,,1)($)
  $7197 #REGhl=#N(28835,4,,1)($)
  $719A #REGa=#REGa+PEEK #REGhl
  $719B POKE #N(28825,4,,1)($),#REGa
  $719E #REGl=PEEK #N(28849,4,,1)($); #REGh=PEEK #N(28850,4,,1)($)
  $71A1 #REGhl=#REGhl+1
  $71A2 #REGhl=#REGhl+1
  $71A3 #REGhl=#REGhl+1
  $71A4 POKE #N(28849,4,,1)($),#REGl; POKE #N(28850,4,,1)($),#REGh
  $71A7 Return
c $71A8
  $71A8 #REGb=#N(20,2,,1)($)
  $71AA POKE #N(23876,4,,1)($),#REGa
  $71AD #REGhl=#N(23632,4,,1)($)
  $71B0 POKE #N(23877,4,,1)($),#REGl; POKE #N(23878,4,,1)($),#REGh
  $71B3 Push #REGbc onto the stack
  $71B4 #REGl=PEEK #N(23877,4,,1)($); #REGh=PEEK #N(23878,4,,1)($)
  $71B7 #REGa=PEEK #N(23876,4,,1)($)
  $71BA Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $71BB Jump to #R29129 if #REGa<>PEEK #REGhl
  $71BD #REGhl=#REGhl+1
  $71BE #REGe=PEEK #REGhl
  $71BF #REGhl=#REGhl+1
  $71C0 #REGd=PEEK #REGhl
  $71C1 #REGhl=#REGhl+1
  $71C2 #REGa=PEEK #REGhl
  $71C3 Push #REGaf onto the stack
  $71C4 CALL #R24850
  $71C7 Pop last item from stack into #REGaf
  $71C8 POKE #REGhl,#REGa
  $71C9 #REGl=PEEK #N(23877,4,,1)($); #REGh=PEEK #N(23878,4,,1)($)
  $71CC #REGde=#N(4,4,,1)($)
  $71CF #REGhl=#REGhl+#REGde
  $71D0 POKE #N(23877,4,,1)($),#REGl; POKE #N(23878,4,,1)($),#REGh
  $71D3 Pop last item from stack into #REGbc
  $71D4 Decrement #REGb and jump to #R29107 if #REGb>0
  $71D6 Return
c $71D7
  $71D7 #REGb=#N(20,2,,1)($)
  $71D9 #REGhl=#N(23632,4,,1)($)
  $71DC POKE #N(23877,4,,1)($),#REGl; POKE #N(23878,4,,1)($),#REGh
  $71DF #REGl=PEEK #N(23877,4,,1)($); #REGh=PEEK #N(23878,4,,1)($)
  $71E2 #REGa=PEEK #REGhl
  $71E3 Set the zero flag if #REGa=#N(3,2,,1)($), or the carry flag if #REGa<#N(3,2,,1)($)
  $71E5 Jump to #R29172 if #REGa=#N(3,2,,1)($)
  $71E7 #REGhl=#REGhl+1
  $71E8 #REGe=PEEK #REGhl
  $71E9 #REGhl=#REGhl+1
  $71EA #REGd=PEEK #REGhl
  $71EB Push #REGbc onto the stack
  $71EC CALL #R24850
  $71EF Pop last item from stack into #REGbc
  $71F0 #REGa=#N(160,2,,1)($)
  $71F2 #REGa=#REGa-#REGb
  $71F3 POKE #REGhl,#REGa
  $71F4 #REGl=PEEK #N(23877,4,,1)($); #REGh=PEEK #N(23878,4,,1)($)
  $71F7 #REGde=#N(4,4,,1)($)
  $71FA #REGhl=#REGhl+#REGde
  $71FB POKE #N(23877,4,,1)($),#REGl; POKE #N(23878,4,,1)($),#REGh
  $71FE Decrement #REGb and jump to #R29151 if #REGb>0
  $7200 Return
c $7201
  $7201 #REGa=#N(4,2,,1)($)
  $7203 Jump to #R29195
c $7205
  $7205 #REGa=#N(2,2,,1)($)
  $7207 Jump to #R29195
c $7209
  $7209 #REGa=#N(1,2,,1)($)
  $720B POKE #N(23883,4,,1)($),#REGa
  $720E #REGa=PEEK #N(23879,4,,1)($)
  $7211 POKE #N(28819,4,,1)($),#REGa
  $7214 POKE #N(28827,4,,1)($),#REGa
  $7217 #REGa=PEEK #N(23880,4,,1)($)
  $721A POKE #N(28817,4,,1)($),#REGa
  $721D POKE #N(28825,4,,1)($),#REGa
  $7220 #REGa=PEEK #N(23881,4,,1)($)
  $7223 POKE #N(28823,4,,1)($),#REGa
  $7226 #REGa=PEEK #N(23882,4,,1)($)
  $7229 POKE #N(28821,4,,1)($),#REGa
  $722C #REGa=0
  $722D POKE #N(28820,4,,1)($),#REGa
  $7230 POKE #N(28828,4,,1)($),#REGa
  $7233 POKE #N(28818,4,,1)($),#REGa
  $7236 POKE #N(28826,4,,1)($),#REGa
  $7239 POKE #N(28824,4,,1)($),#REGa
  $723C POKE #N(28822,4,,1)($),#REGa
  $723F CALL #R28874
  $7242 CALL #R29032
  $7245 #REGa=PEEK #N(28827,4,,1)($)
  $7248 #REGe=#REGa
  $7249 #REGa=PEEK #N(28825,4,,1)($)
  $724C #REGd=#REGa
  $724D #REGa=PEEK #N(23881,4,,1)($)
  $7250 Set the zero flag if #REGa=#REGe, or the carry flag if #REGa<#REGe
  $7251 Jump to #R29272 if #REGa<>#REGe
  $7253 #REGa=PEEK #N(23882,4,,1)($)
  $7256 Set the zero flag if #REGa=#REGd, or the carry flag if #REGa<#REGd
  $7257 Return if #REGa=#REGd
  $7258 CALL #R24850
  $725B #REGe=PEEK #REGhl
  $725C #REGd=#N(0,2,,1)($)
  $725E #REGhl=#N(54015,4,,1)($)
  $7261 #REGhl=#REGhl+#REGde
  $7262 #REGa=PEEK #REGhl
  $7263 #REGhl=#N(23883,4,,1)($)
  $7266 #REGa=#REGa&PEEK #REGhl
  $7267 Return if #REGa>0
  $7268 Jump to #R29250
c $726A
  $726A #REGhl=#N(46866,4,,1)($)
  $726D #REGa=#N(1,2,,1)($)
  $726F #REGa=#REGa-PEEK #REGhl
  $7270 #REGa=#REGa+1
  $7271 POKE #N(23885,4,,1)($),#REGa
  $7274 #REGa=#N(1,2,,1)($)
  $7276 POKE #N(23884,4,,1)($),#REGa
  $7279 #REGl=PEEK #N(23844,4,,1)($); #REGh=PEEK #N(23845,4,,1)($)
  $727C POKE #N(23889,4,,1)($),#REGl; POKE #N(23890,4,,1)($),#REGh
  $727F CALL #R29336
  $7282 Return
b $7283
t $7285
c $7294
  $7294 CALL #R29336
  $7297 Return
b $7298
t $72DE
b $72ED
t $72EF
c $72FE
  $72FE CALL #R29193
  $7301 Jump to #R29464 if the zero flag is not set
  $7303 #REGl=PEEK #N(23887,4,,1)($); #REGh=PEEK #N(23888,4,,1)($)
  $7306 #REGa=PEEK #N(23879,4,,1)($)
  $7309 POKE #REGhl,#REGa
  $730A #REGhl=#REGhl+1
  $730B #REGa=PEEK #N(23880,4,,1)($)
  $730E POKE #REGhl,#REGa
  $730F #REGhl=#REGhl+1
  $7310 #REGa=PEEK #N(23886,4,,1)($)
  $7313 POKE #REGhl,#REGa
  $7314 #REGhl=#REGhl+1
  $7315 POKE #N(23887,4,,1)($),#REGl; POKE #N(23888,4,,1)($),#REGh
  $7318 #REGl=PEEK #N(23877,4,,1)($); #REGh=PEEK #N(23878,4,,1)($)
  $731B #REGde=#N(4,4,,1)($)
  $731E #REGhl=#REGhl+#REGde
  $731F POKE #N(23877,4,,1)($),#REGl; POKE #N(23878,4,,1)($),#REGh
  $7322 Pop last item from stack into #REGbc
  $7323 Decrement #REGb and jump to #R29360 if #REGb>0
  $7325 Return
c $7326
  $7326 #REGa=PEEK #N(23879,4,,1)($)
  $7329 #REGhl=#N(23881,4,,1)($)
  $732C #REGa=#REGa-PEEK #REGhl
  $732D Jump to #R29489 if the carry flag is not set
  $732F #REGa=#N(256,2,,1)($)-#REGa
  $7331 POKE #N(23893,4,,1)($),#REGa
  $7334 #REGa=PEEK #N(23880,4,,1)($)
  $7337 #REGhl=#N(23882,4,,1)($)
  $733A #REGa=#REGa-PEEK #REGhl
  $733B Jump to #R29503 if the carry flag is not set
  $733D #REGa=#N(256,2,,1)($)-#REGa
  $733F POKE #N(23894,4,,1)($),#REGa
  $7342 #REGe=PEEK (#REGix+#N(33,2,,1)($))
  $7345 #REGd=#N(0,2,,1)($)
  $7347 #REGhl=#N(29521,4,,1)($)
  $734A #REGhl=#REGhl+#REGde
  $734B #REGhl=#REGhl+#REGde
  $734C #REGe=PEEK #REGhl
  $734D #REGhl=#REGhl+1
  $734E #REGd=PEEK #REGhl
  $734F Exchange #REGde and #REGhl
  $7350 Jump to #REGhl
b $7351
t $7358
c $7361
  $7361 CALL #R29560
  $7364 Jump to #R29555
c $7366
  $7366 CALL #R29636
  $7369 Jump to #R29555
c $736B
  $736B CALL #R29598
  $736E Jump to #R29555
b $7370
c $7377
  $7377 Return
c $7378
  $7378 #REGa=PEEK #N(23893,4,,1)($)
  $737B #REGhl=#N(23894,4,,1)($)
  $737E Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $737F Jump to #R29583 if #REGa<PEEK #REGhl
  $7381 #REGa=PEEK #N(23881,4,,1)($)
  $7384 #REGhl=#N(23879,4,,1)($)
  $7387 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $7388 Jump to #R29581 if #REGa<PEEK #REGhl
  $738A #REGa=#N(2,2,,1)($)
  $738C Return
c $738D
  $738D #REGa=0
  $738E Return
c $738F
  $738F #REGa=PEEK #N(23882,4,,1)($)
  $7392 #REGhl=#N(23880,4,,1)($)
  $7395 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $7396 Jump to #R29595 if #REGa<PEEK #REGhl
  $7398 #REGa=#N(1,2,,1)($)
  $739A Return
c $739B
  $739B #REGa=#N(3,2,,1)($)
  $739D Return
c $739E
  $739E #REGa=PEEK #N(23894,4,,1)($)
  $73A1 #REGhl=#N(23893,4,,1)($)
  $73A4 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $73A5 Jump to #R29621 if #REGa<PEEK #REGhl
  $73A7 #REGa=PEEK #N(23882,4,,1)($)
  $73AA #REGhl=#N(23880,4,,1)($)
  $73AD Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $73AE Jump to #R29618 if #REGa<PEEK #REGhl
  $73B0 #REGa=0
  $73B1 Return
c $73B2
  $73B2 #REGa=#N(2,2,,1)($)
  $73B4 Return
c $73B5
  $73B5 #REGa=PEEK #N(23881,4,,1)($)
  $73B8 #REGhl=#N(23879,4,,1)($)
  $73BB Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $73BC Jump to #R29633 if #REGa<PEEK #REGhl
  $73BE #REGa=#N(1,2,,1)($)
  $73C0 Return
c $73C1
  $73C1 #REGa=#N(3,2,,1)($)
  $73C3 Return
c $73C4
  $73C4 #REGa=PEEK #N(23879,4,,1)($)
  $73C7 #REGhl=#N(23881,4,,1)($)
  $73CA Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $73CB Jump to #R29656 if #REGa<PEEK #REGhl
  $73CD #REGa=PEEK #N(23882,4,,1)($)
  $73D0 #REGhl=#N(23880,4,,1)($)
  $73D3 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $73D4 Jump to #R29656 if #REGa<PEEK #REGhl
  $73D6 #REGa=0
  $73D7 Return
c $73D8
  $73D8 #REGa=PEEK #N(23881,4,,1)($)
  $73DB #REGhl=#N(23879,4,,1)($)
  $73DE Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $73DF Jump to #R29677 if #REGa<PEEK #REGhl
  $73E1 #REGa=PEEK #N(23880,4,,1)($)
  $73E4 #REGhl=#N(23882,4,,1)($)
  $73E7 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $73E8 Jump to #R29680 if #REGa<PEEK #REGhl
  $73EA #REGa=#N(2,2,,1)($)
  $73EC Return
c $73ED
  $73ED #REGa=#N(3,2,,1)($)
  $73EF Return
c $73F0
  $73F0 #REGa=#N(1,2,,1)($)
  $73F2 Return
c $73F3
  $73F3 #REGa=PEEK #N(23881,4,,1)($)
  $73F6 #REGhl=#N(23879,4,,1)($)
  $73F9 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $73FA Jump to #R29703 if #REGa<PEEK #REGhl
  $73FC #REGa=PEEK #N(23882,4,,1)($)
  $73FF #REGhl=#N(23880,4,,1)($)
  $7402 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $7403 Jump to #R29703 if #REGa<PEEK #REGhl
  $7405 #REGa=0
  $7406 Return
c $7407
  $7407 #REGa=PEEK #N(23879,4,,1)($)
  $740A #REGhl=#N(23881,4,,1)($)
  $740D Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $740E Jump to #R29724 if #REGa<PEEK #REGhl
  $7410 #REGa=PEEK #N(23880,4,,1)($)
  $7413 #REGhl=#N(23882,4,,1)($)
  $7416 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $7417 Jump to #R29727 if #REGa<PEEK #REGhl
  $7419 #REGa=#N(2,2,,1)($)
  $741B Return
c $741C
  $741C #REGa=#N(1,2,,1)($)
  $741E Return
c $741F
  $741F #REGa=#N(3,2,,1)($)
  $7421 Return
b $7422
t $742E
c $743C
  $743C CALL #R56
  $743D Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $743E Return if #REGa=PEEK #REGhl
  $743F #REGe=PEEK #REGhl
  $7440 #REGhl=#REGhl+1
  $7441 #REGd=PEEK #REGhl
  $7442 POKE #N(23881,4,,1)($),#REGe; POKE #N(23882,4,,1)($),#REGd
  $7446 #REGhl=#REGhl+1
  $7447 POKE #N(23887,4,,1)($),#REGl; POKE #N(23888,4,,1)($),#REGh
  $744A CALL #R29478
  $744D Clear the carry flag and set the zero flag if #REGa=0
  $744E Jump to #R29823 if #REGa>0
  $7450 #REGl=PEEK #N(23887,4,,1)($); #REGh=PEEK #N(23888,4,,1)($)
  $7453 #REGa=PEEK #REGhl
  $7454 Push #REGaf onto the stack
  $7455 #REGe=PEEK #N(23881,4,,1)($); #REGd=PEEK #N(23882,4,,1)($)
  $7459 CALL #R24850
  $745C Pop last item from stack into #REGaf
  $745D POKE #REGhl,#REGa
  $745E #REGl=PEEK #N(23895,4,,1)($); #REGh=PEEK #N(23896,4,,1)($)
  $7461 POKE #REGhl,#REGa
  $7462 #REGb=#REGa
  $7463 #REGhl=#REGhl+1
  $7464 POKE #N(23895,4,,1)($),#REGl; POKE #N(23896,4,,1)($),#REGh
  $7467 #REGhl=#N(23897,4,,1)($)
  $746A POKE #REGhl,(PEEK #REGhl)+1
  $746B #REGa=PEEK #N(24055,4,,1)($)
  $746E Clear the carry flag and set the zero flag if #REGa=0
  $746F Jump to #R29823 if #REGa=0
  $7471 #REGa=#REGb
  $7472 #REGa=#REGa-#N(140,2,,1)($)
  $7474 #REGe=#REGa
  $7475 #REGd=#N(0,2,,1)($)
  $7477 #REGhl=#N(46650,4,,1)($)
  $747A #REGhl=#REGhl+#REGde
  $747B #REGa=PEEK #N(24056,4,,1)($)
  $747E POKE #REGhl,#REGa
  $747F #REGl=PEEK #N(23887,4,,1)($); #REGh=PEEK #N(23888,4,,1)($)
  $7482 #REGhl=#REGhl+1
  $7483 POKE #N(23887,4,,1)($),#REGl; POKE #N(23888,4,,1)($),#REGh
  $7486 Jump to #R29752
c $7488
  $7488 #REGhl=#N(23632,4,,1)($)
  $748B #REGde=#N(23633,4,,1)($)
  $748E #REGbc=#N(79,4,,1)($)
  $7491 POKE #REGhl,#N(3,2,,1)($)
  $7493 POKE #REGde,PEEK #REGhl; #REGhl=#REGhl+1; #REGde=#REGde+1; #REGbc=#REGbc-1; repeat until #REGbc=0
  $7495 #REGhl=#N(54975,4,,1)($)
  $7498 POKE #N(23877,4,,1)($),#REGl; POKE #N(23878,4,,1)($),#REGh
  $749B #REGl=PEEK #N(23877,4,,1)($); #REGh=PEEK #N(23878,4,,1)($)
  $749E #REGa=PEEK #REGhl
  $749F Set the zero flag if #REGa=#N(140,2,,1)($), or the carry flag if #REGa<#N(140,2,,1)($)
  $74A1 Jump to #R29873 if #REGa<#N(140,2,,1)($)
  $74A3 Push #REGaf onto the stack
  $74A4 CALL #R26562
  $74A7 #REGl=PEEK #N(23877,4,,1)($); #REGh=PEEK #N(23878,4,,1)($)
  $74AA CALL #R29922
  $74AD Pop last item from stack into #REGaf
  $74AE CALL #R29889
  $74B1 #REGl=PEEK #N(23877,4,,1)($); #REGh=PEEK #N(23878,4,,1)($)
  $74B4 #REGhl=#REGhl+1
  $74B5 POKE #N(23877,4,,1)($),#REGl; POKE #N(23878,4,,1)($),#REGh
  $74B8 #REGde=#N(58975,4,,1)($)
  $74BB Clear the carry flag and set the zero flag if #REGa=0
  $74BC #REGhl=#REGhl-carry-#REGde
  $74BE Jump to #R29851 if #REGhl>0
  $74C0 Return
c $74C1
  $74C1 #REGa=#REGa-#N(140,2,,1)($)
  $74C3 #REGl=#REGa
  $74C4 #REGh=#N(0,2,,1)($)
  $74C6 #REGhl=#REGhl+#REGhl
  $74C7 #REGhl=#REGhl+#REGhl
  $74C8 #REGde=#N(23632,4,,1)($)
  $74CB #REGhl=#REGhl+#REGde
  $74CC #REGa=PEEK (#REGix+#N(37,2,,1)($))
  $74CF Keep only bit 0 of #REGa
  $74D1 POKE #REGhl,#REGa
  $74D2 #REGhl=#REGhl+1
  $74D3 #REGa=PEEK #N(23844,4,,1)($)
  $74D6 POKE #REGhl,#REGa
  $74D7 #REGhl=#REGhl+1
  $74D8 #REGa=PEEK #N(23845,4,,1)($)
  $74DB POKE #REGhl,#REGa
  $74DC #REGhl=#REGhl+1
  $74DD #REGa=PEEK (#REGix+#N(22,2,,1)($))
  $74E0 POKE #REGhl,#REGa
  $74E1 Return
c $74E2
  $74E2 #REGa=0
  $74E3 #REGde=#N(54975,4,,1)($)
  $74E6 #REGhl=#REGhl-carry-#REGde
  $74E8 #REGde=#N(80,4,,1)($)
  $74EB #REGb=#N(0,2,,1)($)
  $74ED #REGhl=#REGhl-carry-#REGde
  $74EF Jump to #R29940 if the carry flag is set
  $74F1 #REGb=#REGb+1
  $74F2 Jump to #R29933
c $74F4
  $74F4 #REGhl=#REGhl+#REGde
  $74F5 #REGa=#REGb
  $74F6 POKE #N(23844,4,,1)($),#REGa
  $74F9 #REGa=#REGl
  $74FA POKE #N(23845,4,,1)($),#REGa
  $74FD Return
s $74FE
c $74FF
  $74FF #REGa=PEEK #N(24055,4,,1)($)
  $7502 Clear the carry flag and set the zero flag if #REGa=0
  $7503 Return if #REGa>0
  $7504 #REGa=PEEK #N(23897,4,,1)($)
  $7507 Clear the carry flag and set the zero flag if #REGa=0
  $7508 Jump to #R29971 if #REGa>0
  $750A POKE #N(29950,4,,1)($),#REGa
  $750D #REGa=#N(22,2,,1)($)
  $750F CALL #R26476
  $7512 Return
c $7513
  $7513 #REGa=#N(8,2,,1)($)
  $7515 POKE #N(23817,4,,1)($),#REGa
  $7518 #REGhl=#N(29298,4,,1)($)
  $751B POKE #N(23808,4,,1)($),#REGl; POKE #N(23809,4,,1)($),#REGh
  $751E #REGhl=#N(6166,4,,1)($)
  $7521 POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $7524 #REGa=PEEK #N(23897,4,,1)($)
  $7527 CALL #R26360
  $752A #REGa=#N(23,2,,1)($)
  $752C CALL #R26462
  $752F #REGa=PEEK #N(29950,4,,1)($)
  $7532 #REGhl=#N(23897,4,,1)($)
  $7535 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $7536 #REGa=PEEK #REGhl
  $7537 POKE #N(29950,4,,1)($),#REGa
  $753A Return if the carry flag is not set
  $753B #REGa=0
  $753C POKE #N(23851,4,,1)($),#REGa
  $753F CALL #R24874
  $7542 #REGhl=#N(23192,4,,1)($)
  $7545 POKE #N(23853,4,,1)($),#REGl; POKE #N(23854,4,,1)($),#REGh
  $7548 #REGb=#N(7,2,,1)($)
  $754A Push #REGbc onto the stack
  $754B CALL #R26904
  $754E #REGa=#N(7,2,,1)($)
  $7550 CALL #R46526
  $7553 CALL #R26904
  $7556 CALL #R46549
  $7559 Pop last item from stack into #REGbc
  $755A Decrement #REGb and jump to #R30026 if #REGb>0
  $755C Return
b $755D
t $7596
b $75A7
t $75C5
c $75D1
  $75D1 CALL #R26562
  $75D4 POKE #N(23859,4,,1)($),#REGixl; POKE #N(23860,4,,1)($),#REGixh
  $75D8 CALL #R29478
  $75DB Clear the carry flag and set the zero flag if #REGa=0
  $75DC Jump to #R30399 if #REGa>0
  $75DF #REGa=0
  $75E0 POKE #N(23862,4,,1)($),#REGa
  $75E3 #REGa=PEEK (#REGix+#N(5,2,,1)($))
  $75E6 Shift #REGa right (copying bit 0 into the carry flag, and resetting bit 7)
  $75E8 #REGa=#REGa-1
  $75E9 Set the zero flag if #REGa=PEEK (#REGix+#N(6,2,,1)($)), or the carry flag if #REGa<PEEK (#REGix+#N(6,2,,1)($))
  $75EC Jump to #R30399 if #REGa>=PEEK (#REGix+#N(6,2,,1)($))
  $75EF #REGhl=#N(23612,4,,1)($)
  $75F2 #REGb=#N(19,2,,1)($)
  $75F4 #REGa=PEEK #N(23846,4,,1)($)
  $75F7 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $75F8 Jump to #R30399 if #REGa=PEEK #REGhl
  $75FB #REGhl=#REGhl+1
  $75FC Decrement #REGb and jump to #R30199 if #REGb>0
  $75FE #REGl=PEEK #N(23911,4,,1)($); #REGh=PEEK #N(23912,4,,1)($)
  $7601 POKE #REGhl,#REGa
  $7602 #REGhl=#REGhl+1
  $7603 POKE #N(23911,4,,1)($),#REGl; POKE #N(23912,4,,1)($),#REGh
  $7606 CALL #R24128
  $7609 CALL #R26501
  $760C CALL #R27085
  $760F #REGa=#N(25,2,,1)($)
  $7611 CALL #R26462
  $7614 #REGhl=#N(6148,4,,1)($)
  $7617 #REGa=PEEK #N(23846,4,,1)($)
  $761A CALL #R26784
  $761D #REGa=#N(26,2,,1)($)
  $761F CALL #R26476
  $7622 #REGl=PEEK #N(23844,4,,1)($); #REGh=PEEK #N(23845,4,,1)($)
  $7625 POKE #N(23915,4,,1)($),#REGl; POKE #N(23916,4,,1)($),#REGh
  $7628 #REGa=PEEK #N(24055,4,,1)($)
  $762B Clear the carry flag and set the zero flag if #REGa=0
  $762C Jump to #R30278 if #REGa=0
  $762E CALL #R30701
  $7631 #REGa=#N(0,2,,1)($)
  $7633 POKE #N(46866,4,,1)($),#REGa
  $7636 CALL #R30535
  $7639 #REGa=#N(1,2,,1)($)
  $763B POKE #N(46866,4,,1)($),#REGa
  $763E CALL #R29290
  $7641 CALL #R29730
  $7644 Jump to #R30294
c $7646
  $7646 #REGa=PEEK #N(23906,4,,1)($)
  $7649 Clear the carry flag and set the zero flag if #REGa=0
  $764A CALL #R30701 if #REGa=0
  $764D CALL #R30602
  $7650 CALL #R29315
  $7653 CALL #R29730
  $7656 #REGe=PEEK #N(23844,4,,1)($); #REGd=PEEK #N(23845,4,,1)($)
  $765A CALL #R24850
  $765D #REGa=PEEK #N(23846,4,,1)($)
  $7660 POKE #REGhl,#REGa
  $7661 CALL #R28176
  $7664 CALL #R27245
  $7667 CALL #R30711
  $766A #REGa=#N(24,2,,1)($)
  $766C CALL #R26476
  $766F #REGe=PEEK #N(23844,4,,1)($); #REGd=PEEK #N(23845,4,,1)($)
  $7673 POKE #N(23804,4,,1)($),#REGe; POKE #N(23805,4,,1)($),#REGd
  $7677 #REGhl=#N(0,4,,1)($)
  $767A POKE #N(23825,4,,1)($),#REGl; POKE #N(23826,4,,1)($),#REGh
  $767D CALL #R24850
  $7680 POKE #N(23855,4,,1)($),#REGl; POKE #N(23856,4,,1)($),#REGh
  $7683 #REGa=PEEK #N(23846,4,,1)($)
  $7686 POKE #REGhl,#REGa
  $7687 POKE #N(46867,4,,1)($),#REGa
  $768A CALL #R28173
  $768D CALL #R27245
  $7690 #REGa=PEEK (#REGix+#N(23,2,,1)($))
  $7693 Clear the carry flag and set the zero flag if #REGa=0
  $7694 Jump to #R30388 if #REGa=0
  $7696 #REGa=PEEK #N(24055,4,,1)($)
  $7699 Clear the carry flag and set the zero flag if #REGa=0
  $769A Jump to #R30385 if #REGa=0
  $769C CALL #R29290
  $769F CALL #R29730
  $76A2 #REGa=PEEK #N(23897,4,,1)($)
  $76A5 Clear the carry flag and set the zero flag if #REGa=0
  $76A6 Jump to #R30388 if #REGa=0
  $76A8 CALL #R46628
  $76AB #REGixl=PEEK #N(23859,4,,1)($); #REGixh=PEEK #N(23860,4,,1)($)
  $76AF Jump to #R30388
b $76B1
t $76B6
c $76C2
  $76C2 #REGde=#N(3,4,,1)($)
  $76C5 #REGhl=#REGhl+#REGde
  $76C6 POKE #N(23898,4,,1)($),#REGl; POKE #N(23899,4,,1)($),#REGh
  $76C9 Jump to #R30130
b $76CC
t $76DA
c $76EA
  $76EA #REGe=#REGh
  $76EB #REGe=#REGl
  $76EC POKE #N(23846,4,,1)($),#REGa
  $76EF CALL #R26562
  $76F2 POKE #N(23859,4,,1)($),#REGixl; POKE #N(23860,4,,1)($),#REGixh
  $76F6 #REGa=PEEK #N(23906,4,,1)($)
  $76F9 Clear the carry flag and set the zero flag if #REGa=0
  $76FA Return if #REGa=0
  $76FB CALL #R26501
  $76FE CALL #R27085
  $7701 #REGa=#N(27,2,,1)($)
  $7703 CALL #R26462
  $7706 #REGa=#N(26,2,,1)($)
  $7708 CALL #R26476
  $770B CALL #R30701
  $770E CALL #R30602
  $7711 #REGl=PEEK #N(23902,4,,1)($); #REGh=PEEK #N(23903,4,,1)($)
  $7714 POKE #N(23804,4,,1)($),#REGl; POKE #N(23805,4,,1)($),#REGh
  $7717 #REGl=PEEK #N(23904,4,,1)($); #REGh=PEEK #N(23905,4,,1)($)
  $771A POKE #N(23825,4,,1)($),#REGl; POKE #N(23826,4,,1)($),#REGh
  $771D CALL #R30535
  $7720 #REGa=PEEK #N(24055,4,,1)($)
  $7723 Clear the carry flag and set the zero flag if #REGa=0
  $7724 CALL #R29096 if #REGa>0
  $7727 CALL #R27245
  $772A CALL #R30711
  $772D CALL #R28173
  $7730 CALL #R29290
  $7733 #REGa=PEEK (#REGix+#N(8,2,,1)($))
  $7736 Clear the carry flag and set the zero flag if #REGa=0
  $7737 Jump to #R30531 if #REGa=0
  $7739 #REGl=PEEK #N(23855,4,,1)($); #REGh=PEEK #N(23856,4,,1)($)
  $773C #REGa=PEEK #N(23846,4,,1)($)
  $773F POKE #REGhl,#REGa
  $7740 CALL #R27275
  $7743 CALL #R27245
  $7746 Return
c $7747
  $7747 #REGl=PEEK #N(23844,4,,1)($); #REGh=PEEK #N(23845,4,,1)($)
  $774A Push #REGhl onto the stack
  $774B CALL #R29143
  $774E #REGa=#N(1,2,,1)($)
  $7750 #REGhl=#N(46866,4,,1)($)
  $7753 #REGa=#REGa-PEEK #REGhl
  $7754 CALL #R29096
  $7757 #REGhl=#N(23632,4,,1)($)
  $775A #REGb=#N(20,2,,1)($)
  $775C Push #REGbc onto the stack
  $775D Push #REGhl onto the stack
  $775E #REGc=PEEK #REGhl
  $775F #REGa=PEEK #N(46866,4,,1)($)
  $7762 Set the zero flag if #REGa=#REGc, or the carry flag if #REGa<#REGc
  $7763 Jump to #R30585 if #REGa<>#REGc
  $7765 #REGhl=#REGhl+1
  $7766 #REGe=PEEK #REGhl
  $7767 #REGhl=#REGhl+1
  $7768 #REGd=PEEK #REGhl
  $7769 POKE #N(23844,4,,1)($),#REGe; POKE #N(23845,4,,1)($),#REGd
  $776D #REGa=#N(160,2,,1)($)
  $776F #REGa=#REGa-#REGb
  $7770 CALL #R26562
  $7773 CALL #R29290
  $7776 CALL #R29730
  $7779 Pop last item from stack into #REGhl
  $777A #REGde=#N(4,4,,1)($)
  $777D #REGhl=#REGhl+#REGde
  $777E Pop last item from stack into #REGbc
  $777F Decrement #REGb and jump to #R30556 if #REGb>0
  $7781 #REGixl=PEEK #N(23859,4,,1)($); #REGixh=PEEK #N(23860,4,,1)($)
  $7785 Pop last item from stack into #REGhl
  $7786 POKE #N(23844,4,,1)($),#REGl; POKE #N(23845,4,,1)($),#REGh
  $7789 Return
c $778A
  $778A #REGa=PEEK #N(23913,4,,1)($)
  $778D #REGhl=#N(23915,4,,1)($)
  $7790 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $7791 Jump to #R30617 if #REGa<>PEEK #REGhl
  $7793 #REGa=PEEK #N(23914,4,,1)($)
  $7796 #REGhl=#REGhl+1
  $7797 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $7798 Return if #REGa=PEEK #REGhl
  $7799 #REGa=PEEK #N(23913,4,,1)($)
  $779C POKE #N(28819,4,,1)($),#REGa
  $779F POKE #N(28827,4,,1)($),#REGa
  $77A2 #REGa=PEEK #N(23914,4,,1)($)
  $77A5 POKE #N(28817,4,,1)($),#REGa
  $77A8 POKE #N(28825,4,,1)($),#REGa
  $77AB #REGa=PEEK #N(23915,4,,1)($)
  $77AE POKE #N(28823,4,,1)($),#REGa
  $77B1 #REGa=PEEK #N(23916,4,,1)($)
  $77B4 POKE #N(28821,4,,1)($),#REGa
  $77B7 #REGa=0
  $77B8 POKE #N(28820,4,,1)($),#REGa
  $77BB POKE #N(28818,4,,1)($),#REGa
  $77BE POKE #N(28828,4,,1)($),#REGa
  $77C1 POKE #N(28826,4,,1)($),#REGa
  $77C4 POKE #N(28824,4,,1)($),#REGa
  $77C7 POKE #N(28822,4,,1)($),#REGa
  $77CA CALL #R28874
  $77CD CALL #R29032
  $77D0 #REGa=PEEK #N(28827,4,,1)($)
  $77D3 #REGl=#REGa
  $77D4 #REGa=PEEK #N(28825,4,,1)($)
  $77D7 #REGh=#REGa
  $77D8 #REGa=PEEK #N(23915,4,,1)($)
  $77DB Set the zero flag if #REGa=#REGl, or the carry flag if #REGa<#REGl
  $77DC Jump to #R30696 if #REGa<>#REGl
  $77DE #REGa=PEEK #N(23916,4,,1)($)
  $77E1 Set the zero flag if #REGa=#REGh, or the carry flag if #REGa<#REGh
  $77E2 Jump to #R30696 if #REGa<>#REGh
  $77E4 CALL #R28179
  $77E7 Return
c $77E8
  $77E8 CALL #R28179
  $77EB Jump to #R30669
c $77ED
  $77ED #REGa=#N(1,2,,1)($)
  $77EF CALL #R29096
  $77F2 #REGa=0
  $77F3 CALL #R29096
  $77F6 Return
c $77F7
  $77F7 #REGa=PEEK #N(24055,4,,1)($)
  $77FA Clear the carry flag and set the zero flag if #REGa=0
  $77FB Return if #REGa>0
  $77FC Push #REGbc onto the stack
  $77FD CALL #R45256
  $7800 #REGhl=#N(23964,4,,1)($)
  $7803 POKE #REGhl,(PEEK #REGhl)+1
  $7804 #REGa=PEEK #N(23850,4,,1)($)
  $7807 Keep only bit 0 of #REGa
  $7809 Jump to #R30717 if #REGa>0
  $780B #REGa=0
  $780C CALL #R46526
  $780F Pop last item from stack into #REGbc
  $7810 Return
c $7811
  $7811 #REGa=PEEK #N(24055,4,,1)($)
  $7814 Clear the carry flag and set the zero flag if #REGa=0
  $7815 #REGa=#N(4,2,,1)($)
  $7817 CALL #R46526 if the zero flag is set
  $781A CALL #R27580
  $781D CALL #R39446
  $7820 CALL #R28719 if the zero flag is set
  $7823 #REGa=PEEK (#REGix+#N(6,2,,1)($))
  $7826 Clear the carry flag and set the zero flag if #REGa=0
  $7827 Return if #REGa>0
  $7828 CALL #R39446
  $782B Jump to #R28738 if the zero flag is not set
  $782E #REGa=0
  $782F Return
c $7830
  $7830 #REGhl=#N(23632,4,,1)($)
  $7833 #REGde=#N(4,4,,1)($)
  $7836 #REGb=#N(20,2,,1)($)
  $7838 Push #REGhl onto the stack
  $7839 #REGa=PEEK #REGhl
  $783A Set the zero flag if #REGa=#N(3,2,,1)($), or the carry flag if #REGa<#N(3,2,,1)($)
  $783C Jump to #R30808 if #REGa=#N(3,2,,1)($)
  $783E #REGhl=#REGhl+1
  $783F #REGa=PEEK #N(23866,4,,1)($)
  $7842 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $7843 Jump to #R30808 if #REGa<>PEEK #REGhl
  $7845 #REGa=PEEK #N(23867,4,,1)($)
  $7848 #REGhl=#REGhl+1
  $7849 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $784A Jump to #R30808 if #REGa<>PEEK #REGhl
  $784C #REGa=#N(160,2,,1)($)
  $784E #REGa=#REGa-#REGb
  $784F #REGl=PEEK #N(23870,4,,1)($); #REGh=PEEK #N(23871,4,,1)($)
  $7852 POKE #REGhl,#REGa
  $7853 Pop last item from stack into #REGhl
  $7854 CALL #R24874
  $7857 Return
c $7858
  $7858 Pop last item from stack into #REGhl
  $7859 #REGhl=#REGhl+#REGde
  $785A Decrement #REGb and jump to #R30776 if #REGb>0
  $785C Return
c $785D
  $785D Push #REGix onto the stack
  $785F #REGhl=#N(23417,4,,1)($)
  $7862 #REGde=#N(23418,4,,1)($)
  $7865 POKE #REGhl,#N(0,2,,1)($)
  $7867 #REGbc=#N(29,4,,1)($)
  $786A POKE #REGde,PEEK #REGhl; #REGhl=#REGhl+1; #REGde=#REGde+1; #REGbc=#REGbc-1; repeat until #REGbc=0
  $786C #REGa=0
  $786D POKE #N(23951,4,,1)($),#REGa
  $7870 #REGhl=#N(23417,4,,1)($)
  $7873 POKE #N(23917,4,,1)($),#REGl; POKE #N(23918,4,,1)($),#REGh
  $7876 #REGixl=PEEK #N(46890,4,,1)($); #REGixh=PEEK #N(46891,4,,1)($)
  $787A #REGa=PEEK #N(46649,4,,1)($)
  $787D #REGb=#REGa
  $787E #REGde=#N(6,4,,1)($)
  $7881 #REGa=PEEK #N(23846,4,,1)($)
  $7884 Set the zero flag if #REGa=PEEK (#REGix+#N(5,2,,1)($)), or the carry flag if #REGa<PEEK (#REGix+#N(5,2,,1)($))
  $7887 Jump to #R30884 if #REGa<>PEEK (#REGix+#N(5,2,,1)($))
  $7889 #REGl=PEEK #N(23917,4,,1)($); #REGh=PEEK #N(23918,4,,1)($)
  $788C #REGa=PEEK #N(46649,4,,1)($)
  $788F #REGa=#REGa+1
  $7890 #REGa=#REGa-#REGb
  $7891 POKE #REGhl,#REGa
  $7892 #REGhl=#REGhl+1
  $7893 #REGa=PEEK (#REGix+#N(0,2,,1)($))
  $7896 POKE #REGhl,#REGa
  $7897 #REGhl=#REGhl+1
  $7898 #REGa=PEEK (#REGix+#N(4,2,,1)($))
  $789B POKE #REGhl,#REGa
  $789C #REGhl=#REGhl+1
  $789D POKE #N(23917,4,,1)($),#REGl; POKE #N(23918,4,,1)($),#REGh
  $78A0 #REGhl=#N(23951,4,,1)($)
  $78A3 POKE #REGhl,(PEEK #REGhl)+1
  $78A4 #REGix=#REGix+#REGde
  $78A6 Decrement #REGb and jump to #R30849 if #REGb>0
  $78A8 Pop last item from stack into #REGix
  $78AA Return
c $78AB
  $78AB #REGb=#N(10,2,,1)($)
  $78AD #REGhl=#N(23418,4,,1)($)
  $78B0 #REGde=#N(3,4,,1)($)
  $78B3 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $78B4 Jump to #R30909 if #REGa=PEEK #REGhl
  $78B6 #REGhl=#REGhl+#REGde
  $78B7 Decrement #REGb and jump to #R30899 if #REGb>0
  $78B9 #REGa=#N(1,2,,1)($)
  $78BB Clear the carry flag and set the zero flag if #REGa=0
  $78BC Return
c $78BD
  $78BD #REGhl=#REGhl-1
  $78BE POKE #N(23919,4,,1)($),#REGl; POKE #N(23920,4,,1)($),#REGh
  $78C1 Return
c $78C2
  $78C2 Push #REGaf onto the stack
  $78C3 CALL #R27152
  $78C6 Pop last item from stack into #REGaf
  $78C7 #REGa=#REGa+#N(28,2,,1)($)
  $78C9 CALL #R25943
  $78CC Return
c $78CD
  $78CD #REGl=PEEK #N(23844,4,,1)($); #REGh=PEEK #N(23845,4,,1)($)
  $78D0 CALL #R32159
  $78D3 #REGa=PEEK #N(23951,4,,1)($)
  $78D6 POKE #N(23921,4,,1)($),#REGa
  $78D9 CALL #R30813
  $78DC #REGa=PEEK (#REGix+#N(33,2,,1)($))
  $78DF CALL #R28276
  $78E2 CALL #R27118
  $78E5 #REGa=#N(10,2,,1)($)
  $78E7 POKE #N(23817,4,,1)($),#REGa
  $78EA #REGa=0
  $78EB CALL #R30914
  $78EE #REGa=PEEK (#REGix+#N(22,2,,1)($))
  $78F1 Set the zero flag if #REGa=#N(140,2,,1)($), or the carry flag if #REGa<#N(140,2,,1)($)
  $78F3 Jump to #R31142 if #REGa>=#N(140,2,,1)($)
  $78F6 #REGa=PEEK (#REGix+#N(23,2,,1)($))
  $78F9 Clear the carry flag and set the zero flag if #REGa=0
  $78FA #REGa=#N(1,2,,1)($)
  $78FC CALL #R30914 if the zero flag is not set
  $78FF Set the zero flag if bit 2 of (#REGix+#N(37,2,,1)($)) is 0
  $7903 Jump to #R31014 if bit 2 of PEEK (#REGix+#N(37,2,,1)($)) is set
  $7905 #REGa=PEEK #N(23417,4,,1)($)
  $7908 Clear the carry flag and set the zero flag if #REGa=0
  $7909 #REGa=#N(2,2,,1)($)
  $790B CALL #R30914 if the zero flag is not set
  $790E Set the zero flag if bit 1 of (#REGix+#N(37,2,,1)($)) is 0
  $7912 Jump to #R31014 if bit 1 of PEEK (#REGix+#N(37,2,,1)($)) is set
  $7914 #REGa=PEEK #N(23921,4,,1)($)
  $7917 Clear the carry flag and set the zero flag if #REGa=0
  $7918 #REGa=#N(3,2,,1)($)
  $791A CALL #R30914 if the zero flag is not set
  $791D #REGa=PEEK (#REGix+#N(23,2,,1)($))
  $7920 Clear the carry flag and set the zero flag if #REGa=0
  $7921 #REGa=#N(4,2,,1)($)
  $7923 CALL #R30914 if the zero flag is not set
  $7926 #REGa=PEEK (#REGix+#N(35,2,,1)($))
  $7929 Clear the carry flag and set the zero flag if #REGa=0
  $792A Jump to #R31064 if #REGa=0
  $792C CALL #R26591
  $792F POKE #N(24002,4,,1)($),#REGixl; POKE #N(24003,4,,1)($),#REGixh
  $7933 Set the zero flag if bit 1 of (#REGix+#N(0,2,,1)($)) is 0
  $7937 Jump to #R31044 if bit 1 of PEEK (#REGix+#N(0,2,,1)($)) is reset
  $7939 #REGa=PEEK (#REGix+#N(16,2,,1)($))
  $793C CALL #R30891
  $793F #REGa=#N(5,2,,1)($)
  $7941 CALL #R30914 if the zero flag is set
  $7944 Set the zero flag if bit 3 of (#REGix+#N(0,2,,1)($)) is 0
  $7948 Jump to #R31064 if bit 3 of PEEK (#REGix+#N(0,2,,1)($)) is reset
  $794A #REGixl=PEEK #N(23859,4,,1)($); #REGixh=PEEK #N(23860,4,,1)($)
  $794E #REGa=PEEK (#REGix+#N(36,2,,1)($))
  $7951 Set the zero flag if #REGa=#N(255,2,,1)($), or the carry flag if #REGa<#N(255,2,,1)($)
  $7953 #REGa=#N(6,2,,1)($)
  $7955 CALL #R30914 if the zero flag is set
  $7958 #REGixl=PEEK #N(23859,4,,1)($); #REGixh=PEEK #N(23860,4,,1)($)
  $795C #REGe=PEEK #N(23866,4,,1)($); #REGd=PEEK #N(23867,4,,1)($)
  $7960 CALL #R24850
  $7963 POKE #N(23870,4,,1)($),#REGl; POKE #N(23871,4,,1)($),#REGh
  $7966 #REGa=PEEK #REGhl
  $7967 Set the zero flag if #REGa=#N(110,2,,1)($), or the carry flag if #REGa<#N(110,2,,1)($)
  $7969 Jump to #R31137 if #REGa>=#N(110,2,,1)($)
  $796B CALL #R26615
  $796E #REGa=PEEK (#REGiy+#N(8,2,,1)($))
  $7971 Set the zero flag if #REGa=#N(1,2,,1)($), or the carry flag if #REGa<#N(1,2,,1)($)
  $7973 Jump to #R31109 if #REGa<>#N(1,2,,1)($)
  $7975 #REGa=#N(7,2,,1)($)
  $7977 CALL #R30914
  $797A #REGa=PEEK (#REGix+#N(35,2,,1)($))
  $797D Set the zero flag if #REGa=PEEK (#REGiy+#N(10,2,,1)($)), or the carry flag if #REGa<PEEK (#REGiy+#N(10,2,,1)($))
  $7980 #REGa=#N(8,2,,1)($)
  $7982 CALL #R30914 if the zero flag is set
  $7985 #REGa=PEEK (#REGiy+#N(8,2,,1)($))
  $7988 Set the zero flag if #REGa=#N(2,2,,1)($), or the carry flag if #REGa<#N(2,2,,1)($)
  $798A #REGa=#N(9,2,,1)($)
  $798C CALL #R30914 if the zero flag is set
  $798F #REGa=PEEK (#REGiy+#N(8,2,,1)($))
  $7992 Set the zero flag if #REGa=#N(3,2,,1)($), or the carry flag if #REGa<#N(3,2,,1)($)
  $7994 Jump to #R31137 if #REGa<>#N(3,2,,1)($)
  $7996 #REGa=PEEK (#REGix+#N(35,2,,1)($))
  $7999 Set the zero flag if #REGa=PEEK (#REGiy+#N(9,2,,1)($)), or the carry flag if #REGa<PEEK (#REGiy+#N(9,2,,1)($))
  $799C #REGa=#N(10,2,,1)($)
  $799E CALL #R30914 if the zero flag is set
  $79A1 #REGa=#N(11,2,,1)($)
  $79A3 CALL #R30914
  $79A6 #REGa=#N(12,2,,1)($)
  $79A8 CALL #R30914
  $79AB CALL #R46643
  $79AE CALL #R27245
  $79B1 CALL #R26820
  $79B4 #REGhl=#N(31185,4,,1)($)
  $79B7 CALL #R27167
  $79BA #REGa=PEEK (#REGix+#N(8,2,,1)($))
  $79BD Clear the carry flag and set the zero flag if #REGa=0
  $79BE Return if #REGa=0
  $79BF CALL #R29290
  $79C2 CALL #R29730
  $79C5 #REGa=PEEK (#REGix+#N(6,2,,1)($))
  $79C8 Clear the carry flag and set the zero flag if #REGa=0
  $79C9 Return if #REGa=0
  $79CA CALL #R27275
  $79CD CALL #R24874
  $79D0 Return
b $79D1
c $79DB
  $79DB #REGbc=#N(17053,4,,1)($)
  $79DE #REGa=#REGa-carry-#REGh
  $79DF CALL #R48
  $79E0 #REGa=#REGc
  $79E1 #REGhl=#REGhl+#REGde
  $79E2 #REGa=#REGd
  $79E3 CALL #R48
  $79E4 #REGa=#REGc
  $79E5 #REGhl=#REGhl+#REGde
  $79E6 #REGa=#REGd
  $79E7 #REGa=#REGa-#REGl
  $79E8 #REGa=#REGa+#REGh
  $79E9 Set bits 0, 3, 4, 5 and 6 of #REGa
  $79EB POKE #REGhl,#N(182,2,,1)($)
  $79ED CALL #R39446
  $79F0 Jump to #R28738 if the zero flag is not set
  $79F3 Pop last item from stack into #REGhl
  $79F4 #REGa=0
  $79F5 Return
c $79F6
  $79F6 Return
c $79F7
  $79F7 #REGa=PEEK (#REGix+#N(5,2,,1)($))
  $79FA #REGb=#N(5,2,,1)($)
  $79FC CALL #R27417
  $79FF #REGb=#REGc
  $7A00 CALL #R27982
  $7A03 Return if the carry flag is set
  $7A04 #REGa=PEEK #N(23861,4,,1)($)
  $7A07 POKE (#REGix+#N(6,2,,1)($)),#REGa
  $7A0A #REGa=PEEK (#REGiy+#N(9,2,,1)($))
  $7A0D #REGl=PEEK #N(23870,4,,1)($); #REGh=PEEK #N(23871,4,,1)($)
  $7A10 POKE #REGhl,#REGa
  $7A11 #REGa=PEEK #N(23862,4,,1)($)
  $7A14 Clear the carry flag and set the zero flag if #REGa=0
  $7A15 CALL #R24874 if #REGa=0
  $7A18 Return
c $7A19
  $7A19 #REGa=PEEK (#REGix+#N(5,2,,1)($))
  $7A1C #REGb=#N(4,2,,1)($)
  $7A1E CALL #R27417
  $7A21 #REGb=#REGc
  $7A22 CALL #R27982
  $7A25 Return if the carry flag is set
  $7A26 #REGa=PEEK #N(23861,4,,1)($)
  $7A29 POKE (#REGix+#N(6,2,,1)($)),#REGa
  $7A2C #REGa=PEEK (#REGiy+#N(11,2,,1)($))
  $7A2F #REGl=PEEK #N(23870,4,,1)($); #REGh=PEEK #N(23871,4,,1)($)
  $7A32 POKE #REGhl,#REGa
  $7A33 CALL #R24874
  $7A36 Return
c $7A37
  $7A37 #REGa=PEEK (#REGix+#N(5,2,,1)($))
  $7A3A #REGb=#N(4,2,,1)($)
  $7A3C CALL #R27417
  $7A3F #REGb=#REGc
  $7A40 CALL #R27982
  $7A43 Return if the carry flag is set
  $7A44 CALL #R24620
  $7A47 #REGa=#N(41,2,,1)($)
  $7A49 CALL #R26476
  $7A4C CALL #R30813
  $7A4F CALL #R31433
  $7A52 #REGa=PEEK (#REGix+#N(23,2,,1)($))
  $7A55 Clear the carry flag and set the zero flag if #REGa=0
  $7A56 Jump to #R31334 if #REGa=0
  $7A58 #REGb=#N(0,2,,1)($)
  $7A5A #REGhl=#N(23414,4,,1)($)
  $7A5D #REGde=#N(3,4,,1)($)
  $7A60 #REGb=#REGb+1
  $7A61 #REGhl=#REGhl+#REGde
  $7A62 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $7A63 Jump to #R31328 if #REGa<>PEEK #REGhl
  $7A65 #REGa=#REGb
  $7A66 #REGhl=#N(23922,4,,1)($)
  $7A69 POKE #REGhl,#REGa
  $7A6A CALL #R31719
  $7A6D CALL #R27245
  $7A70 CALL #R31637
  $7A73 #REGa=PEEK #N(23922,4,,1)($)
  $7A76 Clear the carry flag and set the zero flag if #REGa=0
  $7A77 Jump to #R31385 if #REGa>0
  $7A79 Set the zero flag if #REGa=PEEK (#REGix+#N(23,2,,1)($)), or the carry flag if #REGa<PEEK (#REGix+#N(23,2,,1)($))
  $7A7C Jump to #R31420 if #REGa=PEEK (#REGix+#N(23,2,,1)($))
  $7A7E #REGa=PEEK #N(23861,4,,1)($)
  $7A81 POKE (#REGix+#N(6,2,,1)($)),#REGa
  $7A84 #REGa=PEEK #N(27981,4,,1)($)
  $7A87 #REGa=#REGa+PEEK (#REGix+#N(34,2,,1)($))
  $7A8A POKE (#REGix+#N(34,2,,1)($)),#REGa
  $7A8D #REGa=0
  $7A8E POKE (#REGix+#N(23,2,,1)($)),#REGa
  $7A91 POKE (#REGix+#N(35,2,,1)($)),#REGa
  $7A94 POKE (#REGix+#N(36,2,,1)($)),#REGa
  $7A97 Jump to #R31420
c $7A99
  $7A99 #REGa=#REGa-1
  $7A9A #REGe=#REGa
  $7A9B #REGd=#N(0,2,,1)($)
  $7A9D #REGhl=#N(23417,4,,1)($)
  $7AA0 #REGhl=#REGhl+#REGde
  $7AA1 #REGhl=#REGhl+#REGde
  $7AA2 #REGhl=#REGhl+#REGde
  $7AA3 #REGa=PEEK #REGhl
  $7AA4 Set the zero flag if #REGa=PEEK (#REGix+#N(23,2,,1)($)), or the carry flag if #REGa<PEEK (#REGix+#N(23,2,,1)($))
  $7AA7 Jump to #R31420 if #REGa=PEEK (#REGix+#N(23,2,,1)($))
  $7AA9 POKE (#REGix+#N(23,2,,1)($)),#REGa
  $7AAC #REGhl=#REGhl+1
  $7AAD #REGa=PEEK #REGhl
  $7AAE POKE (#REGix+#N(35,2,,1)($)),#REGa
  $7AB1 #REGhl=#REGhl+1
  $7AB2 #REGa=PEEK #REGhl
  $7AB3 POKE (#REGix+#N(36,2,,1)($)),#REGa
  $7AB6 #REGa=PEEK #N(23861,4,,1)($)
  $7AB9 POKE (#REGix+#N(6,2,,1)($)),#REGa
  $7ABC CALL #R24620
  $7ABF CALL #R26501
  $7AC2 CALL #R27920
  $7AC5 CALL #R24874
  $7AC8 Return
c $7AC9
  $7AC9 Push #REGix onto the stack
  $7ACB #REGhl=#N(772,4,,1)($)
  $7ACE POKE #N(23813,4,,1)($),#REGl; POKE #N(23814,4,,1)($),#REGh
  $7AD1 #REGhl=#N(23418,4,,1)($)
  $7AD4 POKE #N(23949,4,,1)($),#REGl; POKE #N(23950,4,,1)($),#REGh
  $7AD7 #REGa=PEEK #N(23951,4,,1)($)
  $7ADA #REGb=#REGa
  $7ADB Push #REGbc onto the stack
  $7ADC #REGa=#N(9,2,,1)($)
  $7ADE POKE #N(23817,4,,1)($),#REGa
  $7AE1 #REGl=PEEK #N(46882,4,,1)($); #REGh=PEEK #N(46883,4,,1)($)
  $7AE4 POKE #N(23839,4,,1)($),#REGl; POKE #N(23840,4,,1)($),#REGh
  $7AE7 #REGl=PEEK #N(46884,4,,1)($); #REGh=PEEK #N(46885,4,,1)($)
  $7AEA POKE #N(23815,4,,1)($),#REGl; POKE #N(23816,4,,1)($),#REGh
  $7AED #REGl=PEEK #N(23949,4,,1)($); #REGh=PEEK #N(23950,4,,1)($)
  $7AF0 #REGa=PEEK #REGhl
  $7AF1 #REGl=PEEK #N(23813,4,,1)($); #REGh=PEEK #N(23814,4,,1)($)
  $7AF4 #REGh=#REGh-1
  $7AF5 #REGh=#REGh-1
  $7AF6 POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $7AF9 CALL #R24942
  $7AFC #REGhl=#N(17926,4,,1)($)
  $7AFF POKE #N(23808,4,,1)($),#REGl; POKE #N(23809,4,,1)($),#REGh
  $7B02 #REGl=PEEK #N(23949,4,,1)($); #REGh=PEEK #N(23950,4,,1)($)
  $7B05 #REGa=PEEK #REGhl
  $7B06 #REGa=#REGa+1
  $7B07 CALL #R25943
  $7B0A #REGhl=#N(17669,4,,1)($)
  $7B0D POKE #N(23808,4,,1)($),#REGl; POKE #N(23809,4,,1)($),#REGh
  $7B10 #REGl=PEEK #N(23813,4,,1)($); #REGh=PEEK #N(23814,4,,1)($)
  $7B13 #REGde=#N(4608,4,,1)($)
  $7B16 #REGhl=#REGhl+#REGde
  $7B17 POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $7B1A POKE #N(23813,4,,1)($),#REGl; POKE #N(23814,4,,1)($),#REGh
  $7B1D #REGl=PEEK #N(23949,4,,1)($); #REGh=PEEK #N(23950,4,,1)($)
  $7B20 #REGa=PEEK #REGhl
  $7B21 CALL #R26591
  $7B24 Set the zero flag if bit 1 of (#REGix+#N(0,2,,1)($)) is 0
  $7B28 Jump to #R31564 if bit 1 of PEEK (#REGix+#N(0,2,,1)($)) is set
  $7B2A Set the zero flag if bit 5 of (#REGix+#N(0,2,,1)($)) is 0
  $7B2E Jump to #R31564 if bit 5 of PEEK (#REGix+#N(0,2,,1)($)) is set
  $7B30 Set the zero flag if bit 3 of (#REGix+#N(0,2,,1)($)) is 0
  $7B34 Jump to #R31572 if bit 3 of PEEK (#REGix+#N(0,2,,1)($)) is reset
  $7B36 #REGhl=#N(18183,4,,1)($)
  $7B39 POKE #N(23808,4,,1)($),#REGl; POKE #N(23809,4,,1)($),#REGh
  $7B3C #REGl=PEEK #N(23949,4,,1)($); #REGh=PEEK #N(23950,4,,1)($)
  $7B3F #REGhl=#REGhl+1
  $7B40 #REGa=PEEK #REGhl
  $7B41 Set the zero flag if #REGa=#N(255,2,,1)($), or the carry flag if #REGa<#N(255,2,,1)($)
  $7B43 Jump to #R31569 if #REGa<>#N(255,2,,1)($)
  $7B45 #REGa=#N(102,2,,1)($)
  $7B47 CALL #R26462
  $7B4A Jump to #R31572
c $7B4C
  $7B4C #REGl=PEEK #N(23949,4,,1)($); #REGh=PEEK #N(23950,4,,1)($)
  $7B4F #REGhl=#REGhl+1
  $7B50 #REGa=PEEK #REGhl
  $7B51 CALL #R26360
  $7B54 #REGhl=#N(17219,4,,1)($)
  $7B57 POKE #N(23808,4,,1)($),#REGl; POKE #N(23809,4,,1)($),#REGh
  $7B5A #REGa=#N(25,2,,1)($)
  $7B5C POKE #N(23807,4,,1)($),#REGa
  $7B5F #REGa=PEEK (#REGix+#N(1,2,,1)($))
  $7B62 CALL #R26360
  $7B65 #REGhl=#N(16962,4,,1)($)
  $7B68 POKE #N(23808,4,,1)($),#REGl; POKE #N(23809,4,,1)($),#REGh
  $7B6B #REGa=#N(29,2,,1)($)
  $7B6D POKE #N(23807,4,,1)($),#REGa
  $7B70 #REGa=PEEK (#REGix+#N(2,2,,1)($))
  $7B73 CALL #R26360
  $7B76 #REGa=PEEK #N(23813,4,,1)($)
  $7B79 #REGa=#REGa+#N(2,2,,1)($)
  $7B7B POKE #N(23813,4,,1)($),#REGa
  $7B7E #REGa=#N(3,2,,1)($)
  $7B80 POKE #N(23814,4,,1)($),#REGa
  $7B83 #REGde=#N(3,4,,1)($)
  $7B86 #REGl=PEEK #N(23949,4,,1)($); #REGh=PEEK #N(23950,4,,1)($)
  $7B89 #REGhl=#REGhl+#REGde
  $7B8A POKE #N(23949,4,,1)($),#REGl; POKE #N(23950,4,,1)($),#REGh
  $7B8D Pop last item from stack into #REGbc
  $7B8E #REGb=#REGb-1
  $7B8F Jump to #R31451 if #REGb>0
  $7B92 Pop last item from stack into #REGix
  $7B94 Return
c $7B95
  $7B95 CALL #R45256
  $7B98 #REGa=PEEK #N(23850,4,,1)($)
  $7B9B Set the zero flag if bit 0 of #REGa is 0
  $7B9D Jump to #R31652 if bit 0 of #REGa is set
  $7B9F #REGa=#N(2,2,,1)($)
  $7BA1 Jump to #R46526
c $7BA4
  $7BA4 Set the zero flag if bit 2 of #REGa is 0
  $7BA6 Jump to #R31673 if bit 2 of #REGa is set
  $7BA8 CALL #R31710
  $7BAB #REGhl=#N(23922,4,,1)($)
  $7BAE POKE #REGhl,(PEEK #REGhl)+1
  $7BAF #REGa=PEEK #N(23951,4,,1)($)
  $7BB2 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $7BB3 Jump to #R31697 if #REGa>=PEEK #REGhl
  $7BB5 POKE #REGhl,#N(0,2,,1)($)
  $7BB7 Jump to #R31697
c $7BB9
  $7BB9 Set the zero flag if bit 1 of #REGa is 0
  $7BBB Jump to #R31705 if bit 1 of #REGa is set
  $7BBD CALL #R31710
  $7BC0 #REGa=PEEK #N(23922,4,,1)($)
  $7BC3 #REGa=#REGa-1
  $7BC4 POKE #N(23922,4,,1)($),#REGa
  $7BC7 Set the zero flag if #REGa=#N(255,2,,1)($), or the carry flag if #REGa<#N(255,2,,1)($)
  $7BC9 Jump to #R31697 if #REGa<>#N(255,2,,1)($)
  $7BCB #REGa=PEEK #N(23951,4,,1)($)
  $7BCE POKE #N(23922,4,,1)($),#REGa
  $7BD1 #REGa=#N(1,2,,1)($)
  $7BD3 CALL #R46526
  $7BD6 CALL #R31719
  $7BD9 CALL #R26321
  $7BDC Jump to #R31637
c $7BDE
  $7BDE CALL #R31734
  $7BE1 #REGa=#N(32,2,,1)($)
  $7BE3 CALL #R25847
  $7BE6 Return
c $7BE7
  $7BE7 CALL #R31734
  $7BEA #REGhl=#N(18247,4,,1)($)
  $7BED POKE #N(23808,4,,1)($),#REGl; POKE #N(23809,4,,1)($),#REGh
  $7BF0 #REGa=#N(58,2,,1)($)
  $7BF2 CALL #R25847
  $7BF5 Return
c $7BF6
  $7BF6 #REGa=PEEK #N(23922,4,,1)($)
  $7BF9 Shift #REGa left (copying bit 7 into the carry flag, and resetting bit 0)
  $7BFB #REGa=#REGa+#N(2,2,,1)($)
  $7BFD POKE #N(23806,4,,1)($),#REGa
  $7C00 #REGa=0
  $7C01 POKE #N(23807,4,,1)($),#REGa
  $7C04 Return
c $7C05
  $7C05 #REGa=#N(1,2,,1)($)
  $7C07 POKE #N(23952,4,,1)($),#REGa
  $7C0A #REGa=PEEK (#REGix+#N(5,2,,1)($))
  $7C0D #REGb=#N(10,2,,1)($)
  $7C0F CALL #R27417
  $7C12 #REGb=#REGc
  $7C13 CALL #R27982
  $7C16 Return if the carry flag is set
  $7C17 #REGl=PEEK #N(23844,4,,1)($); #REGh=PEEK #N(23845,4,,1)($)
  $7C1A POKE #N(23866,4,,1)($),#REGl; POKE #N(23867,4,,1)($),#REGh
  $7C1D CALL #R27466
  $7C20 #REGa=PEEK (#REGix+#N(23,2,,1)($))
  $7C23 CALL #R26763
  $7C26 #REGa=PEEK #N(23843,4,,1)($)
  $7C29 POKE (#REGiy+#N(3,2,,1)($)),#REGa
  $7C2C #REGa=PEEK (#REGix+#N(35,2,,1)($))
  $7C2F POKE #N(24039,4,,1)($),#REGa
  $7C32 #REGa=0
  $7C33 POKE (#REGix+#N(23,2,,1)($)),#REGa
  $7C36 POKE (#REGix+#N(35,2,,1)($)),#REGa
  $7C39 POKE (#REGix+#N(36,2,,1)($)),#REGa
  $7C3C #REGl=PEEK #N(23844,4,,1)($); #REGh=PEEK #N(23845,4,,1)($)
  $7C3F POKE (#REGiy+#N(1,2,,1)($)),#REGl
  $7C42 POKE (#REGiy+#N(2,2,,1)($)),#REGh
  $7C45 #REGa=0
  $7C46 POKE (#REGiy+#N(5,2,,1)($)),#REGa
  $7C49 #REGa=PEEK #N(23843,4,,1)($)
  $7C4C CALL #R26615
  $7C4F #REGa=PEEK (#REGiy+#N(8,2,,1)($))
  $7C52 Set the zero flag if #REGa=#N(9,2,,1)($), or the carry flag if #REGa<#N(9,2,,1)($)
  $7C54 Jump to #R31879 if #REGa<>#N(9,2,,1)($)
  $7C56 #REGa=PEEK #N(23952,4,,1)($)
  $7C59 Clear the carry flag and set the zero flag if #REGa=0
  $7C5A Jump to #R31879 if #REGa>0
  $7C5C #REGa=PEEK #N(24039,4,,1)($)
  $7C5F CALL #R26591
  $7C62 #REGa=PEEK (#REGix+#N(2,2,,1)($))
  $7C65 Set the zero flag if #REGa=PEEK (#REGiy+#N(9,2,,1)($)), or the carry flag if #REGa<PEEK (#REGiy+#N(9,2,,1)($))
  $7C68 Jump to #R31879 if #REGa>=PEEK (#REGiy+#N(9,2,,1)($))
  $7C6A CALL #R27118
  $7C6D #REGa=#N(87,2,,1)($)
  $7C6F CALL #R26462
  $7C72 #REGa=0
  $7C73 CALL #R27152
  $7C76 #REGa=#N(1,2,,1)($)
  $7C78 CALL #R27152
  $7C7B CALL #R27245
  $7C7E CALL #R26820
  $7C81 #REGa=PEEK #N(23851,4,,1)($)
  $7C84 Clear the carry flag and set the zero flag if #REGa=0
  $7C85 Jump to #R31896 if #REGa>0
  $7C87 #REGa=0
  $7C88 POKE #N(23952,4,,1)($),#REGa
  $7C8B #REGl=PEEK #N(23844,4,,1)($); #REGh=PEEK #N(23845,4,,1)($)
  $7C8E CALL #R32328
  $7C91 #REGixl=PEEK #N(23859,4,,1)($); #REGixh=PEEK #N(23860,4,,1)($)
  $7C95 POKE (#REGix+#N(22,2,,1)($)),#REGa
  $7C98 #REGixl=PEEK #N(23859,4,,1)($); #REGixh=PEEK #N(23860,4,,1)($)
  $7C9C #REGa=PEEK #N(23861,4,,1)($)
  $7C9F POKE (#REGix+#N(6,2,,1)($)),#REGa
  $7CA2 CALL #R32402
  $7CA5 CALL #R27920
  $7CA8 CALL #R24874
  $7CAB Return
c $7CAC
  $7CAC #REGa=PEEK (#REGix+#N(23,2,,1)($))
  $7CAF #REGb=#N(4,2,,1)($)
  $7CB1 Clear the carry flag and set the zero flag if #REGa=0
  $7CB2 Jump to #R31926 if #REGa=0
  $7CB4 #REGb=#N(2,2,,1)($)
  $7CB6 #REGa=PEEK (#REGix+#N(5,2,,1)($))
  $7CB9 CALL #R27417
  $7CBC #REGb=#REGc
  $7CBD CALL #R27982
  $7CC0 Return if the carry flag is set
  $7CC1 CALL #R24620
  $7CC4 #REGa=#N(42,2,,1)($)
  $7CC6 CALL #R26476
  $7CC9 #REGl=PEEK #N(23844,4,,1)($); #REGh=PEEK #N(23845,4,,1)($)
  $7CCC CALL #R32159
  $7CCF CALL #R31433
  $7CD2 CALL #R32267
  $7CD5 #REGa=0
  $7CD6 POKE #N(23922,4,,1)($),#REGa
  $7CD9 CALL #R31719
  $7CDC CALL #R27245
  $7CDF CALL #R31637
  $7CE2 #REGa=PEEK #N(23922,4,,1)($)
  $7CE5 Clear the carry flag and set the zero flag if #REGa=0
  $7CE6 Jump to #R32116 if #REGa=0
  $7CE9 #REGa=#REGa-1
  $7CEA #REGe=#REGa
  $7CEB #REGd=#N(0,2,,1)($)
  $7CED #REGhl=#N(23417,4,,1)($)
  $7CF0 #REGhl=#REGhl+#REGde
  $7CF1 #REGhl=#REGhl+#REGde
  $7CF2 #REGhl=#REGhl+#REGde
  $7CF3 #REGa=PEEK #REGhl
  $7CF4 POKE #N(23922,4,,1)($),#REGa
  $7CF7 CALL #R26763
  $7CFA #REGa=PEEK (#REGiy+#N(0,2,,1)($))
  $7CFD CALL #R26591
  $7D00 #REGa=PEEK (#REGix+#N(1,2,,1)($))
  $7D03 #REGb=PEEK (#REGix+#N(2,2,,1)($))
  $7D06 #REGhl=#N(23953,4,,1)($)
  $7D09 #REGa=#REGa+PEEK #REGhl
  $7D0A Jump to #R32129 if the carry flag is set
  $7D0C #REGa=#REGa-1
  $7D0D Shift #REGa right (copying bit 0 into the carry flag, and resetting bit 7)
  $7D0F #REGixl=PEEK #N(23859,4,,1)($); #REGixh=PEEK #N(23860,4,,1)($)
  $7D13 Set the zero flag if #REGa=PEEK (#REGix+#N(20,2,,1)($)), or the carry flag if #REGa<PEEK (#REGix+#N(20,2,,1)($))
  $7D16 Jump to #R32129 if #REGa>=PEEK (#REGix+#N(20,2,,1)($))
  $7D18 #REGa=#REGb
  $7D19 #REGhl=#N(23954,4,,1)($)
  $7D1C #REGa=#REGa+PEEK #REGhl
  $7D1D Jump to #R32144 if the carry flag is set
  $7D1F #REGa=#REGa-1
  $7D20 Set the zero flag if #REGa=PEEK (#REGix+#N(38,2,,1)($)), or the carry flag if #REGa<PEEK (#REGix+#N(38,2,,1)($))
  $7D23 Jump to #R32144 if #REGa>=PEEK (#REGix+#N(38,2,,1)($))
  $7D25 #REGa=PEEK #N(23922,4,,1)($)
  $7D28 POKE (#REGix+#N(23,2,,1)($)),#REGa
  $7D2B #REGa=PEEK #N(23846,4,,1)($)
  $7D2E POKE (#REGiy+#N(5,2,,1)($)),#REGa
  $7D31 #REGa=PEEK (#REGiy+#N(0,2,,1)($))
  $7D34 POKE (#REGix+#N(35,2,,1)($)),#REGa
  $7D37 #REGa=PEEK (#REGiy+#N(4,2,,1)($))
  $7D3A POKE (#REGix+#N(36,2,,1)($)),#REGa
  $7D3D #REGa=PEEK #N(23861,4,,1)($)
  $7D40 POKE (#REGix+#N(6,2,,1)($)),#REGa
  $7D43 #REGa=PEEK #N(27981,4,,1)($)
  $7D46 #REGa=#REGa+PEEK (#REGix+#N(34,2,,1)($))
  $7D49 POKE (#REGix+#N(34,2,,1)($)),#REGa
  $7D4C CALL #R32402
  $7D4F #REGa=PEEK #N(23843,4,,1)($)
  $7D52 POKE (#REGix+#N(22,2,,1)($)),#REGa
  $7D55 #REGl=PEEK #N(23844,4,,1)($); #REGh=PEEK #N(23845,4,,1)($)
  $7D58 CALL #R32328
  $7D5B Jump to #R32116 if the zero flag is set
  $7D5D POKE (#REGix+#N(22,2,,1)($)),#REGa
  $7D60 #REGb=#N(4,2,,1)($)
  $7D62 #REGa=PEEK (#REGix+#N(5,2,,1)($))
  $7D65 CALL #R27417
  $7D68 #REGa=PEEK (#REGix+#N(6,2,,1)($))
  $7D6B #REGa=#REGa-#REGc
  $7D6C Jump to #R32116 if the carry flag is set
  $7D6E POKE #N(23861,4,,1)($),#REGa
  $7D71 Jump to #R31937
c $7D74
  $7D74 CALL #R24620
  $7D77 CALL #R26501
  $7D7A CALL #R27920
  $7D7D CALL #R24874
  $7D80 Return
c $7D81
  $7D81 CALL #R24620
  $7D84 CALL #R26501
  $7D87 CALL #R24874
  $7D8A #REGa=#N(43,2,,1)($)
  $7D8C CALL #R28012
  $7D8F Return
c $7D90
  $7D90 CALL #R24620
  $7D93 CALL #R26501
  $7D96 CALL #R24874
  $7D99 #REGa=#N(44,2,,1)($)
  $7D9B CALL #R28012
  $7D9E Return
c $7D9F
  $7D9F Push #REGix onto the stack
  $7DA1 POKE #N(23955,4,,1)($),#REGl; POKE #N(23956,4,,1)($),#REGh
  $7DA4 #REGa=0
  $7DA5 POKE #N(23951,4,,1)($),#REGa
  $7DA8 #REGhl=#N(23417,4,,1)($)
  $7DAB POKE #N(23917,4,,1)($),#REGl; POKE #N(23918,4,,1)($),#REGh
  $7DAE #REGde=#N(23418,4,,1)($)
  $7DB1 #REGbc=#N(29,4,,1)($)
  $7DB4 POKE #REGhl,#N(0,2,,1)($)
  $7DB6 POKE #REGde,PEEK #REGhl; #REGhl=#REGhl+1; #REGde=#REGde+1; #REGbc=#REGbc-1; repeat until #REGbc=0
  $7DB8 #REGixl=PEEK #N(46890,4,,1)($); #REGixh=PEEK #N(46891,4,,1)($)
  $7DBC #REGa=PEEK #N(46649,4,,1)($)
  $7DBF #REGb=#REGa
  $7DC0 #REGhl=#N(23417,4,,1)($)
  $7DC3 #REGa=PEEK (#REGix+#N(5,2,,1)($))
  $7DC6 Clear the carry flag and set the zero flag if #REGa=0
  $7DC7 Jump to #R32257 if #REGa>0
  $7DC9 #REGa=PEEK (#REGix+#N(0,2,,1)($))
  $7DCC Clear the carry flag and set the zero flag if #REGa=0
  $7DCD Jump to #R32257 if #REGa=0
  $7DCF #REGa=PEEK #N(23955,4,,1)($)
  $7DD2 Set the zero flag if #REGa=PEEK (#REGix+#N(1,2,,1)($)), or the carry flag if #REGa<PEEK (#REGix+#N(1,2,,1)($))
  $7DD5 Jump to #R32257 if #REGa<>PEEK (#REGix+#N(1,2,,1)($))
  $7DD7 #REGa=PEEK #N(23956,4,,1)($)
  $7DDA Set the zero flag if #REGa=PEEK (#REGix+#N(2,2,,1)($)), or the carry flag if #REGa<PEEK (#REGix+#N(2,2,,1)($))
  $7DDD Jump to #R32257 if #REGa<>PEEK (#REGix+#N(2,2,,1)($))
  $7DDF #REGa=PEEK #N(46649,4,,1)($)
  $7DE2 #REGa=#REGa+1
  $7DE3 #REGa=#REGa-#REGb
  $7DE4 POKE #REGhl,#REGa
  $7DE5 #REGhl=#REGhl+1
  $7DE6 #REGa=PEEK (#REGix+#N(0,2,,1)($))
  $7DE9 POKE #REGhl,#REGa
  $7DEA #REGhl=#REGhl+1
  $7DEB #REGa=PEEK (#REGix+#N(4,2,,1)($))
  $7DEE POKE #REGhl,#REGa
  $7DEF #REGhl=#REGhl+1
  $7DF0 #REGa=PEEK (#REGix+#N(3,2,,1)($))
  $7DF3 POKE #N(23843,4,,1)($),#REGa
  $7DF6 #REGa=PEEK #N(23951,4,,1)($)
  $7DF9 #REGa=#REGa+1
  $7DFA POKE #N(23951,4,,1)($),#REGa
  $7DFD Set the zero flag if #REGa=#N(10,2,,1)($), or the carry flag if #REGa<#N(10,2,,1)($)
  $7DFF Jump to #R32264 if #REGa=#N(10,2,,1)($)
  $7E01 #REGde=#N(6,4,,1)($)
  $7E04 #REGix=#REGix+#REGde
  $7E06 Decrement #REGb and jump to #R32195 if #REGb>0
  $7E08 Pop last item from stack into #REGix
  $7E0A Return
c $7E0B
  $7E0B Push #REGix onto the stack
  $7E0D #REGa=0
  $7E0E POKE #N(23953,4,,1)($),#REGa
  $7E11 POKE #N(23954,4,,1)($),#REGa
  $7E14 #REGa=PEEK #N(46649,4,,1)($)
  $7E17 #REGb=#REGa
  $7E18 #REGiyl=PEEK #N(46890,4,,1)($); #REGiyh=PEEK #N(46891,4,,1)($)
  $7E1C Push #REGbc onto the stack
  $7E1D #REGa=PEEK #N(23846,4,,1)($)
  $7E20 Set the zero flag if #REGa=PEEK (#REGiy+#N(5,2,,1)($)), or the carry flag if #REGa<PEEK (#REGiy+#N(5,2,,1)($))
  $7E23 Jump to #R32317 if #REGa<>PEEK (#REGiy+#N(5,2,,1)($))
  $7E25 #REGa=PEEK (#REGiy+#N(0,2,,1)($))
  $7E28 CALL #R26591
  $7E2B #REGa=PEEK #N(23953,4,,1)($)
  $7E2E #REGa=#REGa+PEEK (#REGix+#N(1,2,,1)($))
  $7E31 POKE #N(23953,4,,1)($),#REGa
  $7E34 #REGa=PEEK #N(23954,4,,1)($)
  $7E37 #REGa=#REGa+PEEK (#REGix+#N(2,2,,1)($))
  $7E3A POKE #N(23954,4,,1)($),#REGa
  $7E3D Pop last item from stack into #REGbc
  $7E3E #REGde=#N(6,4,,1)($)
  $7E41 #REGiy=#REGiy+#REGde
  $7E43 Decrement #REGb and jump to #R32284 if #REGb>0
  $7E45 Pop last item from stack into #REGix
  $7E47 Return
c $7E48
  $7E48 Push #REGix onto the stack
  $7E4A CALL #R32159
  $7E4D #REGa=PEEK #N(23951,4,,1)($)
  $7E50 Clear the carry flag and set the zero flag if #REGa=0
  $7E51 Jump to #R32399 if #REGa=0
  $7E53 #REGa=0
  $7E54 POKE #N(23957,4,,1)($),#REGa
  $7E57 #REGhl=#N(23418,4,,1)($)
  $7E5A POKE #N(23917,4,,1)($),#REGl; POKE #N(23918,4,,1)($),#REGh
  $7E5D #REGa=PEEK #N(23951,4,,1)($)
  $7E60 #REGb=#REGa
  $7E61 Push #REGbc onto the stack
  $7E62 #REGl=PEEK #N(23917,4,,1)($); #REGh=PEEK #N(23918,4,,1)($)
  $7E65 #REGa=PEEK #REGhl
  $7E66 CALL #R26591
  $7E69 #REGa=PEEK #N(23957,4,,1)($)
  $7E6C Set the zero flag if #REGa=PEEK (#REGix+#N(2,2,,1)($)), or the carry flag if #REGa<PEEK (#REGix+#N(2,2,,1)($))
  $7E6F Jump to #R32382 if #REGa>=PEEK (#REGix+#N(2,2,,1)($))
  $7E71 #REGl=PEEK #N(23917,4,,1)($); #REGh=PEEK #N(23918,4,,1)($)
  $7E74 #REGa=PEEK #REGhl
  $7E75 POKE #N(23958,4,,1)($),#REGa
  $7E78 #REGa=PEEK (#REGix+#N(2,2,,1)($))
  $7E7B POKE #N(23957,4,,1)($),#REGa
  $7E7E #REGl=PEEK #N(23917,4,,1)($); #REGh=PEEK #N(23918,4,,1)($)
  $7E81 #REGde=#N(3,4,,1)($)
  $7E84 #REGhl=#REGhl+#REGde
  $7E85 POKE #N(23917,4,,1)($),#REGl; POKE #N(23918,4,,1)($),#REGh
  $7E88 Pop last item from stack into #REGbc
  $7E89 Decrement #REGb and jump to #R32353 if #REGb>0
  $7E8B #REGa=PEEK #N(23958,4,,1)($)
  $7E8E Clear the carry flag and set the zero flag if #REGa=0
  $7E8F Pop last item from stack into #REGix
  $7E91 Return
c $7E92
  $7E92 CALL #R32267
  $7E95 #REGa=PEEK #N(23953,4,,1)($)
  $7E98 Clear the carry flag and set the zero flag if #REGa=0
  $7E99 Jump to #R32415 if #REGa>0
  $7E9B POKE (#REGix+#N(25,2,,1)($)),#REGa
  $7E9E Return
c $7E9F
  $7E9F #REGa=PEEK (#REGix+#N(20,2,,1)($))
  $7EA2 #REGhl=#N(23953,4,,1)($)
  $7EA5 #REGb=PEEK #REGhl
  $7EA6 CALL #R37947
  $7EA9 #REGa=PEEK (#REGix+#N(27,2,,1)($))
  $7EAC #REGl=#REGa
  $7EAD #REGh=#N(0,2,,1)($)
  $7EAF CALL #R37970
  $7EB2 Clear the carry flag and set the zero flag if #REGa=0
  $7EB3 Rotate #REGd right through the carry flag
  $7EB5 Rotate #REGe right through the carry flag
  $7EB7 POKE (#REGix+#N(25,2,,1)($)),#REGe
  $7EBA #REGa=PEEK (#REGix+#N(27,2,,1)($))
  $7EBD #REGa=#REGa-PEEK (#REGix+#N(25,2,,1)($))
  $7EC0 POKE (#REGix+#N(5,2,,1)($)),#REGa
  $7EC3 Set the zero flag if #REGa=PEEK (#REGix+#N(6,2,,1)($)), or the carry flag if #REGa<PEEK (#REGix+#N(6,2,,1)($))
  $7EC6 Return if #REGa>=PEEK (#REGix+#N(6,2,,1)($))
  $7EC7 POKE (#REGix+#N(6,2,,1)($)),#REGa
  $7ECA Return
c $7ECB
  $7ECB CALL #R28276
  $7ECE Return if the zero flag is set
  $7ECF CALL #R28351
  $7ED2 #REGa=PEEK #N(23864,4,,1)($)
  $7ED5 Clear the carry flag and set the zero flag if #REGa=0
  $7ED6 Jump to #R32479 if #REGa=0
  $7ED8 #REGa=PEEK #N(23849,4,,1)($)
  $7EDB Set the zero flag if #REGa=#N(2,2,,1)($), or the carry flag if #REGa<#N(2,2,,1)($)
  $7EDD Jump to #R32519 if #REGa<#N(2,2,,1)($)
  $7EDF #REGa=PEEK #N(23849,4,,1)($)
  $7EE2 Set the zero flag if #REGa=#N(3,2,,1)($), or the carry flag if #REGa<#N(3,2,,1)($)
  $7EE4 Jump to #R32519 if #REGa=#N(3,2,,1)($)
  $7EE6 Clear the carry flag and set the zero flag if #REGa=0
  $7EE7 Jump to #R32973 if #REGa=0
  $7EEA Set the zero flag if #REGa=#N(1,2,,1)($), or the carry flag if #REGa<#N(1,2,,1)($)
  $7EEC Jump to #R32523 if #REGa=#N(1,2,,1)($)
  $7EEF Set the zero flag if #REGa=#N(5,2,,1)($), or the carry flag if #REGa<#N(5,2,,1)($)
  $7EF1 Jump to #R32508 if #REGa<>#N(5,2,,1)($)
  $7EF3 CALL #R28553
  $7EF6 Push #REGaf onto the stack
  $7EF7 CALL #R27580
  $7EFA Pop last item from stack into #REGaf
  $7EFB Return
c $7EFC
  $7EFC CALL #R24874
  $7EFF #REGa=#N(20,2,,1)($)
  $7F01 CALL #R28012
  $7F04 CALL #R27275
  $7F07 #REGa=#N(1,2,,1)($)
  $7F09 Clear the carry flag and set the zero flag if #REGa=0
  $7F0A Return
c $7F0B
  $7F0B #REGa=PEEK #N(23862,4,,1)($)
  $7F0E Clear the carry flag and set the zero flag if #REGa=0
  $7F0F CALL #R25674 if #REGa=0
  $7F12 CALL #R32705
  $7F15 Jump to #R32629 if the carry flag is set
  $7F17 CALL #R32917
  $7F1A CALL #R39375
  $7F1D CALL #R32816
  $7F20 #REGa=PEEK #N(23862,4,,1)($)
  $7F23 Clear the carry flag and set the zero flag if #REGa=0
  $7F24 CALL #R32664 if #REGa=0
  $7F27 #REGe=PEEK #N(23866,4,,1)($); #REGd=PEEK #N(23867,4,,1)($)
  $7F2B CALL #R24850
  $7F2E #REGa=PEEK #N(23847,4,,1)($)
  $7F31 POKE #REGhl,#REGa
  $7F32 CALL #R37377
  $7F35 #REGa=PEEK #N(23862,4,,1)($)
  $7F38 Clear the carry flag and set the zero flag if #REGa=0
  $7F39 CALL #R24874 if #REGa=0
  $7F3C CALL #R39400
  $7F3F #REGl=PEEK #N(23844,4,,1)($); #REGh=PEEK #N(23845,4,,1)($)
  $7F42 POKE #N(23804,4,,1)($),#REGl; POKE #N(23805,4,,1)($),#REGh
  $7F45 #REGhl=#N(0,4,,1)($)
  $7F48 POKE #N(23825,4,,1)($),#REGl; POKE #N(23826,4,,1)($),#REGh
  $7F4B CALL #R28173
  $7F4E #REGixl=PEEK #N(23859,4,,1)($); #REGixh=PEEK #N(23860,4,,1)($)
  $7F52 #REGa=PEEK #N(23861,4,,1)($)
  $7F55 POKE (#REGix+#N(6,2,,1)($)),#REGa
  $7F58 CALL #R29290
  $7F5B CALL #R29730
  $7F5E CALL #R27580
  $7F61 CALL #R30045
  $7F64 CALL #R42148
  $7F67 #REGa=PEEK (#REGix+#N(6,2,,1)($))
  $7F6A Clear the carry flag and set the zero flag if #REGa=0
  $7F6B Return if #REGa=0
  $7F6C #REGa=PEEK (#REGix+#N(8,2,,1)($))
  $7F6F Clear the carry flag and set the zero flag if #REGa=0
  $7F70 Return if #REGa=0
  $7F71 #REGa=#N(1,2,,1)($)
  $7F73 Clear the carry flag and set the zero flag if #REGa=0
  $7F74 Return
c $7F75
  $7F75 #REGa=#N(45,2,,1)($)
  $7F77 CALL #R28012
  $7F7A CALL #R27275
  $7F7D #REGa=#N(1,2,,1)($)
  $7F7F POKE #N(23863,4,,1)($),#REGa
  $7F82 Clear the carry flag and set the zero flag if #REGa=0
  $7F83 Return
c $7F84
  $7F84 #REGl=PEEK #N(23866,4,,1)($); #REGh=PEEK #N(23867,4,,1)($)
  $7F87 #REGe=PEEK #N(23804,4,,1)($); #REGd=PEEK #N(23805,4,,1)($)
  $7F8B Clear the carry flag and set the zero flag if #REGa=0
  $7F8C #REGhl=#REGhl-carry-#REGde
  $7F8E Shift #REGh left (copying bit 7 into the carry flag, and resetting bit 0)
  $7F90 #REGh=#REGh+1
  $7F91 Shift #REGl left (copying bit 7 into the carry flag, and resetting bit 0)
  $7F93 #REGl=#REGl+1
  $7F94 POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $7F97 Return
c $7F98
  $7F98 #REGa=#N(9,2,,1)($)
  $7F9A CALL #R46526
  $7F9D CALL #R32644
  $7FA0 #REGhl=#N(46670,4,,1)($)
  $7FA3 #REGa=#N(71,2,,1)($)
  $7FA5 POKE #N(23808,4,,1)($),#REGa
  $7FA8 Push #REGhl onto the stack
  $7FA9 #REGa=PEEK #REGhl
  $7FAA Set the zero flag if #REGa=#N(255,2,,1)($), or the carry flag if #REGa<#N(255,2,,1)($)
  $7FAC Jump to #R32696 if #REGa=#N(255,2,,1)($)
  $7FAE CALL #R24751
  $7FB1 CALL #R46549
  $7FB4 Pop last item from stack into #REGhl
  $7FB5 #REGhl=#REGhl+1
  $7FB6 Jump to #R32680
c $7FB8
  $7FB8 Pop last item from stack into #REGhl
  $7FB9 #REGl=PEEK #N(23870,4,,1)($); #REGh=PEEK #N(23871,4,,1)($)
  $7FBC #REGa=PEEK #REGhl
  $7FBD CALL #R24942
  $7FC0 Return
c $7FC1
  $7FC1 #REGa=PEEK (#REGix+#N(23,2,,1)($))
  $7FC4 Clear the carry flag and set the zero flag if #REGa=0
  $7FC5 Jump to #R32771 if #REGa=0
  $7FC7 #REGa=PEEK (#REGix+#N(35,2,,1)($))
  $7FCA CALL #R26591
  $7FCD Set the zero flag if bit 0 of (#REGix+#N(0,2,,1)($)) is 0
  $7FD1 Jump to #R32771 if bit 0 of PEEK (#REGix+#N(0,2,,1)($)) is reset
  $7FD3 #REGa=PEEK (#REGix+#N(4,2,,1)($))
  $7FD6 POKE #N(23962,4,,1)($),#REGa
  $7FD9 #REGiyl=PEEK #N(23859,4,,1)($); #REGiyh=PEEK #N(23860,4,,1)($)
  $7FDD #REGa=PEEK (#REGiy+#N(20,2,,1)($))
  $7FE0 #REGb=PEEK (#REGix+#N(7,2,,1)($))
  $7FE3 CALL #R27417
  $7FE6 #REGa=PEEK (#REGix+#N(6,2,,1)($))
  $7FE9 #REGa=#REGa+#REGc
  $7FEA POKE #N(23960,4,,1)($),#REGa
  $7FED #REGa=PEEK (#REGiy+#N(21,2,,1)($))
  $7FF0 #REGb=PEEK (#REGix+#N(8,2,,1)($))
  $7FF3 CALL #R27417
  $7FF6 #REGa=PEEK (#REGix+#N(5,2,,1)($))
  $7FF9 #REGa=#REGa+#REGc
  $7FFA POKE #N(23959,4,,1)($),#REGa
  $7FFD #REGixl=PEEK #N(23859,4,,1)($); #REGixh=PEEK #N(23860,4,,1)($)
  $8001 Jump to #R32794
c $8003
  $8003 #REGa=#N(5,2,,1)($)
  $8005 POKE #N(23962,4,,1)($),#REGa
  $8008 #REGixl=PEEK #N(23859,4,,1)($); #REGixh=PEEK #N(23860,4,,1)($)
  $800C #REGa=PEEK (#REGix+#N(19,2,,1)($))
  $800F POKE #N(23960,4,,1)($),#REGa
  $8012 #REGa=PEEK (#REGix+#N(21,2,,1)($))
  $8015 Shift #REGa left (copying bit 7 into the carry flag, and resetting bit 0)
  $8017 POKE #N(23959,4,,1)($),#REGa
  $801A #REGhl=#N(23962,4,,1)($)
  $801D #REGa=PEEK (#REGix+#N(5,2,,1)($))
  $8020 #REGb=PEEK #REGhl
  $8021 CALL #R27417
  $8024 #REGa=#REGc
  $8025 POKE #N(23962,4,,1)($),#REGa
  $8028 #REGa=PEEK (#REGix+#N(6,2,,1)($))
  $802B #REGa=#REGa-#REGc
  $802C POKE #N(23861,4,,1)($),#REGa
  $802F Return
c $8030
  $8030 #REGa=PEEK #N(23960,4,,1)($)
  $8033 POKE #N(23961,4,,1)($),#REGa
  $8036 #REGa=0
  $8037 POKE #N(23948,4,,1)($),#REGa
  $803A CALL #R27466
  $803D POKE #N(23847,4,,1)($),#REGa
  $8040 #REGa=PEEK #N(23847,4,,1)($)
  $8043 Clear the carry flag and set the zero flag if #REGa=0
  $8044 Return if #REGa=0
  $8045 CALL #R26615
  $8048 #REGa=PEEK #N(23961,4,,1)($)
  $804B Set the zero flag if #REGa=PEEK (#REGiy+#N(3,2,,1)($)), or the carry flag if #REGa<PEEK (#REGiy+#N(3,2,,1)($))
  $804E Return if #REGa<PEEK (#REGiy+#N(3,2,,1)($))
  $804F #REGa=PEEK #N(23948,4,,1)($)
  $8052 #REGa=#REGa+PEEK (#REGiy+#N(7,2,,1)($))
  $8055 POKE #N(23948,4,,1)($),#REGa
  $8058 #REGa=PEEK (#REGiy+#N(4,2,,1)($))
  $805B POKE #N(23847,4,,1)($),#REGa
  $805E #REGa=PEEK (#REGiy+#N(8,2,,1)($))
  $8061 Set the zero flag if #REGa=#N(7,2,,1)($), or the carry flag if #REGa<#N(7,2,,1)($)
  $8063 Jump to #R32905 if #REGa<>#N(7,2,,1)($)
  $8065 #REGl=PEEK #N(24051,4,,1)($); #REGh=PEEK #N(24052,4,,1)($)
  $8068 #REGa=PEEK #REGhl
  $8069 Clear the carry flag and set the zero flag if #REGa=0
  $806A Jump to #R32905 if #REGa>0
  $806C #REGa=PEEK (#REGiy+#N(9,2,,1)($))
  $806F POKE #REGhl,#REGa
  $8070 #REGa=PEEK #N(23866,4,,1)($)
  $8073 #REGhl=#REGhl+1
  $8074 POKE #REGhl,#REGa
  $8075 #REGa=PEEK #N(23867,4,,1)($)
  $8078 #REGhl=#REGhl+1
  $8079 POKE #REGhl,#REGa
  $807A #REGhl=#REGhl+1
  $807B POKE #N(24051,4,,1)($),#REGl; POKE #N(24052,4,,1)($),#REGh
  $807E #REGa=PEEK #REGhl
  $807F Set the zero flag if #REGa=#N(255,2,,1)($), or the carry flag if #REGa<#N(255,2,,1)($)
  $8081 Jump to #R32905 if #REGa<>#N(255,2,,1)($)
  $8083 #REGhl=#N(23731,4,,1)($)
  $8086 POKE #N(24051,4,,1)($),#REGl; POKE #N(24052,4,,1)($),#REGh
  $8089 #REGa=PEEK #N(23961,4,,1)($)
  $808C #REGa=#REGa-PEEK (#REGiy+#N(5,2,,1)($))
  $808F Return if the carry flag is set
  $8090 POKE #N(23961,4,,1)($),#REGa
  $8093 Jump to #R32832
c $8095
  $8095 #REGa=PEEK #N(23960,4,,1)($)
  $8098 #REGa=#REGa+1
  $8099 POKE #N(23963,4,,1)($),#REGa
  $809C CALL #R32945
  $809F #REGhl=#N(23960,4,,1)($)
  $80A2 Shift (#REGhl) right (copying bit 0 into the carry flag, and resetting bit 7)
  $80A4 #REGa=#REGa+PEEK #REGhl
  $80A5 Jump to #R32939 if the carry flag is set
  $80A7 POKE #N(23960,4,,1)($),#REGa
  $80AA Return
c $80AB
  $80AB #REGa=#N(255,2,,1)($)
  $80AD POKE #N(23960,4,,1)($),#REGa
  $80B0 Return
c $80B1
  $80B1 Push #REGhl onto the stack
  $80B2 #REGa=PEEK #N(23963,4,,1)($)
  $80B5 Clear the carry flag and set the zero flag if #REGa=0
  $80B6 Return if #REGa=0
  $80B7 #REGa=#REGr
  $80B9 #REGl=PEEK #N(23965,4,,1)($); #REGh=PEEK #N(23966,4,,1)($)
  $80BC #REGhl=#REGhl+1
  $80BD POKE #N(23965,4,,1)($),#REGl; POKE #N(23966,4,,1)($),#REGh
  $80C0 #REGa=#REGa+PEEK #REGhl
  $80C1 #REGhl=#N(23964,4,,1)($)
  $80C4 #REGa=#REGa+PEEK #REGhl
  $80C5 #REGhl=#N(23963,4,,1)($)
  $80C8 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $80C9 Jump to #R32951 if #REGa>=PEEK #REGhl
  $80CB Pop last item from stack into #REGhl
  $80CC Return
c $80CD
  $80CD CALL #R25674
  $80D0 CALL #R32705
  $80D3 Jump to #R32629 if the carry flag is set
  $80D6 CALL #R32917
  $80D9 CALL #R32664
  $80DC CALL #R27085
  $80DF #REGa=#N(62,2,,1)($)
  $80E1 CALL #R26476
  $80E4 #REGhl=#N(6145,4,,1)($)
  $80E7 POKE #N(23813,4,,1)($),#REGl; POKE #N(23814,4,,1)($),#REGh
  $80EA #REGa=PEEK (#REGix+#N(35,2,,1)($))
  $80ED Clear the carry flag and set the zero flag if #REGa=0
  $80EE Jump to #R33017 if #REGa=0
  $80F0 CALL #R26591
  $80F3 Set the zero flag if bit 0 of (#REGix+#N(0,2,,1)($)) is 0
  $80F7 Jump to #R33024 if bit 0 of PEEK (#REGix+#N(0,2,,1)($)) is set
  $80F9 #REGa=#N(63,2,,1)($)
  $80FB CALL #R26462
  $80FE Jump to #R33037
c $8100
  $8100 #REGixl=PEEK #N(23859,4,,1)($); #REGixh=PEEK #N(23860,4,,1)($)
  $8104 #REGa=PEEK (#REGix+#N(35,2,,1)($))
  $8107 #REGhl=#N(6145,4,,1)($)
  $810A CALL #R26784
  $810D #REGixl=PEEK #N(23859,4,,1)($); #REGixh=PEEK #N(23860,4,,1)($)
  $8111 CALL #R33186
  $8114 #REGa=PEEK #N(23967,4,,1)($)
  $8117 #REGb=PEEK (#REGix+#N(21,2,,1)($))
  $811A Clear the carry flag and set the zero flag if #REGa=0
  $811B Jump to #R33061 if #REGa=0
  $811D Shift #REGb right (copying bit 0 into the carry flag, and resetting bit 7)
  $811F Set the zero flag if #REGa=#N(2,2,,1)($), or the carry flag if #REGa<#N(2,2,,1)($)
  $8121 Jump to #R33061 if #REGa<>#N(2,2,,1)($)
  $8123 Shift #REGb right (copying bit 0 into the carry flag, and resetting bit 7)
  $8125 #REGa=PEEK #N(23959,4,,1)($)
  $8128 #REGa=#REGa-#REGb
  $8129 Jump to #R33068 if the carry flag is not set
  $812B #REGa=0
  $812C POKE #N(23959,4,,1)($),#REGa
  $812F #REGhl=#N(6151,4,,1)($)
  $8132 CALL #R33591
  $8135 #REGhl=#N(6155,4,,1)($)
  $8138 POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $813B #REGa=PEEK #N(23962,4,,1)($)
  $813E CALL #R26360
  $8141 #REGhl=#N(6164,4,,1)($)
  $8144 POKE #N(23813,4,,1)($),#REGl; POKE #N(23814,4,,1)($),#REGh
  $8147 #REGa=PEEK #N(23967,4,,1)($)
  $814A #REGa=#REGa+#N(64,2,,1)($)
  $814C CALL #R26462
  $814F #REGhl=#N(6159,4,,1)($)
  $8152 POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $8155 POKE #N(23813,4,,1)($),#REGl; POKE #N(23814,4,,1)($),#REGh
  $8158 #REGa=#N(100,2,,1)($)
  $815A POKE #N(23963,4,,1)($),#REGa
  $815D CALL #R32945
  $8160 #REGhl=#N(23959,4,,1)($)
  $8163 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $8164 Jump to #R33133 if #REGa<PEEK #REGhl
  $8166 #REGa=#N(68,2,,1)($)
  $8168 CALL #R26462
  $816B Jump to #R33166
c $816D
  $816D #REGa=PEEK #N(23960,4,,1)($)
  $8170 CALL #R26360
  $8173 CALL #R33649
  $8176 CALL #R33275
  $8179 CALL #R29290
  $817C CALL #R26501
  $817F #REGa=PEEK (#REGix+#N(8,2,,1)($))
  $8182 Clear the carry flag and set the zero flag if #REGa=0
  $8183 CALL #R33702 if #REGa=0
  $8186 CALL #R24874
  $8189 #REGa=#N(3,2,,1)($)
  $818B CALL #R46526
  $818E CALL #R28044
  $8191 #REGixl=PEEK #N(23859,4,,1)($); #REGixh=PEEK #N(23860,4,,1)($)
  $8195 #REGa=PEEK #N(23861,4,,1)($)
  $8198 POKE (#REGix+#N(6,2,,1)($)),#REGa
  $819B CALL #R33632
  $819E CALL #R42148
  $81A1 Return
b $81A2
t $81B2
c $81BF
  $81BF #REGixl=PEEK #N(23868,4,,1)($); #REGixh=PEEK #N(23869,4,,1)($)
  $81C3 CALL #R29478
  $81C6 POKE #N(23967,4,,1)($),#REGa
  $81C9 #REGl=PEEK #N(23868,4,,1)($); #REGh=PEEK #N(23869,4,,1)($)
  $81CC #REGde=#N(13,4,,1)($)
  $81CF #REGhl=#REGhl+#REGde
  $81D0 #REGd=#N(0,2,,1)($)
  $81D2 #REGe=#REGa
  $81D3 #REGhl=#REGhl+#REGde
  $81D4 #REGa=PEEK #N(23960,4,,1)($)
  $81D7 #REGa=#REGa-PEEK #REGhl
  $81D8 POKE #N(23960,4,,1)($),#REGa
  $81DB Jump to #R33270 if the carry flag is set
  $81DD Return if the zero flag is set
  $81DE Shift #REGa right (copying bit 0 into the carry flag, and resetting bit 7)
  $81E0 #REGb=#REGa
  $81E1 #REGa=PEEK #REGhl
  $81E2 #REGa=#REGa-#REGb
  $81E3 Jump to #R33254 if the carry flag is not set
  $81E5 #REGa=0
  $81E6 POKE #REGhl,#REGa
  $81E7 #REGa=PEEK (#REGix+#N(8,2,,1)($))
  $81EA #REGhl=#N(23960,4,,1)($)
  $81ED #REGa=#REGa-PEEK #REGhl
  $81EE Return if the carry flag is not set
  $81EF #REGa=PEEK (#REGix+#N(8,2,,1)($))
  $81F2 POKE #N(23960,4,,1)($),#REGa
  $81F5 Return
c $81F6
  $81F6 #REGa=0
  $81F7 POKE #N(23960,4,,1)($),#REGa
  $81FA Return
c $81FB
  $81FB #REGa=PEEK (#REGix+#N(8,2,,1)($))
  $81FE #REGhl=#N(23960,4,,1)($)
  $8201 #REGa=#REGa-PEEK #REGhl
  $8202 POKE (#REGix+#N(8,2,,1)($)),#REGa
  $8205 Clear the carry flag and set the zero flag if #REGa=0
  $8206 Jump to #R33321 if #REGa=0
  $8208 #REGa=PEEK #N(23960,4,,1)($)
  $820B Clear the carry flag and set the zero flag if #REGa=0
  $820C Return if #REGa=0
  $820D Set the zero flag if bit 4 of (#REGix+#N(37,2,,1)($)) is 0
  $8211 Clear the carry flag and set the zero flag if #REGa=0
  $8212 Return if #REGa>0
  $8213 #REGb=#REGa
  $8214 #REGa=PEEK (#REGix+#N(7,2,,1)($))
  $8217 CALL #R27417
  $821A #REGa=PEEK (#REGix+#N(12,2,,1)($))
  $821D #REGb=#REGc
  $821E CALL #R27417
  $8221 #REGa=PEEK (#REGix+#N(12,2,,1)($))
  $8224 #REGa=#REGa-#REGc
  $8225 POKE (#REGix+#N(12,2,,1)($)),#REGa
  $8228 Return
c $8229
  $8229 #REGa=PEEK #N(23865,4,,1)($)
  $822C #REGa=#REGa-#N(140,2,,1)($)
  $822E #REGh=#N(0,2,,1)($)
  $8230 #REGl=#REGa
  $8231 #REGhl=#REGhl+#REGhl
  $8232 #REGhl=#REGhl+#REGhl
  $8233 #REGde=#N(23632,4,,1)($)
  $8236 #REGhl=#REGhl+#REGde
  $8237 POKE #REGhl,#N(3,2,,1)($)
  $8239 #REGiyl=PEEK #N(46890,4,,1)($); #REGiyh=PEEK #N(46891,4,,1)($)
  $823D #REGa=PEEK #N(46649,4,,1)($)
  $8240 #REGb=#REGa
  $8241 #REGde=#N(6,4,,1)($)
  $8244 #REGa=PEEK #N(23865,4,,1)($)
  $8247 Set the zero flag if #REGa=PEEK (#REGiy+#N(5,2,,1)($)), or the carry flag if #REGa<PEEK (#REGiy+#N(5,2,,1)($))
  $824A Jump to #R33388 if #REGa<>PEEK (#REGiy+#N(5,2,,1)($))
  $824C #REGa=PEEK #N(23866,4,,1)($)
  $824F POKE (#REGiy+#N(1,2,,1)($)),#REGa
  $8252 #REGa=PEEK #N(23867,4,,1)($)
  $8255 POKE (#REGiy+#N(2,2,,1)($)),#REGa
  $8258 #REGa=PEEK #N(23843,4,,1)($)
  $825B POKE (#REGiy+#N(3,2,,1)($)),#REGa
  $825E POKE (#REGiy+#N(5,2,,1)($)),0
  $8262 Set the zero flag if bit 3 of (#REGix+#N(37,2,,1)($)) is 0
  $8266 Jump to #R33388 if bit 3 of PEEK (#REGix+#N(37,2,,1)($)) is reset
  $8268 POKE (#REGiy+#N(0,2,,1)($)),0
  $826C #REGiy=#REGiy+#REGde
  $826E Decrement #REGb and jump to #R33348 if #REGb>0
  $8270 #REGa=PEEK (#REGix+#N(3,2,,1)($))
  $8273 #REGl=PEEK #N(23870,4,,1)($); #REGh=PEEK #N(23871,4,,1)($)
  $8276 POKE #REGhl,#REGa
  $8277 #REGc=#N(0,2,,1)($)
  $8279 CALL #R33547
  $827C #REGa=PEEK (#REGix+#N(37,2,,1)($))
  $827F Keep only bit 0 of #REGa
  $8281 Flip bit 0 of #REGa
  $8283 #REGd=#N(0,2,,1)($)
  $8285 #REGe=#REGa
  $8286 POKE #N(23968,4,,1)($),#REGa
  $8289 #REGhl=#N(46863,4,,1)($)
  $828C #REGhl=#REGhl+#REGde
  $828D #REGa=PEEK (#REGix+#N(39,2,,1)($))
  $8290 #REGa=#REGa+PEEK #REGhl
  $8291 POKE #REGhl,#REGa
  $8292 #REGa=PEEK (#REGix+#N(1,2,,1)($))
  $8295 CALL #R33438
  $8298 #REGa=#N(110,2,,1)($)
  $829A POKE #N(39086,4,,1)($),#REGa
  $829D Return
c $829E
  $829E Push #REGix onto the stack
  $82A0 POKE #N(23969,4,,1)($),#REGa
  $82A3 #REGhl=#N(54175,4,,1)($)
  $82A6 POKE #N(23917,4,,1)($),#REGl; POKE #N(23918,4,,1)($),#REGh
  $82A9 #REGb=#N(20,2,,1)($)
  $82AB Push #REGbc onto the stack
  $82AC #REGixl=PEEK #N(23917,4,,1)($); #REGixh=PEEK #N(23918,4,,1)($)
  $82B0 Set the zero flag if bit 4 of (#REGix+#N(37,2,,1)($)) is 0
  $82B4 Jump to #R33497 if bit 4 of PEEK (#REGix+#N(37,2,,1)($)) is set
  $82B6 #REGa=PEEK (#REGix+#N(37,2,,1)($))
  $82B9 Keep only bit 0 of #REGa
  $82BB #REGhl=#N(23968,4,,1)($)
  $82BE Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $82BF Jump to #R33486 if #REGa<>PEEK #REGhl
  $82C1 #REGb=#N(12,2,,1)($)
  $82C3 #REGa=PEEK #N(23969,4,,1)($)
  $82C6 #REGl=PEEK #N(23917,4,,1)($); #REGh=PEEK #N(23918,4,,1)($)
  $82C9 CALL #R33513
  $82CC Jump to #R33497
c $82CE
  $82CE #REGb=#N(12,2,,1)($)
  $82D0 #REGa=PEEK #N(23969,4,,1)($)
  $82D3 #REGl=PEEK #N(23917,4,,1)($); #REGh=PEEK #N(23918,4,,1)($)
  $82D6 CALL #R33533
  $82D9 Pop last item from stack into #REGbc
  $82DA #REGde=#N(40,4,,1)($)
  $82DD #REGl=PEEK #N(23917,4,,1)($); #REGh=PEEK #N(23918,4,,1)($)
  $82E0 #REGhl=#REGhl+#REGde
  $82E1 POKE #N(23917,4,,1)($),#REGl; POKE #N(23918,4,,1)($),#REGh
  $82E4 Decrement #REGb and jump to #R33451 if #REGb>0
  $82E6 Pop last item from stack into #REGix
  $82E8 Return
c $82E9
  $82E9 Push #REGhl onto the stack
  $82EA #REGe=#REGb
  $82EB #REGd=#N(0,2,,1)($)
  $82ED #REGhl=#REGhl+#REGde
  $82EE #REGa=#REGa+PEEK #REGhl
  $82EF Jump to #R33523 if the carry flag is not set
  $82F1 #REGa=#N(255,2,,1)($)
  $82F3 POKE #REGhl,#REGa
  $82F4 #REGhl=#REGhl-1
  $82F5 #REGa=PEEK #REGhl
  $82F6 #REGhl=#REGhl+1
  $82F7 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $82F8 Jump to #R33531 if #REGa>=PEEK #REGhl
  $82FA POKE #REGhl,#REGa
  $82FB Pop last item from stack into #REGhl
  $82FC Return
c $82FD
  $82FD Push #REGhl onto the stack
  $82FE #REGe=#REGb
  $82FF #REGd=#N(0,2,,1)($)
  $8301 #REGhl=#REGhl+#REGde
  $8302 #REGb=#REGa
  $8303 #REGa=PEEK #REGhl
  $8304 #REGa=#REGa-#REGb
  $8305 Jump to #R33544 if the carry flag is not set
  $8307 #REGa=0
  $8308 POKE #REGhl,#REGa
  $8309 Pop last item from stack into #REGhl
  $830A Return
c $830B
  $830B Push #REGaf onto the stack
  $830C #REGa=PEEK #N(46649,4,,1)($)
  $830F #REGb=#REGa
  $8310 #REGl=PEEK #N(46890,4,,1)($); #REGh=PEEK #N(46891,4,,1)($)
  $8313 #REGde=#N(6,4,,1)($)
  $8316 #REGa=PEEK #REGhl
  $8317 Clear the carry flag and set the zero flag if #REGa=0
  $8318 Jump to #R33568 if #REGa=0
  $831A #REGhl=#REGhl+#REGde
  $831B Decrement #REGb and jump to #R33558 if #REGb>0
  $831D Pop last item from stack into #REGaf
  $831E #REGa=0
  $831F Return
c $8320
  $8320 Pop last item from stack into #REGaf
  $8321 POKE #REGhl,#REGa
  $8322 #REGhl=#REGhl+1
  $8323 #REGa=PEEK #N(23866,4,,1)($)
  $8326 POKE #REGhl,#REGa
  $8327 #REGhl=#REGhl+1
  $8328 #REGa=PEEK #N(23867,4,,1)($)
  $832B POKE #REGhl,#REGa
  $832C #REGhl=#REGhl+1
  $832D #REGa=PEEK #N(23843,4,,1)($)
  $8330 POKE #REGhl,#REGa
  $8331 #REGhl=#REGhl+1
  $8332 POKE #REGhl,#N(0,2,,1)($)
  $8334 #REGhl=#REGhl+1
  $8335 POKE #REGhl,#REGc
  $8336 Return
c $8337
  $8337 Push #REGaf onto the stack
  $8338 Push #REGhl onto the stack
  $8339 POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $833C CALL #R26360
  $833F Pop last item from stack into #REGhl
  $8340 Pop last item from stack into #REGaf
  $8341 #REGh=#REGh+1
  $8342 Set the zero flag if #REGa=#N(10,2,,1)($), or the carry flag if #REGa<#N(10,2,,1)($)
  $8344 Jump to #R33612 if #REGa<#N(10,2,,1)($)
  $8346 #REGh=#REGh+1
  $8347 Set the zero flag if #REGa=#N(100,2,,1)($), or the carry flag if #REGa<#N(100,2,,1)($)
  $8349 Jump to #R33612 if #REGa<#N(100,2,,1)($)
  $834B #REGh=#REGh+1
  $834C POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $834F #REGa=#N(37,2,,1)($)
  $8351 #REGhl=#N(23817,4,,1)($)
  $8354 Set the zero flag if bit 3 of (#REGhl) is 0
  $8356 Jump to #R33628 if bit 3 of PEEK #REGhl is reset
  $8358 CALL #R25847
  $835B Return
c $835C
  $835C CALL #R24690
  $835F Return
c $8360
  $8360 #REGa=PEEK (#REGix+#N(6,2,,1)($))
  $8363 Clear the carry flag and set the zero flag if #REGa=0
  $8364 Return if #REGa=0
  $8365 #REGa=PEEK (#REGix+#N(8,2,,1)($))
  $8368 Clear the carry flag and set the zero flag if #REGa=0
  $8369 Return if #REGa=0
  $836A CALL #R27275
  $836D #REGa=#N(1,2,,1)($)
  $836F Clear the carry flag and set the zero flag if #REGa=0
  $8370 Return
c $8371
  $8371 CALL #R32644
  $8374 #REGa=PEEK #N(23960,4,,1)($)
  $8377 Shift #REGa right (copying bit 0 into the carry flag, and resetting bit 7)
  $8379 Shift #REGa right (copying bit 0 into the carry flag, and resetting bit 7)
  $837B Clear the carry flag and set the zero flag if #REGa=0
  $837C Return if #REGa=0
  $837D #REGb=#REGa
  $837E Push #REGbc onto the stack
  $837F #REGa=#N(70,2,,1)($)
  $8381 POKE #N(23808,4,,1)($),#REGa
  $8384 #REGa=PEEK #N(46675,4,,1)($)
  $8387 CALL #R24751
  $838A #REGa=#N(9,2,,1)($)
  $838C CALL #R46526
  $838F #REGa=PEEK #N(46676,4,,1)($)
  $8392 CALL #R24751
  $8395 CALL #R46549
  $8398 #REGl=PEEK #N(23870,4,,1)($); #REGh=PEEK #N(23871,4,,1)($)
  $839B #REGa=PEEK #REGhl
  $839C CALL #R24942
  $839F CALL #R46549
  $83A2 Pop last item from stack into #REGbc
  $83A3 Decrement #REGb and jump to #R33662 if #REGb>0
  $83A5 Return
c $83A6
  $83A6 #REGa=#N(12,2,,1)($)
  $83A8 CALL #R46526
  $83AB CALL #R32644
  $83AE #REGixl=PEEK #N(23868,4,,1)($); #REGixh=PEEK #N(23869,4,,1)($)
  $83B2 #REGa=PEEK #N(23846,4,,1)($)
  $83B5 Push #REGaf onto the stack
  $83B6 #REGa=PEEK #N(23865,4,,1)($)
  $83B9 POKE #N(23846,4,,1)($),#REGa
  $83BC #REGb=#N(2,2,,1)($)
  $83BE Push #REGbc onto the stack
  $83BF CALL #R27920
  $83C2 #REGa=PEEK #N(23865,4,,1)($)
  $83C5 CALL #R24942
  $83C8 #REGa=#N(10,2,,1)($)
  $83CA CALL #R46549
  $83CD #REGa=PEEK (#REGix+#N(33,2,,1)($))
  $83D0 #REGa=#REGa+1
  $83D1 Set the zero flag if #REGa=#N(8,2,,1)($), or the carry flag if #REGa<#N(8,2,,1)($)
  $83D3 Jump to #R33750 if #REGa<>#N(8,2,,1)($)
  $83D5 #REGa=0
  $83D6 POKE (#REGix+#N(33,2,,1)($)),#REGa
  $83D9 Set the zero flag if #REGa=#N(4,2,,1)($), or the carry flag if #REGa<#N(4,2,,1)($)
  $83DB Jump to #R33727 if #REGa<>#N(4,2,,1)($)
  $83DD Pop last item from stack into #REGbc
  $83DE Decrement #REGb and jump to #R33726 if #REGb>0
  $83E0 #REGa=#N(10,2,,1)($)
  $83E2 CALL #R46526
  $83E5 #REGa=PEEK (#REGix+#N(0,2,,1)($))
  $83E8 #REGl=#REGa
  $83E9 #REGh=#N(0,2,,1)($)
  $83EB #REGhl=#REGhl+#REGhl
  $83EC #REGhl=#REGhl+#REGhl
  $83ED #REGe=PEEK #N(46880,4,,1)($); #REGd=PEEK #N(46881,4,,1)($)
  $83F1 #REGhl=#REGhl+#REGde
  $83F2 #REGa=PEEK #REGhl
  $83F3 POKE #N(23808,4,,1)($),#REGa
  $83F6 #REGhl=#REGhl+1
  $83F7 #REGb=#N(3,2,,1)($)
  $83F9 Push #REGbc onto the stack
  $83FA Push #REGhl onto the stack
  $83FB #REGa=PEEK #REGhl
  $83FC CALL #R24751
  $83FF CALL #R46549
  $8402 Pop last item from stack into #REGhl
  $8403 #REGhl=#REGhl+1
  $8404 Pop last item from stack into #REGbc
  $8405 Decrement #REGb and jump to #R33785 if #REGb>0
  $8407 Pop last item from stack into #REGaf
  $8408 POKE #N(23846,4,,1)($),#REGa
  $840B Return
c $840C
  $840C #REGb=#N(20,2,,1)($)
  $840E #REGa=PEEK #N(23970,4,,1)($)
  $8411 #REGa=#REGa+1
  $8412 Set the zero flag if #REGa=#N(20,2,,1)($), or the carry flag if #REGa<#N(20,2,,1)($)
  $8414 Jump to #R33815 if #REGa<#N(20,2,,1)($)
  $8416 #REGa=0
  $8417 POKE #N(23970,4,,1)($),#REGa
  $841A #REGl=#REGa
  $841B #REGh=#N(0,2,,1)($)
  $841D #REGhl=#REGhl+#REGhl
  $841E #REGhl=#REGhl+#REGhl
  $841F #REGde=#N(23632,4,,1)($)
  $8422 #REGhl=#REGhl+#REGde
  $8423 #REGa=PEEK #N(46866,4,,1)($)
  $8426 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $8427 Jump to #R33836 if #REGa=PEEK #REGhl
  $8429 Decrement #REGb and jump to #R33806 if #REGb>0
  $842B Return
c $842C
  $842C #REGhl=#REGhl+1
  $842D #REGa=PEEK #REGhl
  $842E POKE #N(23915,4,,1)($),#REGa
  $8431 #REGhl=#REGhl+1
  $8432 #REGa=PEEK #REGhl
  $8433 POKE #N(23916,4,,1)($),#REGa
  $8436 #REGl=PEEK #N(23804,4,,1)($); #REGh=PEEK #N(23805,4,,1)($)
  $8439 #REGde=#N(1285,4,,1)($)
  $843C #REGhl=#REGhl+#REGde
  $843D POKE #N(23913,4,,1)($),#REGl; POKE #N(23914,4,,1)($),#REGh
  $8440 CALL #R30602
  $8443 Return
c $8444
  $8444 #REGhl=#N(8512,4,,1)($)
  $8447 #REGb=#REGc
  $8448 #REGhl=#N(8514,4,,1)($)
  $844B #REGb=#REGe
  $844C #REGe=PEEK #N(23971,4,,1)($); #REGd=PEEK #N(23972,4,,1)($)
  $8450 #REGhl=#N(2056,4,,1)($)
  $8453 #REGhl=#REGhl+#REGde
  $8454 Exchange #REGde and #REGhl
  $8455 #REGa=#REGe
  $8456 Keep only bits 6 and 7 of #REGa
  $8458 Rotate #REGa right through the carry flag
  $8459 Set the carry flag
  $845A Rotate #REGa right through the carry flag
  $845B Rotate #REGa right circular (copying bit 0 into bit 7 and into the carry flag)
  $845C #REGa=#REGa^#REGe
  $845D Reset bits 0, 1 and 2 of #REGa
  $845F #REGa=#REGa^#REGe
  $8460 #REGh=#REGa
  $8461 #REGa=#REGd
  $8462 Rotate #REGa left circular (copying bit 7 into bit 0 and into the carry flag)
  $8463 Rotate #REGa left circular (copying bit 7 into bit 0 and into the carry flag)
  $8464 Rotate #REGa left circular (copying bit 7 into bit 0 and into the carry flag)
  $8465 #REGa=#REGa^#REGe
  $8466 Reset bits 3, 4 and 5 of #REGa
  $8468 #REGa=#REGa^#REGe
  $8469 Rotate #REGa left circular (copying bit 7 into bit 0 and into the carry flag)
  $846A Rotate #REGa left circular (copying bit 7 into bit 0 and into the carry flag)
  $846B #REGl=#REGa
  $846C #REGa=#REGd
  $846D Keep only bits 0, 1 and 2 of #REGa
  $846F #REGb=#REGa
  $8470 #REGb=#REGb+1
  $8471 #REGa=0
  $8472 Set the carry flag
  $8473 Rotate #REGa right through the carry flag
  $8474 Decrement #REGb and jump to #R33907 if #REGb>0
  $8476 #REGb=#REGa
  $8477 #REGa=PEEK #N(23974,4,,1)($)
  $847A Set the zero flag if #REGa=#N(1,2,,1)($), or the carry flag if #REGa<#N(1,2,,1)($)
  $847C Jump to #R33931 if #REGa=#N(1,2,,1)($)
  $847E Set the zero flag if #REGa=#N(2,2,,1)($), or the carry flag if #REGa<#N(2,2,,1)($)
  $8480 Jump to #R33937 if #REGa=#N(2,2,,1)($)
  $8482 #REGa=#REGb
  $8483 #REGa=#REGa&PEEK #REGhl
  $8484 POKE #N(23973,4,,1)($),#REGa
  $8487 #REGa=#REGb
  $8488 #REGa=#REGa|PEEK #REGhl
  $8489 POKE #REGhl,#REGa
  $848A Return
c $848B
  $848B #REGa=#REGb
  $848C Flip every bit of #REGa
  $848E #REGa=#REGa&PEEK #REGhl
  $848F POKE #REGhl,#REGa
  $8490 Return
c $8491
  $8491 #REGa=#REGb
  $8492 #REGa=#REGa^PEEK #REGhl
  $8493 POKE #REGhl,#REGa
  $8494 Return
c $8495
  $8495 #REGa=#N(69,2,,1)($)
  $8497 CALL #R24621
  $849A CALL #R26462
  $849D #REGhl=#N(789,4,,1)($)
  $84A0 #REGa=#N(160,2,,1)($)
  $84A2 CALL #R27539
  $84A5 #REGhl=#N(790,4,,1)($)
  $84A8 #REGa=#N(161,2,,1)($)
  $84AA CALL #R27539
  $84AD #REGa=0
  $84AE POKE #N(23974,4,,1)($),#REGa
  $84B1 #REGb=#N(242,2,,1)($)
  $84B3 Push #REGbc onto the stack
  $84B4 #REGa=#REGb
  $84B5 #REGa=#REGa-1
  $84B6 POKE #N(23972,4,,1)($),#REGa
  $84B9 #REGa=#N(8,2,,1)($)
  $84BB POKE #N(23971,4,,1)($),#REGa
  $84BE CALL #R33868
  $84C1 #REGa=#N(159,2,,1)($)
  $84C3 POKE #N(23971,4,,1)($),#REGa
  $84C6 CALL #R33868
  $84C9 Pop last item from stack into #REGbc
  $84CA Decrement #REGb and jump to #R33971 if #REGb>0
  $84CC #REGb=#N(150,2,,1)($)
  $84CE Push #REGbc onto the stack
  $84CF #REGa=#N(159,2,,1)($)
  $84D1 #REGa=#REGa-#REGb
  $84D2 POKE #N(23971,4,,1)($),#REGa
  $84D5 #REGa=0
  $84D6 POKE #N(23972,4,,1)($),#REGa
  $84D9 CALL #R33868
  $84DC #REGa=#N(241,2,,1)($)
  $84DE POKE #N(23972,4,,1)($),#REGa
  $84E1 CALL #R33868
  $84E4 Pop last item from stack into #REGbc
  $84E5 Decrement #REGb and jump to #R33998 if #REGb>0
  $84E7 #REGa=#N(9,2,,1)($)
  $84E9 POKE #N(23975,4,,1)($),#REGa
  $84EC #REGa=#N(1,2,,1)($)
  $84EE POKE #N(23976,4,,1)($),#REGa
  $84F1 #REGhl=#N(54975,4,,1)($)
  $84F4 POKE #N(23917,4,,1)($),#REGl; POKE #N(23918,4,,1)($),#REGh
  $84F7 #REGb=#N(50,2,,1)($)
  $84F9 Push #REGbc onto the stack
  $84FA #REGb=#N(80,2,,1)($)
  $84FC Push #REGbc onto the stack
  $84FD #REGl=PEEK #N(23917,4,,1)($); #REGh=PEEK #N(23918,4,,1)($)
  $8500 #REGe=PEEK #REGhl
  $8501 #REGd=#N(0,2,,1)($)
  $8503 #REGhl=#N(54015,4,,1)($)
  $8506 #REGhl=#REGhl+#REGde
  $8507 #REGa=PEEK #REGhl
  $8508 Reset bits 0, 1 and 2 of #REGa
  $850A Jump to #R34066 if #REGa=0
  $850C Rotate #REGa right circular (copying bit 0 into bit 7 and into the carry flag)
  $850D Rotate #REGa right circular (copying bit 0 into bit 7 and into the carry flag)
  $850E Rotate #REGa right circular (copying bit 0 into bit 7 and into the carry flag)
  $850F CALL #R34253
  $8512 Pop last item from stack into #REGbc
  $8513 #REGl=PEEK #N(23917,4,,1)($); #REGh=PEEK #N(23918,4,,1)($)
  $8516 #REGhl=#REGhl+1
  $8517 POKE #N(23917,4,,1)($),#REGl; POKE #N(23918,4,,1)($),#REGh
  $851A #REGa=PEEK #N(23976,4,,1)($)
  $851D #REGa=#REGa+#N(3,2,,1)($)
  $851F POKE #N(23976,4,,1)($),#REGa
  $8522 Decrement #REGb and jump to #R34044 if #REGb>0
  $8524 Pop last item from stack into #REGbc
  $8525 #REGa=#N(1,2,,1)($)
  $8527 POKE #N(23976,4,,1)($),#REGa
  $852A #REGa=PEEK #N(23975,4,,1)($)
  $852D #REGa=#REGa+#N(3,2,,1)($)
  $852F POKE #N(23975,4,,1)($),#REGa
  $8532 Decrement #REGb and jump to #R34041 if #REGb>0
  $8534 #REGhl=#N(930,4,,1)($)
  $8537 POKE #N(23975,4,,1)($),#REGl; POKE #N(23976,4,,1)($),#REGh
  $853A #REGa=#N(1,2,,1)($)
  $853C CALL #R34253
  $853F #REGa=#N(170,2,,1)($)
  $8541 POKE #N(23975,4,,1)($),#REGa
  $8544 #REGa=#N(2,2,,1)($)
  $8546 CALL #R34253
  $8549 #REGa=#N(2,2,,1)($)
  $854B POKE #N(23974,4,,1)($),#REGa
  $854E CALL #R27245
  $8551 #REGb=#N(100,2,,1)($)
  $8553 Push #REGbc onto the stack
  $8554 CALL #R45256
  $8557 CALL #R25311
  $855A #REGa=PEEK #N(23850,4,,1)($)
  $855D Pop last item from stack into #REGbc
  $855E Set the zero flag if bit 0 of #REGa is 0
  $8560 Jump to #R34243 if bit 0 of #REGa is reset
  $8562 Decrement #REGb and jump to #R34131 if #REGb>0
  $8564 #REGhl=#N(54975,4,,1)($)
  $8567 POKE #N(23917,4,,1)($),#REGl; POKE #N(23918,4,,1)($),#REGh
  $856A #REGa=#N(9,2,,1)($)
  $856C POKE #N(23975,4,,1)($),#REGa
  $856F #REGa=#N(1,2,,1)($)
  $8571 POKE #N(23976,4,,1)($),#REGa
  $8574 #REGb=#N(50,2,,1)($)
  $8576 Push #REGbc onto the stack
  $8577 #REGb=#N(80,2,,1)($)
  $8579 Push #REGbc onto the stack
  $857A #REGl=PEEK #N(23917,4,,1)($); #REGh=PEEK #N(23918,4,,1)($)
  $857D #REGa=PEEK #REGhl
  $857E Set the zero flag if #REGa=#N(140,2,,1)($), or the carry flag if #REGa<#N(140,2,,1)($)
  $8580 Jump to #R34183 if #REGa<#N(140,2,,1)($)
  $8582 #REGa=#N(15,2,,1)($)
  $8584 CALL #R34253
  $8587 Pop last item from stack into #REGbc
  $8588 #REGl=PEEK #N(23917,4,,1)($); #REGh=PEEK #N(23918,4,,1)($)
  $858B #REGhl=#REGhl+1
  $858C POKE #N(23917,4,,1)($),#REGl; POKE #N(23918,4,,1)($),#REGh
  $858F #REGa=PEEK #N(23976,4,,1)($)
  $8592 #REGa=#REGa+#N(3,2,,1)($)
  $8594 POKE #N(23976,4,,1)($),#REGa
  $8597 Decrement #REGb and jump to #R34169 if #REGb>0
  $8599 Pop last item from stack into #REGbc
  $859A #REGa=#N(1,2,,1)($)
  $859C POKE #N(23976,4,,1)($),#REGa
  $859F #REGa=PEEK #N(23975,4,,1)($)
  $85A2 #REGa=#REGa+#N(3,2,,1)($)
  $85A4 POKE #N(23975,4,,1)($),#REGa
  $85A7 Decrement #REGb and jump to #R34166 if #REGb>0
  $85A9 #REGhl=#N(930,4,,1)($)
  $85AC POKE #N(23975,4,,1)($),#REGl; POKE #N(23976,4,,1)($),#REGh
  $85AF #REGa=#N(15,2,,1)($)
  $85B1 CALL #R34253
  $85B4 #REGa=#N(170,2,,1)($)
  $85B6 POKE #N(23975,4,,1)($),#REGa
  $85B9 #REGa=#N(15,2,,1)($)
  $85BB CALL #R34253
  $85BE CALL #R34532
  $85C1 Jump to #R34129
c $85C3
  $85C3 CALL #R24620
  $85C6 CALL #R24874
  $85C9 CALL #R26501
  $85CC Return
c $85CD
  $85CD #REGa=#REGa-1
  $85CE #REGl=#REGa
  $85CF #REGh=#N(0,2,,1)($)
  $85D1 #REGhl=#REGhl+#REGhl
  $85D2 #REGde=#N(34297,4,,1)($)
  $85D5 #REGhl=#REGhl+#REGde
  $85D6 #REGe=PEEK #REGhl
  $85D7 #REGhl=#REGhl+1
  $85D8 #REGd=PEEK #REGhl
  $85D9 Exchange #REGde and #REGhl
  $85DA Push #REGhl onto the stack
  $85DB #REGa=PEEK #REGhl
  $85DC Set the zero flag if #REGa=#N(255,2,,1)($), or the carry flag if #REGa<#N(255,2,,1)($)
  $85DE Jump to #R34295 if #REGa=#N(255,2,,1)($)
  $85E0 #REGa=PEEK #N(23975,4,,1)($)
  $85E3 #REGa=#REGa+PEEK #REGhl
  $85E4 POKE #N(23971,4,,1)($),#REGa
  $85E7 #REGhl=#REGhl+1
  $85E8 #REGa=PEEK #N(23976,4,,1)($)
  $85EB #REGa=#REGa+PEEK #REGhl
  $85EC POKE #N(23972,4,,1)($),#REGa
  $85EF CALL #R33868
  $85F2 Pop last item from stack into #REGhl
  $85F3 #REGhl=#REGhl+1
  $85F4 #REGhl=#REGhl+1
  $85F5 Jump to #R34266
c $85F7
  $85F7 Pop last item from stack into #REGhl
  $85F8 Return
b $85F9
c $8606
  $8606 #REGa=#REGa+PEEK #REGhl
  $8607 #REGh=#REGd
  $8608 #REGa=#REGa+PEEK #REGhl
  $8609 #REGl=#REGc
  $860A #REGa=#REGa+PEEK #REGhl
  $860B POKE #REGhl,#REGd
  $860C #REGa=#REGa+PEEK #REGhl
  $860D #REGa=#REGe
  $860E #REGa=#REGa+PEEK #REGhl
  $860F #REGa=#REGa+#REGh
  $8610 #REGa=#REGa+PEEK #REGhl
  $8611 #REGa=#REGa+carry+#REGl
  $8612 #REGa=#REGa+PEEK #REGhl
  $8613 #REGa=#REGa-carry-#REGb
  $8614 #REGa=#REGa+PEEK #REGhl
  $8615 #REGa=#REGa-carry-#REGe
  $8616 #REGa=#REGa+PEEK #REGhl
  $8617 #REGa=#REGa^PEEK #REGhl
  $8618 #REGa=#REGa+PEEK #REGhl
  $8619 #REGa=#REGa|#REGl
  $861A #REGa=#REGa+PEEK #REGhl
  $861B Set the zero flag if #REGa=#REGh, or the carry flag if #REGa<#REGh
  $861C #REGa=#REGa+PEEK #REGhl
  $861D Jump to #R51846
b $8620
c $86CC
  $86CC #REGbc=#N(512,4,,1)($)
  $86CF Do nothing
  $86D0 Do nothing
  $86D1 POKE #REGbc,#REGa
  $86D2 #REGbc=#N(514,4,,1)($)
  $86D5 POKE #REGbc,#REGa
  $86D6 CALL #R56
  $86D7 Do nothing
  $86D8 Do nothing
  $86D9 Do nothing
  $86DA #REGbc=#N(512,4,,1)($)
  $86DD POKE #REGbc,#REGa
  $86DE Do nothing
  $86DF POKE #REGbc,#REGa
  $86E0 #REGbc=#N(514,4,,1)($)
  $86E3 CALL #R56
  $86E4 #REGhl=#N(23804,4,,1)($)
  $86E7 #REGa=#N(9,2,,1)($)
  $86E9 #REGa=#REGa+PEEK #REGhl
  $86EA #REGa=#REGa+PEEK #REGhl
  $86EB #REGa=#REGa+PEEK #REGhl
  $86EC POKE #N(23975,4,,1)($),#REGa
  $86EF #REGhl=#REGhl+1
  $86F0 #REGa=#N(1,2,,1)($)
  $86F2 #REGa=#REGa+PEEK #REGhl
  $86F3 #REGa=#REGa+PEEK #REGhl
  $86F4 #REGa=#REGa+PEEK #REGhl
  $86F5 POKE #N(23976,4,,1)($),#REGa
  $86F8 #REGa=PEEK #N(23975,4,,1)($)
  $86FB POKE #N(23971,4,,1)($),#REGa
  $86FE #REGb=#N(33,2,,1)($)
  $8700 Push #REGbc onto the stack
  $8701 #REGa=PEEK #N(23976,4,,1)($)
  $8704 POKE #N(23972,4,,1)($),#REGa
  $8707 CALL #R33868
  $870A #REGa=PEEK #N(23976,4,,1)($)
  $870D #REGa=#REGa+#N(32,2,,1)($)
  $870F POKE #N(23972,4,,1)($),#REGa
  $8712 CALL #R33868
  $8715 Pop last item from stack into #REGbc
  $8716 #REGhl=#N(23971,4,,1)($)
  $8719 POKE #REGhl,(PEEK #REGhl)+1
  $871A Decrement #REGb and jump to #R34560 if #REGb>0
  $871C #REGa=PEEK #N(23976,4,,1)($)
  $871F #REGa=#REGa+1
  $8720 POKE #N(23972,4,,1)($),#REGa
  $8723 #REGb=#N(31,2,,1)($)
  $8725 Push #REGbc onto the stack
  $8726 #REGa=PEEK #N(23975,4,,1)($)
  $8729 POKE #N(23971,4,,1)($),#REGa
  $872C CALL #R33868
  $872F #REGa=PEEK #N(23975,4,,1)($)
  $8732 #REGa=#REGa+#N(32,2,,1)($)
  $8734 POKE #N(23971,4,,1)($),#REGa
  $8737 CALL #R33868
  $873A Pop last item from stack into #REGbc
  $873B #REGhl=#N(23972,4,,1)($)
  $873E POKE #REGhl,(PEEK #REGhl)+1
  $873F Decrement #REGb and jump to #R34597 if #REGb>0
  $8741 Return
c $8742
  $8742 #REGl=PEEK #N(23855,4,,1)($); #REGh=PEEK #N(23856,4,,1)($)
  $8745 #REGa=PEEK #REGhl
  $8746 POKE #N(23977,4,,1)($),#REGa
  $8749 CALL #R34637
  $874C Return
c $874D
  $874D Push #REGix onto the stack
  $874F CALL #R25674
  $8752 #REGa=PEEK #N(23977,4,,1)($)
  $8755 CALL #R26562
  $8758 #REGa=#N(70,2,,1)($)
  $875A CALL #R24621
  $875D CALL #R26462
  $8760 #REGhl=#N(5379,4,,1)($)
  $8763 POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $8766 #REGl=PEEK #N(46870,4,,1)($); #REGh=PEEK #N(46871,4,,1)($)
  $8769 Push #REGhl onto the stack
  $876A #REGa=PEEK #N(23846,4,,1)($)
  $876D Push #REGaf onto the stack
  $876E #REGa=PEEK (#REGix+#N(33,2,,1)($))
  $8771 POKE (#REGix+#N(33,2,,1)($)),4
  $8775 Push #REGaf onto the stack
  $8776 #REGa=PEEK #N(23977,4,,1)($)
  $8779 POKE #N(23846,4,,1)($),#REGa
  $877C CALL #R27920
  $877F #REGhl=#N(58975,4,,1)($)
  $8782 POKE #N(46870,4,,1)($),#REGl; POKE #N(46871,4,,1)($),#REGh
  $8785 #REGa=PEEK #N(23977,4,,1)($)
  $8788 CALL #R24942
  $878B Pop last item from stack into #REGaf
  $878C POKE (#REGix+#N(33,2,,1)($)),#REGa
  $878F CALL #R27920
  $8792 Pop last item from stack into #REGaf
  $8793 POKE #N(23846,4,,1)($),#REGa
  $8796 Pop last item from stack into #REGhl
  $8797 POKE #N(46870,4,,1)($),#REGl; POKE #N(46871,4,,1)($),#REGh
  $879A #REGhl=#N(2,4,,1)($)
  $879D #REGa=PEEK #N(23977,4,,1)($)
  $87A0 CALL #R26784
  $87A3 #REGhl=#N(5382,4,,1)($)
  $87A6 POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $87A9 #REGa=PEEK (#REGix+#N(13,2,,1)($))
  $87AC CALL #R26360
  $87AF #REGhl=#N(4355,4,,1)($)
  $87B2 POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $87B5 #REGa=PEEK (#REGix+#N(14,2,,1)($))
  $87B8 CALL #R26360
  $87BB #REGhl=#N(5376,4,,1)($)
  $87BE POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $87C1 #REGa=PEEK (#REGix+#N(15,2,,1)($))
  $87C4 CALL #R26360
  $87C7 #REGhl=#N(6147,4,,1)($)
  $87CA POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $87CD #REGa=PEEK (#REGix+#N(16,2,,1)($))
  $87D0 CALL #R26360
  $87D3 #REGa=0
  $87D4 POKE #N(23817,4,,1)($),#REGa
  $87D7 #REGhl=#N(3590,4,,1)($)
  $87DA POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $87DD #REGa=PEEK (#REGix+#N(17,2,,1)($))
  $87E0 CALL #R26360
  $87E3 #REGa=#N(8,2,,1)($)
  $87E5 POKE #N(23817,4,,1)($),#REGa
  $87E8 #REGa=#N(8,2,,1)($)
  $87EA POKE #N(23984,4,,1)($),#REGa
  $87ED #REGhl=#N(3336,4,,1)($)
  $87F0 POKE #N(23917,4,,1)($),#REGl; POKE #N(23918,4,,1)($),#REGh
  $87F3 #REGhl=#N(17990,4,,1)($)
  $87F6 POKE #N(23808,4,,1)($),#REGl; POKE #N(23809,4,,1)($),#REGh
  $87F9 #REGa=PEEK (#REGix+#N(18,2,,1)($))
  $87FC POKE #N(23296,4,,1)($),#REGa
  $87FF POKE #N(23297,4,,1)($),#REGa
  $8802 CALL #R34945
  $8805 #REGa=PEEK (#REGix+#N(19,2,,1)($))
  $8808 POKE #N(23298,4,,1)($),#REGa
  $880B POKE #N(23299,4,,1)($),#REGa
  $880E CALL #R34945
  $8811 #REGa=PEEK (#REGix+#N(21,2,,1)($))
  $8814 POKE #N(23300,4,,1)($),#REGa
  $8817 POKE #N(23301,4,,1)($),#REGa
  $881A CALL #R34945
  $881D #REGa=PEEK (#REGix+#N(20,2,,1)($))
  $8820 POKE #N(23302,4,,1)($),#REGa
  $8823 POKE #N(23303,4,,1)($),#REGa
  $8826 CALL #R34945
  $8829 #REGa=PEEK (#REGix+#N(7,2,,1)($))
  $882C POKE #N(23304,4,,1)($),#REGa
  $882F #REGa=PEEK (#REGix+#N(8,2,,1)($))
  $8832 POKE #N(23305,4,,1)($),#REGa
  $8835 CALL #R34945
  $8838 #REGa=PEEK (#REGix+#N(27,2,,1)($))
  $883B POKE #N(23306,4,,1)($),#REGa
  $883E #REGa=PEEK (#REGix+#N(6,2,,1)($))
  $8841 POKE #N(23307,4,,1)($),#REGa
  $8844 CALL #R34945
  $8847 #REGa=PEEK (#REGix+#N(11,2,,1)($))
  $884A POKE #N(23308,4,,1)($),#REGa
  $884D #REGa=PEEK (#REGix+#N(12,2,,1)($))
  $8850 POKE #N(23309,4,,1)($),#REGa
  $8853 CALL #R34945
  $8856 #REGa=PEEK (#REGix+#N(9,2,,1)($))
  $8859 POKE #N(23310,4,,1)($),#REGa
  $885C #REGa=PEEK (#REGix+#N(10,2,,1)($))
  $885F POKE #N(23311,4,,1)($),#REGa
  $8862 CALL #R34945
  $8865 #REGa=#N(58,2,,1)($)
  $8867 POKE #N(23978,4,,1)($),#REGa
  $886A #REGa=#N(120,2,,1)($)
  $886C POKE #N(23979,4,,1)($),#REGa
  $886F CALL #R34960
  $8872 CALL #R30711
  $8875 CALL #R24620
  $8878 CALL #R24874
  $887B CALL #R26501
  $887E Pop last item from stack into #REGix
  $8880 Return
c $8881
  $8881 #REGl=PEEK #N(23917,4,,1)($); #REGh=PEEK #N(23918,4,,1)($)
  $8884 POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $8887 CALL #R26360
  $888A #REGhl=#N(23917,4,,1)($)
  $888D POKE #REGhl,(PEEK #REGhl)+1
  $888E POKE #REGhl,(PEEK #REGhl)+1
  $888F Return
c $8890
  $8890 #REGa=0
  $8891 POKE #N(23974,4,,1)($),#REGa
  $8894 #REGhl=#N(23984,4,,1)($)
  $8897 #REGb=PEEK #REGhl
  $8898 #REGhl=#N(23296,4,,1)($)
  $889B POKE #N(23982,4,,1)($),#REGl; POKE #N(23983,4,,1)($),#REGh
  $889E #REGl=PEEK #N(23978,4,,1)($); #REGh=PEEK #N(23979,4,,1)($)
  $88A1 POKE #N(23980,4,,1)($),#REGl; POKE #N(23981,4,,1)($),#REGh
  $88A4 Push #REGbc onto the stack
  $88A5 #REGl=PEEK #N(23982,4,,1)($); #REGh=PEEK #N(23983,4,,1)($)
  $88A8 #REGb=PEEK #REGhl
  $88A9 #REGa=PEEK #REGhl
  $88AA Clear the carry flag and set the zero flag if #REGa=0
  $88AB Jump to #R35039 if #REGa=0
  $88AD Set the zero flag if #REGa=#N(127,2,,1)($), or the carry flag if #REGa<#N(127,2,,1)($)
  $88AF Jump to #R35000 if #REGa<#N(127,2,,1)($)
  $88B1 Shift #REGb right (copying bit 0 into the carry flag, and resetting bit 7)
  $88B3 Shift (#REGhl) right (copying bit 0 into the carry flag, and resetting bit 7)
  $88B5 #REGhl=#REGhl+1
  $88B6 Shift (#REGhl) right (copying bit 0 into the carry flag, and resetting bit 7)
  $88B8 #REGb=#REGb+1
  $88B9 #REGb=#REGb+1
  $88BA Push #REGbc onto the stack
  $88BB #REGa=PEEK #N(23981,4,,1)($)
  $88BE POKE #N(23972,4,,1)($),#REGa
  $88C1 #REGa=PEEK #N(23980,4,,1)($)
  $88C4 POKE #N(23971,4,,1)($),#REGa
  $88C7 CALL #R33868
  $88CA #REGa=PEEK #N(23980,4,,1)($)
  $88CD #REGa=#REGa+#N(11,2,,1)($)
  $88CF POKE #N(23971,4,,1)($),#REGa
  $88D2 CALL #R33868
  $88D5 Pop last item from stack into #REGbc
  $88D6 #REGhl=#N(23981,4,,1)($)
  $88D9 POKE #REGhl,(PEEK #REGhl)+1
  $88DA Decrement #REGb and jump to #R35002 if #REGb>0
  $88DC CALL #R35147
  $88DF Pop last item from stack into #REGbc
  $88E0 #REGl=PEEK #N(23982,4,,1)($); #REGh=PEEK #N(23983,4,,1)($)
  $88E3 #REGhl=#REGhl+1
  $88E4 #REGhl=#REGhl+1
  $88E5 POKE #N(23982,4,,1)($),#REGl; POKE #N(23983,4,,1)($),#REGh
  $88E8 #REGa=PEEK #N(23980,4,,1)($)
  $88EB #REGa=#REGa+#N(16,2,,1)($)
  $88ED POKE #N(23980,4,,1)($),#REGa
  $88F0 #REGa=PEEK #N(23979,4,,1)($)
  $88F3 POKE #N(23981,4,,1)($),#REGa
  $88F6 Decrement #REGb and jump to #R34980 if #REGb>0
  $88F8 #REGa=0
  $88F9 POKE #N(23985,4,,1)($),#REGa
  $88FC #REGl=PEEK #N(23978,4,,1)($); #REGh=PEEK #N(23979,4,,1)($)
  $88FF POKE #N(23980,4,,1)($),#REGl; POKE #N(23981,4,,1)($),#REGh
  $8902 #REGb=#N(128,2,,1)($)
  $8904 Push #REGbc onto the stack
  $8905 #REGhl=#N(23297,4,,1)($)
  $8908 POKE #N(23982,4,,1)($),#REGl; POKE #N(23983,4,,1)($),#REGh
  $890B #REGhl=#N(23984,4,,1)($)
  $890E #REGb=PEEK #REGhl
  $890F Push #REGbc onto the stack
  $8910 #REGl=PEEK #N(23982,4,,1)($); #REGh=PEEK #N(23983,4,,1)($)
  $8913 #REGa=PEEK #REGhl
  $8914 #REGhl=#N(23985,4,,1)($)
  $8917 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $8918 Jump to #R35107 if #REGa<PEEK #REGhl
  $891A #REGa=PEEK #N(23981,4,,1)($)
  $891D POKE #N(23972,4,,1)($),#REGa
  $8920 CALL #R35147
  $8923 Pop last item from stack into #REGbc
  $8924 #REGl=PEEK #N(23982,4,,1)($); #REGh=PEEK #N(23983,4,,1)($)
  $8927 #REGhl=#REGhl+1
  $8928 #REGhl=#REGhl+1
  $8929 POKE #N(23982,4,,1)($),#REGl; POKE #N(23983,4,,1)($),#REGh
  $892C #REGa=PEEK #N(23980,4,,1)($)
  $892F #REGa=#REGa+#N(16,2,,1)($)
  $8931 POKE #N(23980,4,,1)($),#REGa
  $8934 Decrement #REGb and jump to #R35087 if #REGb>0
  $8936 CALL #R25306
  $8939 Pop last item from stack into #REGbc
  $893A #REGhl=#N(23985,4,,1)($)
  $893D POKE #REGhl,(PEEK #REGhl)+1
  $893E #REGhl=#N(23981,4,,1)($)
  $8941 POKE #REGhl,(PEEK #REGhl)+1
  $8942 #REGa=PEEK #N(23978,4,,1)($)
  $8945 POKE #N(23980,4,,1)($),#REGa
  $8948 Decrement #REGb and jump to #R35076 if #REGb>0
  $894A Return
c $894B
  $894B #REGb=#N(12,2,,1)($)
  $894D #REGa=PEEK #N(23980,4,,1)($)
  $8950 POKE #N(23971,4,,1)($),#REGa
  $8953 Push #REGbc onto the stack
  $8954 CALL #R33868
  $8957 Pop last item from stack into #REGbc
  $8958 #REGhl=#N(23971,4,,1)($)
  $895B POKE #REGhl,(PEEK #REGhl)+1
  $895C Decrement #REGb and jump to #R35155 if #REGb>0
  $895E Return
c $895F
  $895F #REGh=#N(0,2,,1)($)
  $8961 #REGl=#REGa
  $8962 #REGhl=#REGhl+#REGhl
  $8963 #REGhl=#REGhl+#REGhl
  $8964 #REGhl=#REGhl+#REGhl
  $8965 #REGc=#N(0,2,,1)($)
  $8967 #REGd=#N(0,2,,1)($)
  $8969 #REGe=#REGb
  $896A #REGa=#REGb
  $896B Clear the carry flag and set the zero flag if #REGa=0
  $896C Return if #REGa=0
  $896D Clear the carry flag and set the zero flag if #REGa=0
  $896E #REGhl=#REGhl-carry-#REGde
  $8970 Return if the carry flag is set
  $8971 #REGc=#REGc+1
  $8972 Jump to #R35182
c $8974
  $8974 #REGl=PEEK #N(23986,4,,1)($); #REGh=PEEK #N(23987,4,,1)($)
  $8977 POKE #N(23988,4,,1)($),#REGl; POKE #N(23989,4,,1)($),#REGh
  $897A #REGa=PEEK #N(23972,4,,1)($)
  $897D POKE #REGhl,#REGa
  $897E #REGhl=#REGhl+1
  $897F #REGa=PEEK #N(23971,4,,1)($)
  $8982 POKE #REGhl,#REGa
  $8983 #REGhl=#REGhl+1
  $8984 POKE #N(23986,4,,1)($),#REGl; POKE #N(23987,4,,1)($),#REGh
  $8987 #REGa=PEEK #REGhl
  $8988 Set the zero flag if #REGa=#N(254,2,,1)($), or the carry flag if #REGa<#N(254,2,,1)($)
  $898A Jump to #R35218 if #REGa<>#N(254,2,,1)($)
  $898C #REGhl=#N(23296,4,,1)($)
  $898F POKE #N(23986,4,,1)($),#REGl; POKE #N(23987,4,,1)($),#REGh
  $8992 #REGa=0
  $8993 POKE #N(23974,4,,1)($),#REGa
  $8996 CALL #R33868
  $8999 #REGl=PEEK #N(23986,4,,1)($); #REGh=PEEK #N(23987,4,,1)($)
  $899C #REGa=PEEK #REGhl
  $899D POKE #N(23972,4,,1)($),#REGa
  $89A0 #REGhl=#REGhl+1
  $89A1 #REGa=PEEK #REGhl
  $89A2 POKE #N(23971,4,,1)($),#REGa
  $89A5 Set the zero flag if #REGa=#N(255,2,,1)($), or the carry flag if #REGa<#N(255,2,,1)($)
  $89A7 Return if #REGa=#N(255,2,,1)($)
  $89A8 #REGa=#N(1,2,,1)($)
  $89AA POKE #N(23974,4,,1)($),#REGa
  $89AD CALL #R33868
  $89B0 Return
c $89B1
  $89B1 CALL #R28874
  $89B4 #REGa=#N(1,2,,1)($)
  $89B6 POKE #N(23931,4,,1)($),#REGa
  $89B9 #REGa=#N(11,2,,1)($)
  $89BB POKE #N(23990,4,,1)($),#REGa
  $89BE #REGa=0
  $89BF POKE #N(23991,4,,1)($),#REGa
  $89C2 #REGa=PEEK #N(28825,4,,1)($)
  $89C5 Set the zero flag if #REGa=#N(176,2,,1)($), or the carry flag if #REGa<#N(176,2,,1)($)
  $89C7 CALL #R35427 if #REGa=#N(176,2,,1)($)
  $89CA #REGa=PEEK #N(28825,4,,1)($)
  $89CD Set the zero flag if #REGa=#N(255,2,,1)($), or the carry flag if #REGa<#N(255,2,,1)($)
  $89CF CALL #R35489 if #REGa=#N(255,2,,1)($)
  $89D2 #REGa=PEEK #N(28827,4,,1)($)
  $89D5 Set the zero flag if #REGa=#N(176,2,,1)($), or the carry flag if #REGa<#N(176,2,,1)($)
  $89D7 CALL #R35543 if #REGa=#N(176,2,,1)($)
  $89DA #REGa=PEEK #N(28827,4,,1)($)
  $89DD Set the zero flag if #REGa=#N(255,2,,1)($), or the carry flag if #REGa<#N(255,2,,1)($)
  $89DF CALL #R35610 if #REGa=#N(255,2,,1)($)
  $89E2 #REGa=PEEK #N(23991,4,,1)($)
  $89E5 Clear the carry flag and set the zero flag if #REGa=0
  $89E6 Jump to #R35360 if #REGa>0
  $89E9 #REGa=PEEK #N(28825,4,,1)($)
  $89EC POKE #N(23972,4,,1)($),#REGa
  $89EF #REGa=PEEK #N(28827,4,,1)($)
  $89F2 POKE #N(23971,4,,1)($),#REGa
  $89F5 #REGa=#N(254,2,,1)($)
  $89F7 POKE #N(23384,4,,1)($),#REGa
  $89FA POKE #N(23385,4,,1)($),#REGa
  $89FD CALL #R35188
  $8A00 #REGa=PEEK #N(23973,4,,1)($)
  $8A03 Clear the carry flag and set the zero flag if #REGa=0
  $8A04 Jump to #R35360 if #REGa>0
  $8A07 CALL #R36652
  $8A0A CALL #R29032
  $8A0D CALL #R35349
  $8A10 Jump to #R35360 if the carry flag is not set
  $8A12 Jump to #R35257
c $8A15
  $8A15 #REGl=PEEK #N(28849,4,,1)($); #REGh=PEEK #N(28850,4,,1)($)
  $8A18 #REGe=PEEK #N(28847,4,,1)($); #REGd=PEEK #N(28848,4,,1)($)
  $8A1C Clear the carry flag and set the zero flag if #REGa=0
  $8A1D #REGhl=#REGhl-carry-#REGde
  $8A1F Return
c $8A20
  $8A20 #REGa=#N(1,2,,1)($)
  $8A22 POKE #N(23974,4,,1)($),#REGa
  $8A25 #REGb=#N(44,2,,1)($)
  $8A27 Push #REGbc onto the stack
  $8A28 #REGl=PEEK #N(23986,4,,1)($); #REGh=PEEK #N(23987,4,,1)($)
  $8A2B #REGa=PEEK #REGhl
  $8A2C Set the zero flag if #REGa=#N(254,2,,1)($), or the carry flag if #REGa<#N(254,2,,1)($)
  $8A2E Jump to #R35382 if #REGa<>#N(254,2,,1)($)
  $8A30 #REGhl=#N(23296,4,,1)($)
  $8A33 POKE #N(23986,4,,1)($),#REGl; POKE #N(23987,4,,1)($),#REGh
  $8A36 #REGa=PEEK #REGhl
  $8A37 Set the zero flag if #REGa=#N(255,2,,1)($), or the carry flag if #REGa<#N(255,2,,1)($)
  $8A39 Jump to #R35401 if #REGa=#N(255,2,,1)($)
  $8A3B POKE #N(23972,4,,1)($),#REGa
  $8A3E #REGhl=#REGhl+1
  $8A3F #REGa=PEEK #REGhl
  $8A40 POKE #N(23971,4,,1)($),#REGa
  $8A43 CALL #R33868
  $8A46 CALL #R36652
  $8A49 #REGl=PEEK #N(23986,4,,1)($); #REGh=PEEK #N(23987,4,,1)($)
  $8A4C #REGhl=#REGhl+1
  $8A4D #REGhl=#REGhl+1
  $8A4E POKE #N(23986,4,,1)($),#REGl; POKE #N(23987,4,,1)($),#REGh
  $8A51 Pop last item from stack into #REGbc
  $8A52 Decrement #REGb and jump to #R35367 if #REGb>0
  $8A54 Return
c $8A55
  $8A55 #REGhl=#N(23296,4,,1)($)
  $8A58 #REGde=#N(23297,4,,1)($)
  $8A5B #REGbc=#N(87,4,,1)($)
  $8A5E POKE #REGhl,#N(255,2,,1)($)
  $8A60 POKE #REGde,PEEK #REGhl; #REGhl=#REGhl+1; #REGde=#REGde+1; #REGbc=#REGbc-1; repeat until #REGbc=0
  $8A62 Return
c $8A63
  $8A63 #REGa=PEEK #N(23805,4,,1)($)
  $8A66 Set the zero flag if #REGa=#N(69,2,,1)($), or the carry flag if #REGa<#N(69,2,,1)($)
  $8A68 Jump to #R35440 if #REGa<>#N(69,2,,1)($)
  $8A6A #REGa=#N(1,2,,1)($)
  $8A6C POKE #N(23991,4,,1)($),#REGa
  $8A6F Return
c $8A70
  $8A70 #REGa=#REGa+#N(11,2,,1)($)
  $8A72 Set the zero flag if #REGa=#N(69,2,,1)($), or the carry flag if #REGa<#N(69,2,,1)($)
  $8A74 Jump to #R35455 if #REGa<#N(69,2,,1)($)
  $8A76 #REGa=#N(69,2,,1)($)
  $8A78 #REGhl=#N(23805,4,,1)($)
  $8A7B #REGa=#REGa-PEEK #REGhl
  $8A7C POKE #N(23990,4,,1)($),#REGa
  $8A7F #REGa=PEEK #N(23990,4,,1)($)
  $8A82 #REGhl=#N(23805,4,,1)($)
  $8A85 #REGa=#REGa+PEEK #REGhl
  $8A86 POKE #REGhl,#REGa
  $8A87 #REGa=PEEK #N(23990,4,,1)($)
  $8A8A Shift #REGa left (copying bit 7 into the carry flag, and resetting bit 0)
  $8A8C Shift #REGa left (copying bit 7 into the carry flag, and resetting bit 0)
  $8A8E Shift #REGa left (copying bit 7 into the carry flag, and resetting bit 0)
  $8A90 Shift #REGa left (copying bit 7 into the carry flag, and resetting bit 0)
  $8A92 #REGb=#REGa
  $8A93 #REGa=PEEK #N(28825,4,,1)($)
  $8A96 #REGa=#REGa-#REGb
  $8A97 POKE #N(28825,4,,1)($),#REGa
  $8A9A CALL #R35413
  $8A9D CALL #R24874
  $8AA0 Return
c $8AA1
  $8AA1 #REGa=PEEK #N(23805,4,,1)($)
  $8AA4 Clear the carry flag and set the zero flag if #REGa=0
  $8AA5 Jump to #R35500 if #REGa>0
  $8AA7 #REGa=#REGa+1
  $8AA8 POKE #N(23991,4,,1)($),#REGa
  $8AAB Return
c $8AAC
  $8AAC #REGa=#REGa-#N(11,2,,1)($)
  $8AAE Jump to #R35510 if the carry flag is not set
  $8AB0 #REGa=PEEK #N(23805,4,,1)($)
  $8AB3 POKE #N(23990,4,,1)($),#REGa
  $8AB6 #REGa=PEEK #N(23805,4,,1)($)
  $8AB9 #REGhl=#N(23990,4,,1)($)
  $8ABC #REGa=#REGa-PEEK #REGhl
  $8ABD POKE #N(23805,4,,1)($),#REGa
  $8AC0 #REGa=PEEK #N(23990,4,,1)($)
  $8AC3 Shift #REGa left (copying bit 7 into the carry flag, and resetting bit 0)
  $8AC5 Shift #REGa left (copying bit 7 into the carry flag, and resetting bit 0)
  $8AC7 Shift #REGa left (copying bit 7 into the carry flag, and resetting bit 0)
  $8AC9 Shift #REGa left (copying bit 7 into the carry flag, and resetting bit 0)
  $8ACB #REGhl=#N(28825,4,,1)($)
  $8ACE #REGa=#REGa+PEEK #REGhl
  $8ACF POKE #REGhl,#REGa
  $8AD0 CALL #R35413
  $8AD3 CALL #R24874
  $8AD6 Return
c $8AD7
  $8AD7 #REGa=PEEK #N(23804,4,,1)($)
  $8ADA Set the zero flag if #REGa=#N(39,2,,1)($), or the carry flag if #REGa<#N(39,2,,1)($)
  $8ADC Jump to #R35556 if #REGa<>#N(39,2,,1)($)
  $8ADE #REGa=#N(1,2,,1)($)
  $8AE0 POKE #N(23991,4,,1)($),#REGa
  $8AE3 Return
c $8AE4
  $8AE4 #REGa=PEEK #N(23804,4,,1)($)
  $8AE7 #REGa=#REGa+#N(11,2,,1)($)
  $8AE9 Set the zero flag if #REGa=#N(39,2,,1)($), or the carry flag if #REGa<#N(39,2,,1)($)
  $8AEB Jump to #R35574 if #REGa<#N(39,2,,1)($)
  $8AED #REGa=#N(39,2,,1)($)
  $8AEF #REGhl=#N(23804,4,,1)($)
  $8AF2 #REGa=#REGa-PEEK #REGhl
  $8AF3 POKE #N(23990,4,,1)($),#REGa
  $8AF6 #REGa=PEEK #N(23990,4,,1)($)
  $8AF9 #REGhl=#N(23804,4,,1)($)
  $8AFC #REGa=#REGa+PEEK #REGhl
  $8AFD POKE #N(23804,4,,1)($),#REGa
  $8B00 #REGa=PEEK #N(23990,4,,1)($)
  $8B03 Shift #REGa left (copying bit 7 into the carry flag, and resetting bit 0)
  $8B05 Shift #REGa left (copying bit 7 into the carry flag, and resetting bit 0)
  $8B07 Shift #REGa left (copying bit 7 into the carry flag, and resetting bit 0)
  $8B09 Shift #REGa left (copying bit 7 into the carry flag, and resetting bit 0)
  $8B0B #REGb=#REGa
  $8B0C #REGa=PEEK #N(28827,4,,1)($)
  $8B0F #REGa=#REGa-#REGb
  $8B10 POKE #N(28827,4,,1)($),#REGa
  $8B13 CALL #R35413
  $8B16 CALL #R24874
  $8B19 Return
c $8B1A
  $8B1A #REGa=PEEK #N(23804,4,,1)($)
  $8B1D Clear the carry flag and set the zero flag if #REGa=0
  $8B1E Jump to #R35621 if #REGa>0
  $8B20 #REGa=#REGa+1
  $8B21 POKE #N(23991,4,,1)($),#REGa
  $8B24 Return
c $8B25
  $8B25 #REGa=#REGa-#N(11,2,,1)($)
  $8B27 Jump to #R35631 if the carry flag is not set
  $8B29 #REGa=PEEK #N(23804,4,,1)($)
  $8B2C POKE #N(23990,4,,1)($),#REGa
  $8B2F #REGa=PEEK #N(23804,4,,1)($)
  $8B32 #REGhl=#N(23990,4,,1)($)
  $8B35 #REGa=#REGa-PEEK #REGhl
  $8B36 POKE #N(23804,4,,1)($),#REGa
  $8B39 #REGa=PEEK #N(23990,4,,1)($)
  $8B3C Shift #REGa left (copying bit 7 into the carry flag, and resetting bit 0)
  $8B3E Shift #REGa left (copying bit 7 into the carry flag, and resetting bit 0)
  $8B40 Shift #REGa left (copying bit 7 into the carry flag, and resetting bit 0)
  $8B42 Shift #REGa left (copying bit 7 into the carry flag, and resetting bit 0)
  $8B44 #REGhl=#N(28827,4,,1)($)
  $8B47 #REGa=#REGa+PEEK #REGhl
  $8B48 POKE #REGhl,#REGa
  $8B49 CALL #R35413
  $8B4C CALL #R24874
  $8B4F Return
s $8B50
c $8B52
  $8B52 #REGbc=#N(65280,4,,1)($)
  $8B55 Do nothing
  $8B56 Do nothing
  $8B57 #REGbc=#N(65280,4,,1)($)
  $8B5A POKE #REGbc,#REGa
  $8B5B Do nothing
  $8B5C Set the zero flag if #REGa=0, and reset the carry flag
  $8B5E Do nothing
  $8B5F POKE #REGbc,#REGa
  $8B60 Do nothing
  $8B61 Set the zero flag if #REGa=#N(3,2,,1)($), or the carry flag if #REGa<#N(3,2,,1)($)
  $8B63 Do nothing
  $8B64
  $8B66 Do nothing
  $8B67 #REGbc=#REGbc+1
  $8B68 Do nothing
  $8B69
  $8B6B Do nothing
  $8B6C CALL #R0 if the sign flag is set (negative)
  $8B6F #REGb=#REGb+1
  $8B70 Do nothing
  $8B71 CALL #R5 if the sign flag is set (negative)
  $8B74 Enable interrupts
  $8B75 Do nothing
  $8B76 Do nothing
  $8B77 #REGb=#REGb-1
  $8B78 Do nothing
  $8B79 Enable interrupts
  $8B7A #REGa=#N(2,2,,1)($)
  $8B7C POKE #N(23974,4,,1)($),#REGa
  $8B7F #REGhl=#N(35664,4,,1)($)
  $8B82 POKE #N(23992,4,,1)($),#REGl; POKE #N(23993,4,,1)($),#REGh
  $8B85 #REGb=#N(21,2,,1)($)
  $8B87 Push #REGbc onto the stack
  $8B88 #REGl=PEEK #N(23992,4,,1)($); #REGh=PEEK #N(23993,4,,1)($)
  $8B8B #REGe=PEEK #REGhl
  $8B8C #REGhl=#REGhl+1
  $8B8D #REGd=PEEK #REGhl
  $8B8E #REGhl=#REGhl+1
  $8B8F POKE #N(23992,4,,1)($),#REGl; POKE #N(23993,4,,1)($),#REGh
  $8B92 #REGa=PEEK #N(23826,4,,1)($)
  $8B95 #REGa=#REGa+#REGd
  $8B96 POKE #N(23972,4,,1)($),#REGa
  $8B99 #REGa=PEEK #N(23825,4,,1)($)
  $8B9C #REGa=#REGa+#REGe
  $8B9D POKE #N(23971,4,,1)($),#REGa
  $8BA0 CALL #R33868
  $8BA3 Pop last item from stack into #REGbc
  $8BA4 Decrement #REGb and jump to #R35719 if #REGb>0
  $8BA6 Return
c $8BA7
  $8BA7 #REGa=PEEK #N(23805,4,,1)($)
  $8BAA #REGh=#N(0,2,,1)($)
  $8BAC #REGl=#REGa
  $8BAD #REGhl=#REGhl+#REGhl
  $8BAE #REGhl=#REGhl+#REGhl
  $8BAF #REGhl=#REGhl+#REGhl
  $8BB0 #REGhl=#REGhl+#REGhl
  $8BB1 #REGa=PEEK #N(23826,4,,1)($)
  $8BB4 #REGd=#N(0,2,,1)($)
  $8BB6 #REGe=#REGa
  $8BB7 #REGhl=#REGhl+#REGde
  $8BB8 POKE #N(24009,4,,1)($),#REGl; POKE #N(24010,4,,1)($),#REGh
  $8BBB #REGa=PEEK #N(23804,4,,1)($)
  $8BBE #REGh=#N(0,2,,1)($)
  $8BC0 #REGl=#REGa
  $8BC1 #REGhl=#REGhl+#REGhl
  $8BC2 #REGhl=#REGhl+#REGhl
  $8BC3 #REGhl=#REGhl+#REGhl
  $8BC4 #REGhl=#REGhl+#REGhl
  $8BC5 #REGa=PEEK #N(23825,4,,1)($)
  $8BC8 #REGd=#N(0,2,,1)($)
  $8BCA #REGe=#REGa
  $8BCB #REGhl=#REGhl+#REGde
  $8BCC POKE #N(24011,4,,1)($),#REGl; POKE #N(24012,4,,1)($),#REGh
  $8BCF Return
c $8BD0
  $8BD0 #REGhl=#N(24013,4,,1)($)
  $8BD3 #REGb=PEEK #REGhl
  $8BD4 #REGa=#N(85,2,,1)($)
  $8BD6 #REGa=#REGa+#REGb
  $8BD7 Shift #REGb right (copying bit 0 into the carry flag, and resetting bit 7)
  $8BD9 #REGa=#REGa+#REGb
  $8BDA POKE #N(23963,4,,1)($),#REGa
  $8BDD CALL #R32945
  $8BE0 #REGa=#REGa+#N(20,2,,1)($)
  $8BE2 #REGd=#N(0,2,,1)($)
  $8BE4 #REGe=#REGa
  $8BE5 #REGl=PEEK #N(24016,4,,1)($); #REGh=PEEK #N(24017,4,,1)($)
  $8BE8 Shift #REGh right (copying bit 0 into the carry flag, and resetting bit 7)
  $8BEA Rotate #REGl right through the carry flag
  $8BEC Shift #REGh right (copying bit 0 into the carry flag, and resetting bit 7)
  $8BEE Rotate #REGl right through the carry flag
  $8BF0 Shift #REGh right (copying bit 0 into the carry flag, and resetting bit 7)
  $8BF2 Rotate #REGl right through the carry flag
  $8BF4 #REGc=#N(0,2,,1)($)
  $8BF6 Clear the carry flag and set the zero flag if #REGa=0
  $8BF7 #REGhl=#REGhl-carry-#REGde
  $8BF9 Jump to #R35838 if the carry flag is set
  $8BFB #REGc=#REGc+1
  $8BFC Jump to #R35830
c $8BFE
  $8BFE #REGhl=#REGhl+#REGde
  $8BFF Shift #REGd right (copying bit 0 into the carry flag, and resetting bit 7)
  $8C01 Rotate #REGe right through the carry flag
  $8C03 Clear the carry flag and set the zero flag if #REGa=0
  $8C04 #REGhl=#REGhl-carry-#REGde
  $8C06 Jump to #R35849 if the carry flag is not set
  $8C08 #REGc=#REGc+1
  $8C09 #REGd=#N(0,2,,1)($)
  $8C0B #REGe=#REGc
  $8C0C #REGl=PEEK #N(24018,4,,1)($); #REGh=PEEK #N(24019,4,,1)($)
  $8C0F #REGa=#N(100,2,,1)($)
  $8C11 POKE #N(23963,4,,1)($),#REGa
  $8C14 CALL #R32945
  $8C17 Set the zero flag if #REGa=#N(50,2,,1)($), or the carry flag if #REGa<#N(50,2,,1)($)
  $8C19 Jump to #R35869 if #REGa<#N(50,2,,1)($)
  $8C1B #REGhl=#REGhl+#REGde
  $8C1C Return
c $8C1D
  $8C1D Clear the carry flag and set the zero flag if #REGa=0
  $8C1E #REGhl=#REGhl-carry-#REGde
  $8C20 Return if the carry flag is not set
  $8C21 #REGhl=#N(0,4,,1)($)
  $8C24 Return
c $8C25
  $8C25 #REGa=PEEK #N(28827,4,,1)($)
  $8C28 Shift #REGa right (copying bit 0 into the carry flag, and resetting bit 7)
  $8C2A Shift #REGa right (copying bit 0 into the carry flag, and resetting bit 7)
  $8C2C Shift #REGa right (copying bit 0 into the carry flag, and resetting bit 7)
  $8C2E Shift #REGa right (copying bit 0 into the carry flag, and resetting bit 7)
  $8C30 POKE #N(23825,4,,1)($),#REGa
  $8C33 #REGa=PEEK #N(28825,4,,1)($)
  $8C36 Shift #REGa right (copying bit 0 into the carry flag, and resetting bit 7)
  $8C38 Shift #REGa right (copying bit 0 into the carry flag, and resetting bit 7)
  $8C3A Shift #REGa right (copying bit 0 into the carry flag, and resetting bit 7)
  $8C3C Shift #REGa right (copying bit 0 into the carry flag, and resetting bit 7)
  $8C3E POKE #N(23826,4,,1)($),#REGa
  $8C41 #REGl=PEEK #N(23804,4,,1)($); #REGh=PEEK #N(23805,4,,1)($)
  $8C44 #REGe=PEEK #N(23825,4,,1)($); #REGd=PEEK #N(23826,4,,1)($)
  $8C48 #REGhl=#REGhl+#REGde
  $8C49 POKE #N(23866,4,,1)($),#REGl; POKE #N(23867,4,,1)($),#REGh
  $8C4C Exchange #REGde and #REGhl
  $8C4D CALL #R24850
  $8C50 POKE #N(23870,4,,1)($),#REGl; POKE #N(23871,4,,1)($),#REGh
  $8C53 Return
c $8C54
  $8C54 #REGa=PEEK #N(23825,4,,1)($)
  $8C57 Shift #REGa right (copying bit 0 into the carry flag, and resetting bit 7)
  $8C59 Shift #REGa right (copying bit 0 into the carry flag, and resetting bit 7)
  $8C5B Shift #REGa right (copying bit 0 into the carry flag, and resetting bit 7)
  $8C5D Shift #REGa right (copying bit 0 into the carry flag, and resetting bit 7)
  $8C5F #REGe=#REGa
  $8C60 #REGa=PEEK #N(23826,4,,1)($)
  $8C63 Shift #REGa right (copying bit 0 into the carry flag, and resetting bit 7)
  $8C65 Shift #REGa right (copying bit 0 into the carry flag, and resetting bit 7)
  $8C67 Shift #REGa right (copying bit 0 into the carry flag, and resetting bit 7)
  $8C69 Shift #REGa right (copying bit 0 into the carry flag, and resetting bit 7)
  $8C6B #REGd=#REGa
  $8C6C #REGl=PEEK #N(23804,4,,1)($); #REGh=PEEK #N(23805,4,,1)($)
  $8C6F #REGhl=#REGhl+#REGde
  $8C70 POKE #N(23881,4,,1)($),#REGl; POKE #N(23882,4,,1)($),#REGh
  $8C73 Exchange #REGde and #REGhl
  $8C74 CALL #R24850
  $8C77 #REGb=PEEK #REGhl
  $8C78 #REGa=PEEK #N(23846,4,,1)($)
  $8C7B Set the zero flag if #REGa=#REGb, or the carry flag if #REGa<#REGb
  $8C7C Return
c $8C7D
  $8C7D #REGa=0
  $8C7E POKE #N(24040,4,,1)($),#REGa
  $8C81 #REGixl=PEEK #N(23859,4,,1)($); #REGixh=PEEK #N(23860,4,,1)($)
  $8C85 #REGa=#N(1,2,,1)($)
  $8C87 POKE #N(46875,4,,1)($),#REGa
  $8C8A #REGl=PEEK #N(23804,4,,1)($); #REGh=PEEK #N(23805,4,,1)($)
  $8C8D POKE #N(23996,4,,1)($),#REGl; POKE #N(23997,4,,1)($),#REGh
  $8C90 #REGl=PEEK #N(23825,4,,1)($); #REGh=PEEK #N(23826,4,,1)($)
  $8C93 POKE #N(24000,4,,1)($),#REGl; POKE #N(24001,4,,1)($),#REGh
  $8C96 #REGa=PEEK #N(23826,4,,1)($)
  $8C99 Shift #REGa left (copying bit 7 into the carry flag, and resetting bit 0)
  $8C9B Shift #REGa left (copying bit 7 into the carry flag, and resetting bit 0)
  $8C9D Shift #REGa left (copying bit 7 into the carry flag, and resetting bit 0)
  $8C9F Shift #REGa left (copying bit 7 into the carry flag, and resetting bit 0)
  $8CA1 #REGa=#REGa+#N(8,2,,1)($)
  $8CA3 POKE #N(23998,4,,1)($),#REGa
  $8CA6 POKE #N(23826,4,,1)($),#REGa
  $8CA9 #REGa=PEEK #N(23825,4,,1)($)
  $8CAC Shift #REGa left (copying bit 7 into the carry flag, and resetting bit 0)
  $8CAE Shift #REGa left (copying bit 7 into the carry flag, and resetting bit 0)
  $8CB0 Shift #REGa left (copying bit 7 into the carry flag, and resetting bit 0)
  $8CB2 Shift #REGa left (copying bit 7 into the carry flag, and resetting bit 0)
  $8CB4 #REGa=#REGa+#N(8,2,,1)($)
  $8CB6 POKE #N(23999,4,,1)($),#REGa
  $8CB9 POKE #N(23825,4,,1)($),#REGa
  $8CBC CALL #R35751
  $8CBF #REGl=PEEK #N(24009,4,,1)($); #REGh=PEEK #N(24010,4,,1)($)
  $8CC2 POKE #N(28817,4,,1)($),#REGl; POKE #N(28818,4,,1)($),#REGh
  $8CC5 POKE #N(24024,4,,1)($),#REGl; POKE #N(24025,4,,1)($),#REGh
  $8CC8 #REGl=PEEK #N(24011,4,,1)($); #REGh=PEEK #N(24012,4,,1)($)
  $8CCB POKE #N(28819,4,,1)($),#REGl; POKE #N(28820,4,,1)($),#REGh
  $8CCE POKE #N(24022,4,,1)($),#REGl; POKE #N(24023,4,,1)($),#REGh
  $8CD1 #REGa=#N(167,2,,1)($)
  $8CD3 POKE #N(46872,4,,1)($),#REGa
  $8CD6 #REGa=#N(8,2,,1)($)
  $8CD8 POKE #N(46873,4,,1)($),#REGa
  $8CDB #REGhl=#N(59295,4,,1)($)
  $8CDE POKE #N(46870,4,,1)($),#REGl; POKE #N(46871,4,,1)($),#REGh
  $8CE1 #REGixl=PEEK #N(24002,4,,1)($); #REGixh=PEEK #N(24003,4,,1)($)
  $8CE5 #REGa=0
  $8CE6 #REGiyl=PEEK #N(23859,4,,1)($); #REGiyh=PEEK #N(23860,4,,1)($)
  $8CEA Set the zero flag if bit 1 of (#REGix+#N(0,2,,1)($)) is 0
  $8CEE Jump to #R36090 if bit 1 of PEEK (#REGix+#N(0,2,,1)($)) is reset
  $8CF0 #REGa=PEEK (#REGiy+#N(18,2,,1)($))
  $8CF3 #REGb=PEEK (#REGix+#N(19,2,,1)($))
  $8CF6 CALL #R27417
  $8CF9 #REGa=#REGc
  $8CFA POKE #N(24021,4,,1)($),#REGa
  $8CFD #REGhl=#N(24021,4,,1)($)
  $8D00 #REGb=PEEK #REGhl
  $8D01 Shift #REGb right (copying bit 0 into the carry flag, and resetting bit 7)
  $8D03 Shift #REGb right (copying bit 0 into the carry flag, and resetting bit 7)
  $8D05 #REGa=PEEK (#REGix+#N(14,2,,1)($))
  $8D08 CALL #R36216
  $8D0B POKE #N(24031,4,,1)($),#REGa
  $8D0E #REGhl=#N(24021,4,,1)($)
  $8D11 #REGb=PEEK #REGhl
  $8D12 Shift #REGb right (copying bit 0 into the carry flag, and resetting bit 7)
  $8D14 #REGa=PEEK (#REGix+#N(10,2,,1)($))
  $8D17 CALL #R36216
  $8D1A POKE #N(24033,4,,1)($),#REGa
  $8D1D #REGhl=#N(24021,4,,1)($)
  $8D20 #REGb=PEEK #REGhl
  $8D21 #REGa=PEEK (#REGix+#N(12,2,,1)($))
  $8D24 CALL #R36216
  $8D27 POKE #N(24035,4,,1)($),#REGa
  $8D2A #REGa=PEEK (#REGix+#N(13,2,,1)($))
  $8D2D Clear the carry flag and set the zero flag if #REGa=0
  $8D2E Jump to #R36159 if #REGa=0
  $8D30 #REGa=PEEK (#REGiy+#N(5,2,,1)($))
  $8D33 #REGb=PEEK (#REGix+#N(13,2,,1)($))
  $8D36 CALL #R35167
  $8D39 #REGa=#REGc
  $8D3A Clear the carry flag and set the zero flag if #REGa=0
  $8D3B Jump to #R36159 if #REGa>0
  $8D3D #REGa=#N(1,2,,1)($)
  $8D3F POKE #N(24032,4,,1)($),#REGa
  $8D42 #REGa=PEEK (#REGiy+#N(5,2,,1)($))
  $8D45 #REGb=PEEK (#REGix+#N(9,2,,1)($))
  $8D48 CALL #R35167
  $8D4B #REGa=#REGc
  $8D4C POKE #N(24034,4,,1)($),#REGa
  $8D4F #REGa=PEEK (#REGiy+#N(5,2,,1)($))
  $8D52 #REGb=PEEK (#REGix+#N(11,2,,1)($))
  $8D55 CALL #R35167
  $8D58 #REGa=#REGc
  $8D59 POKE #N(24036,4,,1)($),#REGa
  $8D5C #REGa=PEEK (#REGiy+#N(21,2,,1)($))
  $8D5F POKE #N(24037,4,,1)($),#REGa
  $8D62 #REGa=PEEK (#REGiy+#N(5,2,,1)($))
  $8D65 #REGb=#N(5,2,,1)($)
  $8D67 CALL #R27417
  $8D6A #REGa=#REGc
  $8D6B POKE #N(24038,4,,1)($),#REGa
  $8D6E Set the zero flag if bit 1 of (#REGiy+#N(37,2,,1)($)) is 0
  $8D72 Return if bit 1 of PEEK (#REGiy+#N(37,2,,1)($)) is reset
  $8D73 #REGa=0
  $8D74 POKE #N(24038,4,,1)($),#REGa
  $8D77 Return
c $8D78
  $8D78 #REGa=#REGa+#REGb
  $8D79 Set the zero flag if #REGa=#N(100,2,,1)($), or the carry flag if #REGa<#N(100,2,,1)($)
  $8D7B Return if #REGa<#N(100,2,,1)($)
  $8D7C #REGa=#N(100,2,,1)($)
  $8D7E Return
c $8D7F
  $8D7F CALL #R27085
  $8D82 #REGa=#N(76,2,,1)($)
  $8D84 CALL #R26462
  $8D87 #REGhl=#N(6144,4,,1)($)
  $8D8A #REGa=PEEK #N(24039,4,,1)($)
  $8D8D CALL #R26784
  $8D90 CALL #R36321
  $8D93 #REGb=#N(4,2,,1)($)
  $8D95 #REGhl=#N(6154,4,,1)($)
  $8D98 POKE #N(23813,4,,1)($),#REGl; POKE #N(23814,4,,1)($),#REGh
  $8D9B #REGhl=#N(24031,4,,1)($)
  $8D9E POKE #N(23917,4,,1)($),#REGl; POKE #N(23918,4,,1)($),#REGh
  $8DA1 Push #REGbc onto the stack
  $8DA2 #REGl=PEEK #N(23917,4,,1)($); #REGh=PEEK #N(23918,4,,1)($)
  $8DA5 #REGhl=#REGhl+1
  $8DA6 #REGa=PEEK #REGhl
  $8DA7 Clear the carry flag and set the zero flag if #REGa=0
  $8DA8 Jump to #R36273 if #REGa>0
  $8DAA #REGa=#N(77,2,,1)($)
  $8DAC CALL #R26462
  $8DAF Jump to #R36299
c $8DB1
  $8DB1 #REGhl=#REGhl-1
  $8DB2 #REGa=PEEK #REGhl
  $8DB3 #REGl=PEEK #N(23813,4,,1)($); #REGh=PEEK #N(23814,4,,1)($)
  $8DB6 CALL #R33591
  $8DB9 #REGl=PEEK #N(23813,4,,1)($); #REGh=PEEK #N(23814,4,,1)($)
  $8DBC #REGde=#N(1280,4,,1)($)
  $8DBF #REGhl=#REGhl+#REGde
  $8DC0 POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $8DC3 #REGl=PEEK #N(23917,4,,1)($); #REGh=PEEK #N(23918,4,,1)($)
  $8DC6 #REGhl=#REGhl+1
  $8DC7 #REGa=PEEK #REGhl
  $8DC8 CALL #R26360
  $8DCB Pop last item from stack into #REGbc
  $8DCC #REGl=PEEK #N(23917,4,,1)($); #REGh=PEEK #N(23918,4,,1)($)
  $8DCF #REGhl=#REGhl+1
  $8DD0 #REGhl=#REGhl+1
  $8DD1 POKE #N(23917,4,,1)($),#REGl; POKE #N(23918,4,,1)($),#REGh
  $8DD4 #REGl=PEEK #N(23813,4,,1)($); #REGh=PEEK #N(23814,4,,1)($)
  $8DD7 #REGde=#N(4,4,,1)($)
  $8DDA #REGhl=#REGhl+#REGde
  $8DDB POKE #N(23813,4,,1)($),#REGl; POKE #N(23814,4,,1)($),#REGh
  $8DDE Decrement #REGb and jump to #R36257 if #REGb>0
  $8DE0 Return
c $8DE1
  $8DE1 #REGiyl=PEEK #N(23859,4,,1)($); #REGiyh=PEEK #N(23860,4,,1)($)
  $8DE5 #REGa=#N(8,2,,1)($)
  $8DE7 POKE #N(23817,4,,1)($),#REGa
  $8DEA #REGhl=#N(17990,4,,1)($)
  $8DED POKE #N(23808,4,,1)($),#REGl; POKE #N(23809,4,,1)($),#REGh
  $8DF0 #REGhl=#N(7172,4,,1)($)
  $8DF3 POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $8DF6 #REGa=PEEK (#REGiy+#N(6,2,,1)($))
  $8DF9 CALL #R26360
  $8DFC #REGhl=#N(7174,4,,1)($)
  $8DFF POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $8E02 #REGa=PEEK (#REGiy+#N(36,2,,1)($))
  $8E05 CALL #R26360
  $8E08 Return
c $8E09
  $8E09 #REGa=PEEK (#REGix+#N(35,2,,1)($))
  $8E0C POKE #N(24039,4,,1)($),#REGa
  $8E0F CALL #R26591
  $8E12 POKE #N(24002,4,,1)($),#REGixl; POKE #N(24003,4,,1)($),#REGixh
  $8E16 CALL #R35965
  $8E19 CALL #R24874
  $8E1C CALL #R36223
  $8E1F #REGa=0
  $8E20 POKE #N(23834,4,,1)($),#REGa
  $8E23 #REGa=#REGa+1
  $8E24 POKE #N(23831,4,,1)($),#REGa
  $8E27 CALL #R25109
  $8E2A #REGa=PEEK #N(23850,4,,1)($)
  $8E2D Set the zero flag if bit 0 of #REGa is 0
  $8E2F Jump to #R36391 if bit 0 of #REGa is set
  $8E31 CALL #R35924
  $8E34 Jump to #R36439 if the zero flag is set
  $8E36 #REGl=PEEK #N(23844,4,,1)($); #REGh=PEEK #N(23845,4,,1)($)
  $8E39 POKE #N(23879,4,,1)($),#REGl; POKE #N(23880,4,,1)($),#REGh
  $8E3C #REGixl=PEEK #N(23859,4,,1)($); #REGixh=PEEK #N(23860,4,,1)($)
  $8E40 CALL #R29478
  $8E43 Clear the carry flag and set the zero flag if #REGa=0
  $8E44 Jump to #R36439 if #REGa=0
  $8E46 CALL #R24874
  $8E49 #REGa=#N(103,2,,1)($)
  $8E4B CALL #R28012
  $8E4E CALL #R36223
  $8E51 #REGa=0
  $8E52 POKE #N(23834,4,,1)($),#REGa
  $8E55 Jump to #R36391
c $8E57
  $8E57 CALL #R27118
  $8E5A #REGhl=#N(17990,4,,1)($)
  $8E5D POKE #N(23808,4,,1)($),#REGl; POKE #N(23809,4,,1)($),#REGh
  $8E60 CALL #R35924
  $8E63 Jump to #R36516 if the zero flag is set
  $8E65 #REGa=PEEK #N(24032,4,,1)($)
  $8E68 Clear the carry flag and set the zero flag if #REGa=0
  $8E69 Jump to #R36468 if #REGa=0
  $8E6B #REGa=0
  $8E6C CALL #R27152
  $8E6F #REGa=#N(71,2,,1)($)
  $8E71 CALL #R26476
  $8E74 #REGa=PEEK #N(24034,4,,1)($)
  $8E77 Clear the carry flag and set the zero flag if #REGa=0
  $8E78 Jump to #R36484 if #REGa=0
  $8E7A #REGa=#N(1,2,,1)($)
  $8E7C CALL #R27152
  $8E7F #REGa=#N(72,2,,1)($)
  $8E81 CALL #R26476
  $8E84 #REGa=PEEK #N(24036,4,,1)($)
  $8E87 Clear the carry flag and set the zero flag if #REGa=0
  $8E88 Jump to #R36500 if #REGa=0
  $8E8A #REGa=#N(2,2,,1)($)
  $8E8C CALL #R27152
  $8E8F #REGa=#N(73,2,,1)($)
  $8E91 CALL #R26476
  $8E94 #REGa=PEEK #N(24038,4,,1)($)
  $8E97 Clear the carry flag and set the zero flag if #REGa=0
  $8E98 Jump to #R36516 if #REGa=0
  $8E9A #REGa=#N(74,2,,1)($)
  $8E9C CALL #R26476
  $8E9F #REGa=#N(3,2,,1)($)
  $8EA1 CALL #R27152
  $8EA4 CALL #R35924
  $8EA7 #REGa=PEEK #REGhl
  $8EA8 Set the zero flag if #REGa=#N(140,2,,1)($), or the carry flag if #REGa<#N(140,2,,1)($)
  $8EAA Jump to #R36537 if #REGa<#N(140,2,,1)($)
  $8EAC POKE #N(23977,4,,1)($),#REGa
  $8EAF #REGa=#N(4,2,,1)($)
  $8EB1 CALL #R27152
  $8EB4 #REGa=#N(8,2,,1)($)
  $8EB6 CALL #R26462
  $8EB9 #REGa=#N(75,2,,1)($)
  $8EBB CALL #R26462
  $8EBE #REGa=#N(5,2,,1)($)
  $8EC0 CALL #R27152
  $8EC3 #REGa=#N(6,2,,1)($)
  $8EC5 CALL #R27152
  $8EC8 CALL #R27245
  $8ECB CALL #R26820
  $8ECE #REGhl=#N(36581,4,,1)($)
  $8ED1 CALL #R27167
  $8ED4 #REGixl=PEEK #N(23859,4,,1)($); #REGixh=PEEK #N(23860,4,,1)($)
  $8ED8 #REGa=PEEK (#REGix+#N(8,2,,1)($))
  $8EDB Clear the carry flag and set the zero flag if #REGa=0
  $8EDC Jump to #R36596 if #REGa=0
  $8EDF CALL #R36223
  $8EE2 Jump to #R36391
c $8EE5
  $8EE5 POKE #N(37266,4,,1)($),#REGa
  $8EE8 #REGa=#REGa+carry+#REGa
  $8EE9 #REGa=#REGa+#REGl
  $8EEA #REGa=#REGa+carry+#REGa
  $8EEB #REGa=#REGa-carry-#REGh
  $8EEC #REGa=#REGa-carry-#REGd
  $8EED #REGhl=#N(62607,4,,1)($)
  $8EF0 #REGa=#REGa+carry+PEEK #REGhl
  $8EF1 Disable interrupts
  $8EF2 #REGa=#REGa+carry+PEEK #REGhl
  $8EF3 Return
c $8EF4
  $8EF4 #REGa=0
  $8EF5 POKE #N(46875,4,,1)($),#REGa
  $8EF8 #REGa=#N(10,2,,1)($)
  $8EFA POKE #N(46872,4,,1)($),#REGa
  $8EFD #REGa=0
  $8EFE POKE #N(46873,4,,1)($),#REGa
  $8F01 #REGl=PEEK #N(23996,4,,1)($); #REGh=PEEK #N(23997,4,,1)($)
  $8F04 POKE #N(23804,4,,1)($),#REGl; POKE #N(23805,4,,1)($),#REGh
  $8F07 #REGl=PEEK #N(24000,4,,1)($); #REGh=PEEK #N(24001,4,,1)($)
  $8F0A POKE #N(23825,4,,1)($),#REGl; POKE #N(23826,4,,1)($),#REGh
  $8F0D #REGhl=#N(58975,4,,1)($)
  $8F10 POKE #N(46870,4,,1)($),#REGl; POKE #N(46871,4,,1)($),#REGh
  $8F13 CALL #R24874
  $8F16 #REGixl=PEEK #N(23859,4,,1)($); #REGixh=PEEK #N(23860,4,,1)($)
  $8F1A #REGa=PEEK #N(24055,4,,1)($)
  $8F1D Clear the carry flag and set the zero flag if #REGa=0
  $8F1E Return if #REGa>0
  $8F1F Pop last item from stack into #REGhl
  $8F20 Return
c $8F21
  $8F21 CALL #R34637
  $8F24 #REGa=0
  $8F25 POKE #N(23834,4,,1)($),#REGa
  $8F28 POKE #N(23830,4,,1)($),#REGa
  $8F2B Return
c $8F2C
  $8F2C #REGhl=#N(0,4,,1)($)
  $8F2F POKE #N(23932,4,,1)($),#REGl; POKE #N(23933,4,,1)($),#REGh
  $8F32 #REGa=PEEK #N(23931,4,,1)($)
  $8F35 #REGd=#N(0,2,,1)($)
  $8F37 #REGe=#REGa
  $8F38 #REGl=PEEK #N(23932,4,,1)($); #REGh=PEEK #N(23933,4,,1)($)
  $8F3B #REGhl=#REGhl+#REGde
  $8F3C POKE #N(23932,4,,1)($),#REGl; POKE #N(23933,4,,1)($),#REGh
  $8F3F #REGde=#N(210,4,,1)($)
  $8F42 Clear the carry flag and set the zero flag if #REGa=0
  $8F43 #REGhl=#REGhl-carry-#REGde
  $8F45 Jump to #R36724 if the carry flag is not set
  $8F47 #REGa=#N(16,2,,1)($)
  $8F49 OUT #N(254,2,,1)($),#REGa
  $8F4B #REGa=PEEK #N(23931,4,,1)($)
  $8F4E #REGb=#REGa
  $8F4F Do nothing
  $8F50 Decrement #REGb and jump to #R36687 if #REGb>0
  $8F52 #REGa=0
  $8F53 OUT #N(254,2,,1)($),#REGa
  $8F55 #REGa=PEEK #N(23931,4,,1)($)
  $8F58 #REGb=#REGa
  $8F59 Do nothing
  $8F5A Decrement #REGb and jump to #R36697 if #REGb>0
  $8F5C #REGa=#REGr
  $8F5E Keep only bit 4 of #REGa
  $8F60 OUT #N(254,2,,1)($),#REGa
  $8F62 #REGhl=#N(23931,4,,1)($)
  $8F65 POKE #REGhl,(PEEK #REGhl)+1
  $8F66 POKE #REGhl,(PEEK #REGhl)+1
  $8F67 POKE #REGhl,(PEEK #REGhl)+1
  $8F68 #REGa=PEEK #REGhl
  $8F69 Set the zero flag if #REGa=#N(210,2,,1)($), or the carry flag if #REGa<#N(210,2,,1)($)
  $8F6B Jump to #R36658 if #REGa<#N(210,2,,1)($)
  $8F6D #REGa=#N(210,2,,1)($)
  $8F6F POKE #N(23931,4,,1)($),#REGa
  $8F72 Jump to #R36658
c $8F74
  $8F74 #REGb=#N(255,2,,1)($)
  $8F76 Decrement #REGb and jump to #R36726 if #REGb>0
  $8F78 Return
c $8F79
  $8F79 #REGa=PEEK #N(24031,4,,1)($)
  $8F7C POKE #N(24013,4,,1)($),#REGa
  $8F7F #REGa=PEEK #N(24032,4,,1)($)
  $8F82 #REGb=#REGa
  $8F83 Jump to #R36763
c $8F85
  $8F85 #REGa=PEEK #N(24035,4,,1)($)
  $8F88 POKE #N(24013,4,,1)($),#REGa
  $8F8B #REGa=PEEK #N(24036,4,,1)($)
  $8F8E #REGb=#REGa
  $8F8F Jump to #R36763
c $8F91
  $8F91 #REGa=PEEK #N(24033,4,,1)($)
  $8F94 POKE #N(24013,4,,1)($),#REGa
  $8F97 #REGa=PEEK #N(24034,4,,1)($)
  $8F9A #REGb=#REGa
  $8F9B #REGixl=PEEK #N(23859,4,,1)($); #REGixh=PEEK #N(23860,4,,1)($)
  $8F9F CALL #R27982
  $8FA2 Return if the carry flag is set
  $8FA3 CALL #R36803
  $8FA6 Return if the zero flag is set
  $8FA7 CALL #R39375
  $8FAA CALL #R36834
  $8FAD CALL #R36852
  $8FB0 CALL #R36865
  $8FB3 CALL #R36881
  $8FB6 CALL #R36931
  $8FB9 CALL #R37092
  $8FBC CALL #R28044
  $8FBF CALL #R37310
  $8FC2 Return
c $8FC3
  $8FC3 #REGixl=PEEK #N(23859,4,,1)($); #REGixh=PEEK #N(23860,4,,1)($)
  $8FC7 #REGa=PEEK (#REGix+#N(23,2,,1)($))
  $8FCA CALL #R26763
  $8FCD #REGa=PEEK (#REGiy+#N(4,2,,1)($))
  $8FD0 Clear the carry flag and set the zero flag if #REGa=0
  $8FD1 Jump to #R36827 if #REGa=0
  $8FD3 POKE (#REGiy+#N(4,2,,1)($)),(PEEK (#REGiy+#N(4,2,,1)($)))-1
  $8FD6 POKE (#REGix+#N(36,2,,1)($)),(PEEK (#REGix+#N(36,2,,1)($)))-1
  $8FD9 Clear the carry flag and set the zero flag if #REGa=0
  $8FDA Return
c $8FDB
  $8FDB #REGa=#N(78,2,,1)($)
  $8FDD CALL #R28012
  $8FE0 #REGa=0
  $8FE1 Return
c $8FE2
  $8FE2 #REGixl=PEEK #N(24002,4,,1)($); #REGixh=PEEK #N(24003,4,,1)($)
  $8FE6 #REGa=PEEK (#REGix+#N(18,2,,1)($))
  $8FE9 #REGh=#N(0,2,,1)($)
  $8FEB #REGl=#REGa
  $8FEC #REGhl=#REGhl+#REGhl
  $8FED #REGhl=#REGhl+#REGhl
  $8FEE #REGhl=#REGhl+#REGhl
  $8FEF #REGhl=#REGhl+#REGhl
  $8FF0 POKE #N(28847,4,,1)($),#REGl; POKE #N(28848,4,,1)($),#REGh
  $8FF3 Return
c $8FF4
  $8FF4 #REGl=PEEK #N(23825,4,,1)($); #REGh=PEEK #N(23826,4,,1)($)
  $8FF7 POKE #N(24007,4,,1)($),#REGl; POKE #N(24008,4,,1)($),#REGh
  $8FFA #REGl=PEEK #N(23804,4,,1)($); #REGh=PEEK #N(23805,4,,1)($)
  $8FFD POKE #N(24005,4,,1)($),#REGl; POKE #N(24006,4,,1)($),#REGh
  $9000 Return
c $9001
  $9001 CALL #R35751
  $9004 #REGl=PEEK #N(24009,4,,1)($); #REGh=PEEK #N(24010,4,,1)($)
  $9007 POKE #N(28821,4,,1)($),#REGl; POKE #N(28822,4,,1)($),#REGh
  $900A #REGl=PEEK #N(24011,4,,1)($); #REGh=PEEK #N(24012,4,,1)($)
  $900D POKE #N(28823,4,,1)($),#REGl; POKE #N(28824,4,,1)($),#REGh
  $9010 Return
c $9011
  $9011 #REGl=PEEK #N(23996,4,,1)($); #REGh=PEEK #N(23997,4,,1)($)
  $9014 POKE #N(23804,4,,1)($),#REGl; POKE #N(23805,4,,1)($),#REGh
  $9017 #REGa=PEEK #N(23998,4,,1)($)
  $901A POKE #N(28825,4,,1)($),#REGa
  $901D #REGa=PEEK #N(23999,4,,1)($)
  $9020 POKE #N(28827,4,,1)($),#REGa
  $9023 CALL #R24874
  $9026 #REGl=PEEK #N(24000,4,,1)($); #REGh=PEEK #N(24001,4,,1)($)
  $9029 #REGhl=#REGhl+#REGhl
  $902A #REGh=#REGh+1
  $902B #REGl=#REGl+1
  $902C POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $902F #REGa=0
  $9030 CALL #R24751
  $9033 CALL #R35413
  $9036 #REGhl=#N(23296,4,,1)($)
  $9039 POKE #N(23986,4,,1)($),#REGl; POKE #N(23987,4,,1)($),#REGh
  $903C #REGhl=#N(0,4,,1)($)
  $903F POKE #N(28849,4,,1)($),#REGl; POKE #N(28850,4,,1)($),#REGh
  $9042 Return
c $9043
  $9043 #REGa=#N(100,2,,1)($)
  $9045 POKE #N(23963,4,,1)($),#REGa
  $9048 CALL #R32945
  $904B #REGhl=#N(24013,4,,1)($)
  $904E Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $904F Return if #REGa<PEEK #REGhl
  $9050 #REGa=#REGa-PEEK #REGhl
  $9051 #REGa=#REGa+1
  $9052 POKE #N(24020,4,,1)($),#REGa
  $9055 #REGl=PEEK #N(28817,4,,1)($); #REGh=PEEK #N(28818,4,,1)($)
  $9058 #REGe=PEEK #N(28821,4,,1)($); #REGd=PEEK #N(28822,4,,1)($)
  $905C Clear the carry flag and set the zero flag if #REGa=0
  $905D #REGhl=#REGhl-carry-#REGde
  $905F Jump to #R36966 if the carry flag is set
  $9061 POKE #N(28829,4,,1)($),#REGl; POKE #N(28830,4,,1)($),#REGh
  $9064 Jump to #R36979
c $9066
  $9066 #REGl=PEEK #N(28821,4,,1)($); #REGh=PEEK #N(28822,4,,1)($)
  $9069 #REGe=PEEK #N(28817,4,,1)($); #REGd=PEEK #N(28818,4,,1)($)
  $906D Clear the carry flag and set the zero flag if #REGa=0
  $906E #REGhl=#REGhl-carry-#REGde
  $9070 POKE #N(28829,4,,1)($),#REGl; POKE #N(28830,4,,1)($),#REGh
  $9073 #REGl=PEEK #N(28819,4,,1)($); #REGh=PEEK #N(28820,4,,1)($)
  $9076 #REGe=PEEK #N(28823,4,,1)($); #REGd=PEEK #N(28824,4,,1)($)
  $907A Clear the carry flag and set the zero flag if #REGa=0
  $907B #REGhl=#REGhl-carry-#REGde
  $907D Jump to #R36996 if the carry flag is set
  $907F POKE #N(28831,4,,1)($),#REGl; POKE #N(28832,4,,1)($),#REGh
  $9082 Jump to #R37009
c $9084
  $9084 #REGl=PEEK #N(28823,4,,1)($); #REGh=PEEK #N(28824,4,,1)($)
  $9087 #REGe=PEEK #N(28819,4,,1)($); #REGd=PEEK #N(28820,4,,1)($)
  $908B Clear the carry flag and set the zero flag if #REGa=0
  $908C #REGhl=#REGhl-carry-#REGde
  $908E POKE #N(28831,4,,1)($),#REGl; POKE #N(28832,4,,1)($),#REGh
  $9091 #REGl=PEEK #N(28831,4,,1)($); #REGh=PEEK #N(28832,4,,1)($)
  $9094 #REGe=PEEK #N(28829,4,,1)($); #REGd=PEEK #N(28830,4,,1)($)
  $9098 Clear the carry flag and set the zero flag if #REGa=0
  $9099 #REGhl=#REGhl-carry-#REGde
  $909B Jump to #R37035 if the carry flag is set
  $909D #REGl=PEEK #N(28831,4,,1)($); #REGh=PEEK #N(28832,4,,1)($)
  $90A0 #REGe=PEEK #N(28829,4,,1)($); #REGd=PEEK #N(28830,4,,1)($)
  $90A4 #REGhl=#REGhl+#REGhl
  $90A5 #REGhl=#REGhl+#REGde
  $90A6 POKE #N(24014,4,,1)($),#REGl; POKE #N(24015,4,,1)($),#REGh
  $90A9 Jump to #R37047
c $90AB
  $90AB #REGl=PEEK #N(28829,4,,1)($); #REGh=PEEK #N(28830,4,,1)($)
  $90AE #REGe=PEEK #N(28831,4,,1)($); #REGd=PEEK #N(28832,4,,1)($)
  $90B2 #REGhl=#REGhl+#REGhl
  $90B3 #REGhl=#REGhl+#REGde
  $90B4 POKE #N(24014,4,,1)($),#REGl; POKE #N(24015,4,,1)($),#REGh
  $90B7 #REGa=PEEK #N(24020,4,,1)($)
  $90BA Shift #REGa right (copying bit 0 into the carry flag, and resetting bit 7)
  $90BC #REGa=#REGa+1
  $90BD #REGb=#REGa
  $90BE #REGe=PEEK #N(24014,4,,1)($); #REGd=PEEK #N(24015,4,,1)($)
  $90C2 #REGhl=#N(0,4,,1)($)
  $90C5 #REGhl=#REGhl+#REGde
  $90C6 Decrement #REGb and jump to #R37061 if #REGb>0
  $90C8 POKE #N(24016,4,,1)($),#REGl; POKE #N(24017,4,,1)($),#REGh
  $90CB #REGl=PEEK #N(28821,4,,1)($); #REGh=PEEK #N(28822,4,,1)($)
  $90CE POKE #N(24018,4,,1)($),#REGl; POKE #N(24019,4,,1)($),#REGh
  $90D1 CALL #R35792
  $90D4 POKE #N(28821,4,,1)($),#REGl; POKE #N(28822,4,,1)($),#REGh
  $90D7 #REGl=PEEK #N(28823,4,,1)($); #REGh=PEEK #N(28824,4,,1)($)
  $90DA POKE #N(24018,4,,1)($),#REGl; POKE #N(24019,4,,1)($),#REGh
  $90DD CALL #R35792
  $90E0 POKE #N(28823,4,,1)($),#REGl; POKE #N(28824,4,,1)($),#REGh
  $90E3 Return
c $90E4
  $90E4 CALL #R35249
  $90E7 #REGa=PEEK #N(23973,4,,1)($)
  $90EA Clear the carry flag and set the zero flag if #REGa=0
  $90EB Return if #REGa=0
  $90EC #REGhl=#N(58975,4,,1)($)
  $90EF POKE #N(46870,4,,1)($),#REGl; POKE #N(46871,4,,1)($),#REGh
  $90F2 #REGixl=PEEK #N(24002,4,,1)($); #REGixh=PEEK #N(24003,4,,1)($)
  $90F6 Set the zero flag if bit 2 of (#REGix+#N(0,2,,1)($)) is 0
  $90FA Jump to #R37282 if bit 2 of PEEK (#REGix+#N(0,2,,1)($)) is set
  $90FD CALL #R24874
  $9100 #REGa=#N(16,2,,1)($)
  $9102 POKE #N(24026,4,,1)($),#REGa
  $9105 #REGa=#N(1,2,,1)($)
  $9107 POKE #N(24029,4,,1)($),#REGa
  $910A #REGa=#N(21,2,,1)($)
  $910C POKE #N(24030,4,,1)($),#REGa
  $910F #REGa=PEEK #N(28827,4,,1)($)
  $9112 POKE #N(24027,4,,1)($),#REGa
  $9115 #REGa=PEEK #N(28825,4,,1)($)
  $9118 POKE #N(24028,4,,1)($),#REGa
  $911B CALL #R38005
  $911E CALL #R35877
  $9121 #REGixl=PEEK #N(24002,4,,1)($); #REGixh=PEEK #N(24003,4,,1)($)
  $9125 #REGa=PEEK (#REGix+#N(15,2,,1)($))
  $9128 POKE #N(23960,4,,1)($),#REGa
  $912B CALL #R32917
  $912E #REGhl=#N(58975,4,,1)($)
  $9131 POKE #N(46870,4,,1)($),#REGl; POKE #N(46871,4,,1)($),#REGh
  $9134 CALL #R24874
  $9137 #REGl=PEEK #N(23870,4,,1)($); #REGh=PEEK #N(23871,4,,1)($)
  $913A #REGa=PEEK #REGhl
  $913B Set the zero flag if #REGa=#N(140,2,,1)($), or the carry flag if #REGa<#N(140,2,,1)($)
  $913D Jump to #R37237 if #REGa>=#N(140,2,,1)($)
  $913F CALL #R32816
  $9142 #REGl=PEEK #N(23870,4,,1)($); #REGh=PEEK #N(23871,4,,1)($)
  $9145 #REGa=PEEK #N(23847,4,,1)($)
  $9148 POKE #REGhl,#REGa
  $9149 CALL #R37377
  $914C CALL #R39400
  $914F #REGixl=PEEK #N(23859,4,,1)($); #REGixh=PEEK #N(23860,4,,1)($)
  $9153 CALL #R29290
  $9156 CALL #R29730
  $9159 CALL #R24874
  $915C CALL #R26501
  $915F #REGl=PEEK #N(23866,4,,1)($); #REGh=PEEK #N(23867,4,,1)($)
  $9162 CALL #R46631
  $9165 #REGl=PEEK #N(24022,4,,1)($); #REGh=PEEK #N(24023,4,,1)($)
  $9168 POKE #N(28819,4,,1)($),#REGl; POKE #N(28820,4,,1)($),#REGh
  $916B #REGl=PEEK #N(24024,4,,1)($); #REGh=PEEK #N(24025,4,,1)($)
  $916E POKE #N(28817,4,,1)($),#REGl; POKE #N(28818,4,,1)($),#REGh
  $9171 CALL #R42148
  $9174 Return
c $9175
  $9175 POKE #N(23865,4,,1)($),#REGa
  $9178 CALL #R26562
  $917B POKE #N(23868,4,,1)($),#REGixl; POKE #N(23869,4,,1)($),#REGixh
  $917F #REGixl=PEEK #N(23859,4,,1)($); #REGixh=PEEK #N(23860,4,,1)($)
  $9183 CALL #R33186
  $9186 CALL #R33649
  $9189 CALL #R33275
  $918C CALL #R26501
  $918F #REGa=PEEK (#REGix+#N(8,2,,1)($))
  $9192 Clear the carry flag and set the zero flag if #REGa=0
  $9193 CALL #R33702 if #REGa=0
  $9196 CALL #R24874
  $9199 #REGa=#N(3,2,,1)($)
  $919B CALL #R46526
  $919E CALL #R42148
  $91A1 Return
c $91A2
  $91A2 CALL #R35877
  $91A5 CALL #R39495
  $91A8 #REGl=PEEK #N(23866,4,,1)($); #REGh=PEEK #N(23867,4,,1)($)
  $91AB POKE #N(38548,4,,1)($),#REGl; POKE #N(38549,4,,1)($),#REGh
  $91AE #REGa=PEEK (#REGix+#N(15,2,,1)($))
  $91B1 POKE #N(38542,4,,1)($),#REGa
  $91B4 CALL #R38550
  $91B7 CALL #R39400
  $91BA CALL #R42148
  $91BD Return
c $91BE
  $91BE #REGixl=PEEK #N(23859,4,,1)($); #REGixh=PEEK #N(23860,4,,1)($)
  $91C2 #REGa=PEEK #N(23861,4,,1)($)
  $91C5 POKE (#REGix+#N(6,2,,1)($)),#REGa
  $91C8 #REGa=PEEK #N(27981,4,,1)($)
  $91CB Shift #REGa right (copying bit 0 into the carry flag, and resetting bit 7)
  $91CD #REGa=#REGa+PEEK (#REGix+#N(34,2,,1)($))
  $91D0 POKE (#REGix+#N(34,2,,1)($)),#REGa
  $91D3 #REGa=0
  $91D4 POKE #N(23834,4,,1)($),#REGa
  $91D7 #REGl=PEEK #N(24007,4,,1)($); #REGh=PEEK #N(24008,4,,1)($)
  $91DA POKE #N(23825,4,,1)($),#REGl; POKE #N(23826,4,,1)($),#REGh
  $91DD #REGl=PEEK #N(24005,4,,1)($); #REGh=PEEK #N(24006,4,,1)($)
  $91E0 POKE #N(23804,4,,1)($),#REGl; POKE #N(23805,4,,1)($),#REGh
  $91E3 #REGhl=#N(59295,4,,1)($)
  $91E6 POKE #N(46870,4,,1)($),#REGl; POKE #N(46871,4,,1)($),#REGh
  $91E9 #REGa=PEEK #N(24055,4,,1)($)
  $91EC Clear the carry flag and set the zero flag if #REGa=0
  $91ED Return if #REGa>0
  $91EE CALL #R24874
  $91F1 #REGl=PEEK #N(23844,4,,1)($); #REGh=PEEK #N(23845,4,,1)($)
  $91F4 CALL #R46631
  $91F7 #REGa=PEEK (#REGix+#N(8,2,,1)($))
  $91FA Clear the carry flag and set the zero flag if #REGa=0
  $91FB Return if #REGa>0
  $91FC #REGa=#REGa+1
  $91FD POKE #N(24040,4,,1)($),#REGa
  $9200 Return
c $9201
  $9201 #REGa=PEEK #N(46852,4,,1)($)
  $9204 Clear the carry flag and set the zero flag if #REGa=0
  $9205 Jump to #R37401 if #REGa=0
  $9207 #REGhl=#N(46863,4,,1)($)
  $920A #REGa=PEEK #N(23948,4,,1)($)
  $920D #REGa=#REGa+PEEK #REGhl
  $920E POKE #REGhl,#REGa
  $920F #REGa=0
  $9210 POKE #N(23885,4,,1)($),#REGa
  $9213 #REGa=PEEK #N(23948,4,,1)($)
  $9216 CALL #R33438
  $9219 #REGa=PEEK #N(46853,4,,1)($)
  $921C Clear the carry flag and set the zero flag if #REGa=0
  $921D Return if #REGa=0
  $921E #REGhl=#N(46864,4,,1)($)
  $9221 #REGa=PEEK #N(23948,4,,1)($)
  $9224 #REGa=#REGa+PEEK #REGhl
  $9225 POKE #REGhl,#REGa
  $9226 #REGa=#N(1,2,,1)($)
  $9228 POKE #N(23885,4,,1)($),#REGa
  $922B #REGa=PEEK #N(23948,4,,1)($)
  $922E CALL #R33438
  $9231 Return
c $9232
  $9232 #REGa=PEEK #N(24031,4,,1)($)
  $9235 POKE #N(24013,4,,1)($),#REGa
  $9238 #REGhl=#N(24032,4,,1)($)
  $923B #REGa=PEEK #REGhl
  $923C #REGa=#REGa+PEEK #REGhl
  $923D #REGa=#REGa+PEEK #REGhl
  $923E #REGc=#REGa
  $923F #REGa=PEEK (#REGix+#N(6,2,,1)($))
  $9242 Set the zero flag if #REGa=#REGc, or the carry flag if #REGa<#REGc
  $9243 Jump to #R37451 if #REGa>=#REGc
  $9245 #REGa=#N(20,2,,1)($)
  $9247 CALL #R28012
  $924A Return
c $924B
  $924B CALL #R36803
  $924E Return if the zero flag is set
  $924F POKE (#REGiy+#N(4,2,,1)($)),(PEEK (#REGiy+#N(4,2,,1)($)))+1
  $9252 POKE (#REGix+#N(36,2,,1)($)),(PEEK (#REGix+#N(36,2,,1)($)))+1
  $9255 CALL #R36852
  $9258 CALL #R36834
  $925B CALL #R35706
  $925E CALL #R36865
  $9261 CALL #R36931
  $9264 #REGl=PEEK #N(28821,4,,1)($); #REGh=PEEK #N(28822,4,,1)($)
  $9267 POKE #N(23936,4,,1)($),#REGl; POKE #N(23937,4,,1)($),#REGh
  $926A #REGl=PEEK #N(28823,4,,1)($); #REGh=PEEK #N(28824,4,,1)($)
  $926D POKE #N(23934,4,,1)($),#REGl; POKE #N(23935,4,,1)($),#REGh
  $9270 CALL #R27085
  $9273 #REGa=#N(79,2,,1)($)
  $9275 CALL #R26462
  $9278 CALL #R25109
  $927B #REGa=PEEK #N(23850,4,,1)($)
  $927E Set the zero flag if bit 0 of #REGa is 0
  $9280 Jump to #R37496 if bit 0 of #REGa is set
  $9282 CALL #R35924
  $9285 Jump to #R37496 if the zero flag is set
  $9287 #REGl=PEEK #N(23844,4,,1)($); #REGh=PEEK #N(23845,4,,1)($)
  $928A POKE #N(23879,4,,1)($),#REGl; POKE #N(23880,4,,1)($),#REGh
  $928D #REGixl=PEEK #N(23859,4,,1)($); #REGixh=PEEK #N(23860,4,,1)($)
  $9291 CALL #R29478
  $9294 Clear the carry flag and set the zero flag if #REGa=0
  $9295 Jump to #R37543 if #REGa=0
  $9297 CALL #R24874
  $929A #REGa=#N(103,2,,1)($)
  $929C CALL #R28012
  $929F CALL #R36223
  $92A2 #REGa=0
  $92A3 POKE #N(23834,4,,1)($),#REGa
  $92A6 Return
c $92A7
  $92A7 CALL #R24874
  $92AA CALL #R27085
  $92AD CALL #R36865
  $92B0 CALL #R36931
  $92B3 #REGl=PEEK #N(28821,4,,1)($); #REGh=PEEK #N(28822,4,,1)($)
  $92B6 POKE #N(23940,4,,1)($),#REGl; POKE #N(23941,4,,1)($),#REGh
  $92B9 #REGl=PEEK #N(28823,4,,1)($); #REGh=PEEK #N(28824,4,,1)($)
  $92BC POKE #N(23938,4,,1)($),#REGl; POKE #N(23939,4,,1)($),#REGh
  $92BF #REGa=#N(80,2,,1)($)
  $92C1 CALL #R26462
  $92C4 #REGhl=#N(6661,4,,1)($)
  $92C7 POKE #N(23945,4,,1)($),#REGl; POKE #N(23946,4,,1)($),#REGh
  $92CA #REGa=#N(3,2,,1)($)
  $92CC POKE #N(23943,4,,1)($),#REGa
  $92CF #REGa=PEEK #N(24032,4,,1)($)
  $92D2 #REGb=#REGa
  $92D3 #REGa=PEEK (#REGix+#N(6,2,,1)($))
  $92D6 #REGc=#N(0,2,,1)($)
  $92D8 #REGa=#REGa-#REGb
  $92D9 Jump to #R37598 if the carry flag is set
  $92DB #REGc=#REGc+1
  $92DC Jump to #R37592
c $92DE
  $92DE #REGa=#REGc
  $92DF #REGa=#REGa+1
  $92E0 POKE #N(23944,4,,1)($),#REGa
  $92E3 CALL #R27245
  $92E6 #REGhl=#N(17990,4,,1)($)
  $92E9 POKE #N(23808,4,,1)($),#REGl; POKE #N(23809,4,,1)($),#REGh
  $92EC #REGa=#N(3,2,,1)($)
  $92EE POKE #N(23942,4,,1)($),#REGa
  $92F1 CALL #R37627
  $92F4 CALL #R39375
  $92F7 CALL #R37728
  $92FA Return
c $92FB
  $92FB #REGl=PEEK #N(23945,4,,1)($); #REGh=PEEK #N(23946,4,,1)($)
  $92FE POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $9301 #REGa=#N(8,2,,1)($)
  $9303 POKE #N(23817,4,,1)($),#REGa
  $9306 #REGa=PEEK #N(23942,4,,1)($)
  $9309 CALL #R26360
  $930C #REGa=PEEK #N(23850,4,,1)($)
  $930F #REGa=#REGa+1
  $9310 Jump to #R37655 if #REGa=0
  $9312 #REGa=#N(1,2,,1)($)
  $9314 CALL #R46526
  $9317 CALL #R26321
  $931A CALL #R45256
  $931D #REGa=PEEK #N(23850,4,,1)($)
  $9320 Set the zero flag if bit 0 of #REGa is 0
  $9322 Jump to #R37674 if bit 0 of #REGa is set
  $9324 #REGa=#N(2,2,,1)($)
  $9326 CALL #R46526
  $9329 Return
c $932A
  $932A Set the zero flag if bit 1 of #REGa is 0
  $932C Jump to #R37699 if bit 1 of #REGa is set
  $932E #REGa=PEEK #N(23942,4,,1)($)
  $9331 #REGa=#REGa+1
  $9332 POKE #N(23942,4,,1)($),#REGa
  $9335 #REGhl=#N(23944,4,,1)($)
  $9338 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $9339 Jump to #R37627 if #REGa<PEEK #REGhl
  $933B #REGa=PEEK #N(23943,4,,1)($)
  $933E POKE #N(23942,4,,1)($),#REGa
  $9341 Jump to #R37627
c $9343
  $9343 Set the zero flag if bit 2 of #REGa is 0
  $9345 Jump to #R37655 if bit 2 of #REGa is set
  $9347 #REGa=PEEK #N(23942,4,,1)($)
  $934A Clear the carry flag and set the zero flag if #REGa=0
  $934B Jump to #R37719 if #REGa=0
  $934D #REGa=#REGa-1
  $934E POKE #N(23942,4,,1)($),#REGa
  $9351 #REGhl=#N(23943,4,,1)($)
  $9354 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $9355 Jump to #R37627 if #REGa>=PEEK #REGhl
  $9357 #REGa=PEEK #N(23944,4,,1)($)
  $935A #REGa=#REGa-1
  $935B POKE #N(23942,4,,1)($),#REGa
  $935E Jump to #R37627
c $9360
  $9360 #REGhl=#N(0,4,,1)($)
  $9363 POKE #N(23929,4,,1)($),#REGl; POKE #N(23930,4,,1)($),#REGh
  $9366 #REGl=PEEK #N(23938,4,,1)($); #REGh=PEEK #N(23939,4,,1)($)
  $9369 #REGc=PEEK #N(23934,4,,1)($); #REGb=PEEK #N(23935,4,,1)($)
  $936D Clear the carry flag and set the zero flag if #REGa=0
  $936E #REGhl=#REGhl-carry-#REGbc
  $9370 Jump to #R37761 if the carry flag is not set
  $9372 #REGl=PEEK #N(23934,4,,1)($); #REGh=PEEK #N(23935,4,,1)($)
  $9375 #REGc=PEEK #N(23938,4,,1)($); #REGb=PEEK #N(23939,4,,1)($)
  $9379 Clear the carry flag and set the zero flag if #REGa=0
  $937A #REGhl=#REGhl-carry-#REGbc
  $937C #REGa=#N(1,2,,1)($)
  $937E POKE #N(23929,4,,1)($),#REGa
  $9381 POKE #N(23923,4,,1)($),#REGl; POKE #N(23924,4,,1)($),#REGh
  $9384 #REGl=PEEK #N(23940,4,,1)($); #REGh=PEEK #N(23941,4,,1)($)
  $9387 #REGc=PEEK #N(23936,4,,1)($); #REGb=PEEK #N(23937,4,,1)($)
  $938B Clear the carry flag and set the zero flag if #REGa=0
  $938C #REGhl=#REGhl-carry-#REGbc
  $938E Jump to #R37791 if the carry flag is not set
  $9390 #REGl=PEEK #N(23936,4,,1)($); #REGh=PEEK #N(23937,4,,1)($)
  $9393 #REGc=PEEK #N(23940,4,,1)($); #REGb=PEEK #N(23941,4,,1)($)
  $9397 Clear the carry flag and set the zero flag if #REGa=0
  $9398 #REGhl=#REGhl-carry-#REGbc
  $939A #REGa=#N(1,2,,1)($)
  $939C POKE #N(23930,4,,1)($),#REGa
  $939F POKE #N(23925,4,,1)($),#REGl; POKE #N(23926,4,,1)($),#REGh
  $93A2 #REGa=0
  $93A3 POKE #N(23947,4,,1)($),#REGa
  $93A6 #REGa=PEEK #N(23942,4,,1)($)
  $93A9 #REGb=#REGa
  $93AA Push #REGbc onto the stack
  $93AB #REGa=PEEK #N(24032,4,,1)($)
  $93AE #REGb=#REGa
  $93AF CALL #R27982
  $93B2 Jump to #R37942 if the carry flag is set
  $93B5 CALL #R36803
  $93B8 Jump to #R37942 if the zero flag is set
  $93BA #REGa=PEEK #N(23942,4,,1)($)
  $93BD #REGhl=#N(23947,4,,1)($)
  $93C0 #REGa=#REGa-1
  $93C1 #REGb=PEEK #REGhl
  $93C2 CALL #R37947
  $93C5 POKE #N(23927,4,,1)($),#REGc; POKE #N(23928,4,,1)($),#REGb
  $93C9 #REGl=PEEK #N(23923,4,,1)($); #REGh=PEEK #N(23924,4,,1)($)
  $93CC CALL #R37970
  $93CF #REGl=PEEK #N(23934,4,,1)($); #REGh=PEEK #N(23935,4,,1)($)
  $93D2 #REGa=PEEK #N(23929,4,,1)($)
  $93D5 Clear the carry flag and set the zero flag if #REGa=0
  $93D6 Jump to #R37851 if #REGa>0
  $93D8 #REGhl=#REGhl+#REGde
  $93D9 Jump to #R37854
c $93DB
  $93DB Clear the carry flag and set the zero flag if #REGa=0
  $93DC #REGhl=#REGhl-carry-#REGde
  $93DE POKE #N(28823,4,,1)($),#REGl; POKE #N(28824,4,,1)($),#REGh
  $93E1 #REGl=PEEK #N(23925,4,,1)($); #REGh=PEEK #N(23926,4,,1)($)
  $93E4 #REGc=PEEK #N(23927,4,,1)($); #REGb=PEEK #N(23928,4,,1)($)
  $93E8 CALL #R37970
  $93EB #REGl=PEEK #N(23936,4,,1)($); #REGh=PEEK #N(23937,4,,1)($)
  $93EE #REGa=PEEK #N(23930,4,,1)($)
  $93F1 Clear the carry flag and set the zero flag if #REGa=0
  $93F2 Jump to #R37879 if #REGa>0
  $93F4 #REGhl=#REGhl+#REGde
  $93F5 Jump to #R37882
c $93F7
  $93F7 Clear the carry flag and set the zero flag if #REGa=0
  $93F8 #REGhl=#REGhl-carry-#REGde
  $93FA POKE #N(28821,4,,1)($),#REGl; POKE #N(28822,4,,1)($),#REGh
  $93FD CALL #R36881
  $9400 CALL #R37092
  $9403 #REGixl=PEEK #N(23859,4,,1)($); #REGixh=PEEK #N(23860,4,,1)($)
  $9407 #REGa=PEEK #N(23861,4,,1)($)
  $940A POKE (#REGix+#N(6,2,,1)($)),#REGa
  $940D #REGa=0
  $940E POKE #N(23830,4,,1)($),#REGa
  $9411 #REGhl=#N(59295,4,,1)($)
  $9414 POKE #N(46870,4,,1)($),#REGl; POKE #N(46871,4,,1)($),#REGh
  $9417 #REGhl=#N(23947,4,,1)($)
  $941A POKE #REGhl,(PEEK #REGhl)+1
  $941B Pop last item from stack into #REGbc
  $941C #REGa=PEEK (#REGix+#N(8,2,,1)($))
  $941F Clear the carry flag and set the zero flag if #REGa=0
  $9420 Jump to #R37938 if #REGa=0
  $9422 #REGl=PEEK #N(24022,4,,1)($); #REGh=PEEK #N(24023,4,,1)($)
  $9425 POKE #N(28819,4,,1)($),#REGl; POKE #N(28820,4,,1)($),#REGh
  $9428 #REGl=PEEK #N(24024,4,,1)($); #REGh=PEEK #N(24025,4,,1)($)
  $942B POKE #N(28817,4,,1)($),#REGl; POKE #N(28818,4,,1)($),#REGh
  $942E #REGb=#REGb-1
  $942F Jump to #R37802 if #REGb>0
  $9432 CALL #R37310
  $9435 Return
c $9436
  $9436 Pop last item from stack into #REGbc
  $9437 CALL #R37310
  $943A Return
c $943B
  $943B #REGl=#REGa
  $943C #REGh=#N(0,2,,1)($)
  $943E #REGhl=#REGhl+#REGhl
  $943F #REGhl=#REGhl+#REGhl
  $9440 #REGhl=#REGhl+#REGhl
  $9441 #REGhl=#REGhl+#REGhl
  $9442 #REGhl=#REGhl+#REGhl
  $9443 #REGe=#REGb
  $9444 #REGd=#N(0,2,,1)($)
  $9446 #REGbc=#N(0,4,,1)($)
  $9449 #REGa=#REGe
  $944A Clear the carry flag and set the zero flag if #REGa=0
  $944B Return if #REGa=0
  $944C #REGhl=#REGhl-carry-#REGde
  $944E Return if the carry flag is set
  $944F #REGbc=#REGbc+1
  $9450 Jump to #R37964
c $9452
  $9452 #REGde=#N(0,4,,1)($)
  $9455 #REGa=#REGb
  $9456 Clear the carry flag and set the zero flag if #REGa=0
  $9457 Jump to #R37980 if #REGa>0
  $9459 #REGa=#REGc
  $945A Clear the carry flag and set the zero flag if #REGa=0
  $945B Return if #REGa=0
  $945C #REGhl=#REGhl+#REGhl
  $945D #REGhl=#REGhl+#REGhl
  $945E #REGhl=#REGhl+#REGhl
  $945F #REGhl=#REGhl+#REGhl
  $9460 #REGhl=#REGhl+#REGhl
  $9461 Clear the carry flag and set the zero flag if #REGa=0
  $9462 #REGhl=#REGhl-carry-#REGbc
  $9464 Jump to #R37993 if the carry flag is set
  $9466 #REGde=#REGde+1
  $9467 Jump to #R37986
c $9469
  $9469 #REGhl=#REGhl+#REGbc
  $946A Clear the carry flag and set the zero flag if #REGa=0
  $946B Rotate #REGb right through the carry flag
  $946D Rotate #REGc right through the carry flag
  $946F Clear the carry flag and set the zero flag if #REGa=0
  $9470 #REGhl=#REGhl-carry-#REGbc
  $9472 Return if the carry flag is set
  $9473 #REGde=#REGde+1
  $9474 Return
c $9475
  $9475 #REGa=#N(8,2,,1)($)
  $9477 CALL #R46526
  $947A #REGhl=#N(24026,4,,1)($)
  $947D #REGb=PEEK #REGhl
  $947E #REGiy=#N(38222,4,,1)($)
  $9482 #REGde=#N(4,4,,1)($)
  $9485 #REGa=PEEK #N(24027,4,,1)($)
  $9488 POKE (#REGiy+#N(2,2,,1)($)),#REGa
  $948B #REGa=PEEK #N(24028,4,,1)($)
  $948E POKE (#REGiy+#N(3,2,,1)($)),#REGa
  $9491 #REGiy=#REGiy+#REGde
  $9493 Decrement #REGb and jump to #R38021 if #REGb>0
  $9495 #REGhl=#N(1095,4,,1)($)
  $9498 POKE #N(23808,4,,1)($),#REGl; POKE #N(23809,4,,1)($),#REGh
  $949B #REGa=PEEK #N(24030,4,,1)($)
  $949E #REGb=#REGa
  $949F #REGa=#N(2,2,,1)($)
  $94A1 POKE #N(23974,4,,1)($),#REGa
  $94A4 Push #REGbc onto the stack
  $94A5 #REGhl=#N(24026,4,,1)($)
  $94A8 #REGb=PEEK #REGhl
  $94A9 #REGiy=#N(38222,4,,1)($)
  $94AD Push #REGbc onto the stack
  $94AE #REGa=PEEK (#REGiy+#N(2,2,,1)($))
  $94B1 POKE #N(23971,4,,1)($),#REGa
  $94B4 #REGa=PEEK (#REGiy+#N(3,2,,1)($))
  $94B7 POKE #N(23972,4,,1)($),#REGa
  $94BA CALL #R38181
  $94BD #REGa=PEEK (#REGiy+#N(0,2,,1)($))
  $94C0 #REGa=#REGa+PEEK (#REGiy+#N(2,2,,1)($))
  $94C3 Set the zero flag if #REGa=#N(172,2,,1)($), or the carry flag if #REGa<#N(172,2,,1)($)
  $94C5 Jump to #R38167 if #REGa>=#N(172,2,,1)($)
  $94C7 POKE (#REGiy+#N(2,2,,1)($)),#REGa
  $94CA POKE #N(23971,4,,1)($),#REGa
  $94CD #REGa=PEEK (#REGiy+#N(1,2,,1)($))
  $94D0 #REGa=#REGa+PEEK (#REGiy+#N(3,2,,1)($))
  $94D3 Set the zero flag if #REGa=#N(172,2,,1)($), or the carry flag if #REGa<#N(172,2,,1)($)
  $94D5 Jump to #R38167 if #REGa>=#N(172,2,,1)($)
  $94D7 POKE (#REGiy+#N(3,2,,1)($)),#REGa
  $94DA POKE #N(23972,4,,1)($),#REGa
  $94DD CALL #R38181
  $94E0 #REGa=#REGr
  $94E2 Keep only bit 4 of #REGa
  $94E4 OUT #N(254,2,,1)($),#REGa
  $94E6 Pop last item from stack into #REGbc
  $94E7 #REGde=#N(4,4,,1)($)
  $94EA #REGiy=#REGiy+#REGde
  $94EC Decrement #REGb and jump to #R38061 if #REGb>0
  $94EE Pop last item from stack into #REGbc
  $94EF #REGa=PEEK #N(24029,4,,1)($)
  $94F2 Clear the carry flag and set the zero flag if #REGa=0
  $94F3 Jump to #R38164 if #REGa>0
  $94F5 #REGa=PEEK #N(23808,4,,1)($)
  $94F8 Set the zero flag if #REGa=#N(66,2,,1)($), or the carry flag if #REGa<#N(66,2,,1)($)
  $94FA Jump to #R38164 if #REGa=#N(66,2,,1)($)
  $94FC #REGa=PEEK #N(23809,4,,1)($)
  $94FF #REGa=#REGa-1
  $9500 POKE #N(23809,4,,1)($),#REGa
  $9503 Jump to #R38164 if the zero flag is not set
  $9505 #REGa=#N(4,2,,1)($)
  $9507 POKE #N(23809,4,,1)($),#REGa
  $950A #REGa=PEEK #N(23808,4,,1)($)
  $950D #REGa=#REGa-1
  $950E POKE #N(23808,4,,1)($),#REGa
  $9511 CALL #R39353
  $9514 Decrement #REGb and jump to #R38052 if #REGb>0
  $9516 Return
c $9517
  $9517 #REGa=PEEK #N(24027,4,,1)($)
  $951A POKE (#REGiy+#N(2,2,,1)($)),#REGa
  $951D #REGa=PEEK #N(24028,4,,1)($)
  $9520 POKE (#REGiy+#N(3,2,,1)($)),#REGa
  $9523 Jump to #R38112
c $9525
  $9525 #REGhl=#N(23972,4,,1)($)
  $9528 POKE #REGhl,(PEEK #REGhl)+1
  $9529 CALL #R33868
  $952C #REGhl=#N(23971,4,,1)($)
  $952F POKE #REGhl,(PEEK #REGhl)+1
  $9530 CALL #R33868
  $9533 #REGhl=#N(23971,4,,1)($)
  $9536 POKE #REGhl,(PEEK #REGhl)+1
  $9537 CALL #R33868
  $953A #REGhl=#N(23971,4,,1)($)
  $953D POKE #REGhl,(PEEK #REGhl)-1
  $953E #REGhl=#N(23972,4,,1)($)
  $9541 POKE #REGhl,(PEEK #REGhl)-1
  $9542 CALL #R33868
  $9545 #REGhl=#N(23972,4,,1)($)
  $9548 POKE #REGhl,(PEEK #REGhl)+1
  $9549 POKE #REGhl,(PEEK #REGhl)+1
  $954A CALL #R33868
  $954D Return
b $954E
c $9696
  $9696 #REGa=PEEK #N(24055,4,,1)($)
  $9699 Clear the carry flag and set the zero flag if #REGa=0
  $969A Jump to #R38561 if #REGa=0
  $969C #REGa=#N(1,2,,1)($)
  $969E CALL #R29096
  $96A1 #REGa=#N(1,2,,1)($)
  $96A3 POKE #N(46868,4,,1)($),#REGa
  $96A6 #REGl=PEEK #N(23844,4,,1)($); #REGh=PEEK #N(23845,4,,1)($)
  $96A9 Push #REGhl onto the stack
  $96AA #REGl=PEEK #N(28817,4,,1)($); #REGh=PEEK #N(28818,4,,1)($)
  $96AD Push #REGhl onto the stack
  $96AE #REGl=PEEK #N(28819,4,,1)($); #REGh=PEEK #N(28820,4,,1)($)
  $96B1 Push #REGhl onto the stack
  $96B2 #REGl=PEEK #N(38548,4,,1)($); #REGh=PEEK #N(38549,4,,1)($)
  $96B5 POKE #N(23844,4,,1)($),#REGl; POKE #N(23845,4,,1)($),#REGh
  $96B8 CALL #R28176
  $96BB #REGa=PEEK #N(38548,4,,1)($)
  $96BE #REGhl=#N(23804,4,,1)($)
  $96C1 #REGa=#REGa-PEEK #REGhl
  $96C2 Shift #REGa left (copying bit 7 into the carry flag, and resetting bit 0)
  $96C4 Shift #REGa left (copying bit 7 into the carry flag, and resetting bit 0)
  $96C6 Shift #REGa left (copying bit 7 into the carry flag, and resetting bit 0)
  $96C8 Shift #REGa left (copying bit 7 into the carry flag, and resetting bit 0)
  $96CA #REGa=#REGa+#N(8,2,,1)($)
  $96CC POKE #N(24027,4,,1)($),#REGa
  $96CF #REGa=PEEK #N(38549,4,,1)($)
  $96D2 #REGhl=#N(23805,4,,1)($)
  $96D5 #REGa=#REGa-PEEK #REGhl
  $96D6 Shift #REGa left (copying bit 7 into the carry flag, and resetting bit 0)
  $96D8 Shift #REGa left (copying bit 7 into the carry flag, and resetting bit 0)
  $96DA Shift #REGa left (copying bit 7 into the carry flag, and resetting bit 0)
  $96DC Shift #REGa left (copying bit 7 into the carry flag, and resetting bit 0)
  $96DE #REGa=#REGa+#N(8,2,,1)($)
  $96E0 POKE #N(24028,4,,1)($),#REGa
  $96E3 #REGa=0
  $96E4 POKE #N(28818,4,,1)($),#REGa
  $96E7 POKE #N(28820,4,,1)($),#REGa
  $96EA POKE #N(28826,4,,1)($),#REGa
  $96ED POKE #N(28828,4,,1)($),#REGa
  $96F0 POKE #N(28822,4,,1)($),#REGa
  $96F3 POKE #N(28824,4,,1)($),#REGa
  $96F6 #REGhl=#N(23296,4,,1)($)
  $96F9 #REGde=#N(23297,4,,1)($)
  $96FC POKE #REGhl,#N(0,2,,1)($)
  $96FE #REGbc=#N(120,4,,1)($)
  $9701 POKE #REGde,PEEK #REGhl; #REGhl=#REGhl+1; #REGde=#REGde+1; #REGbc=#REGbc-1; repeat until #REGbc=0
  $9703 #REGa=PEEK #N(38548,4,,1)($)
  $9706 POKE #N(28819,4,,1)($),#REGa
  $9709 #REGa=#REGa-#N(5,2,,1)($)
  $970B Jump to #R38670 if the carry flag is not set
  $970D #REGa=0
  $970E POKE #N(38544,4,,1)($),#REGa
  $9711 #REGa=PEEK #N(38548,4,,1)($)
  $9714 #REGa=#REGa+#N(5,2,,1)($)
  $9716 Set the zero flag if #REGa=#N(50,2,,1)($), or the carry flag if #REGa<#N(50,2,,1)($)
  $9718 Jump to #R38684 if #REGa<#N(50,2,,1)($)
  $971A #REGa=#N(49,2,,1)($)
  $971C POKE #N(38545,4,,1)($),#REGa
  $971F #REGa=PEEK #N(38549,4,,1)($)
  $9722 POKE #N(28817,4,,1)($),#REGa
  $9725 #REGa=#REGa-#N(5,2,,1)($)
  $9727 Jump to #R38698 if the carry flag is not set
  $9729 #REGa=0
  $972A POKE #N(38546,4,,1)($),#REGa
  $972D #REGa=PEEK #N(38549,4,,1)($)
  $9730 #REGa=#REGa+#N(5,2,,1)($)
  $9732 Set the zero flag if #REGa=#N(80,2,,1)($), or the carry flag if #REGa<#N(80,2,,1)($)
  $9734 Jump to #R38712 if #REGa<#N(80,2,,1)($)
  $9736 #REGa=#N(79,2,,1)($)
  $9738 POKE #N(38547,4,,1)($),#REGa
  $973B #REGa=PEEK #N(38544,4,,1)($)
  $973E POKE #N(28823,4,,1)($),#REGa
  $9741 #REGa=PEEK #N(38546,4,,1)($)
  $9744 POKE #N(28821,4,,1)($),#REGa
  $9747 CALL #R38926
  $974A #REGa=PEEK #N(38547,4,,1)($)
  $974D POKE #N(28821,4,,1)($),#REGa
  $9750 CALL #R38926
  $9753 #REGhl=#N(28823,4,,1)($)
  $9756 POKE #REGhl,(PEEK #REGhl)+1
  $9757 #REGa=PEEK #N(38545,4,,1)($)
  $975A Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $975B Jump to #R38721 if #REGa>=PEEK #REGhl
  $975D #REGa=PEEK #N(38546,4,,1)($)
  $9760 #REGa=#REGa+1
  $9761 POKE #N(28821,4,,1)($),#REGa
  $9764 #REGa=PEEK #N(38544,4,,1)($)
  $9767 POKE #N(28823,4,,1)($),#REGa
  $976A CALL #R38926
  $976D #REGa=PEEK #N(38545,4,,1)($)
  $9770 POKE #N(28823,4,,1)($),#REGa
  $9773 CALL #R38926
  $9776 #REGa=PEEK #N(28821,4,,1)($)
  $9779 #REGa=#REGa+1
  $977A POKE #N(28821,4,,1)($),#REGa
  $977D #REGhl=#N(38547,4,,1)($)
  $9780 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $9781 Jump to #R38756 if #REGa<>PEEK #REGhl
  $9783 #REGl=PEEK #N(38548,4,,1)($); #REGh=PEEK #N(38549,4,,1)($)
  $9786 POKE #N(23866,4,,1)($),#REGl; POKE #N(23867,4,,1)($),#REGh
  $9789 CALL #R39055
  $978C #REGa=PEEK #N(38542,4,,1)($)
  $978F POKE #REGhl,#REGa
  $9790 #REGa=PEEK #N(38544,4,,1)($)
  $9793 POKE #N(23866,4,,1)($),#REGa
  $9796 #REGa=PEEK #N(38546,4,,1)($)
  $9799 POKE #N(23867,4,,1)($),#REGa
  $979C CALL #R39087
  $979F #REGhl=#N(23867,4,,1)($)
  $97A2 POKE #REGhl,(PEEK #REGhl)+1
  $97A3 #REGa=PEEK #N(38547,4,,1)($)
  $97A6 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $97A7 Jump to #R38812 if #REGa>=PEEK #REGhl
  $97A9 #REGa=PEEK #N(38546,4,,1)($)
  $97AC POKE #N(23867,4,,1)($),#REGa
  $97AF #REGhl=#N(23866,4,,1)($)
  $97B2 POKE #REGhl,(PEEK #REGhl)+1
  $97B3 #REGa=PEEK #N(38545,4,,1)($)
  $97B6 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $97B7 Jump to #R38812 if #REGa>=PEEK #REGhl
  $97B9 #REGa=#N(9,2,,1)($)
  $97BB CALL #R46526
  $97BE #REGb=#N(3,2,,1)($)
  $97C0 Push #REGbc onto the stack
  $97C1 #REGa=#N(71,2,,1)($)
  $97C3 CALL #R39353
  $97C6 #REGa=#N(9,2,,1)($)
  $97C8 CALL #R46549
  $97CB #REGa=#N(120,2,,1)($)
  $97CD CALL #R39353
  $97D0 CALL #R46549
  $97D3 Pop last item from stack into #REGbc
  $97D4 Decrement #REGb and jump to #R38848 if #REGb>0
  $97D6 #REGa=#N(71,2,,1)($)
  $97D8 CALL #R39353
  $97DB #REGa=PEEK #N(38542,4,,1)($)
  $97DE Shift #REGa right (copying bit 0 into the carry flag, and resetting bit 7)
  $97E0 Shift #REGa right (copying bit 0 into the carry flag, and resetting bit 7)
  $97E2 Shift #REGa right (copying bit 0 into the carry flag, and resetting bit 7)
  $97E4 #REGa=#REGa+#N(49,2,,1)($)
  $97E6 POKE #N(24026,4,,1)($),#REGa
  $97E9 #REGa=0
  $97EA POKE #N(24029,4,,1)($),#REGa
  $97ED #REGa=#N(26,2,,1)($)
  $97EF POKE #N(24030,4,,1)($),#REGa
  $97F2 CALL #R38005
  $97F5 CALL #R30535
  $97F8 CALL #R24874
  $97FB CALL #R26501
  $97FE Pop last item from stack into #REGhl
  $97FF POKE #N(28819,4,,1)($),#REGl; POKE #N(28820,4,,1)($),#REGh
  $9802 Pop last item from stack into #REGhl
  $9803 POKE #N(28817,4,,1)($),#REGl; POKE #N(28818,4,,1)($),#REGh
  $9806 Pop last item from stack into #REGhl
  $9807 POKE #N(23844,4,,1)($),#REGl; POKE #N(23845,4,,1)($),#REGh
  $980A CALL #R42148
  $980D Return
c $980E
  $980E #REGa=PEEK #N(38542,4,,1)($)
  $9811 POKE #N(38543,4,,1)($),#REGa
  $9814 #REGa=PEEK #N(28817,4,,1)($)
  $9817 POKE #N(28825,4,,1)($),#REGa
  $981A #REGa=PEEK #N(28819,4,,1)($)
  $981D POKE #N(28827,4,,1)($),#REGa
  $9820 CALL #R28874
  $9823 #REGa=PEEK #N(28825,4,,1)($)
  $9826 #REGhl=#N(28821,4,,1)($)
  $9829 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $982A Jump to #R38964 if #REGa<>PEEK #REGhl
  $982C #REGa=PEEK #N(28827,4,,1)($)
  $982F #REGhl=#N(28823,4,,1)($)
  $9832 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $9833 Return if #REGa=PEEK #REGhl
  $9834 #REGhl=#N(0,4,,1)($)
  $9837 POKE #N(28849,4,,1)($),#REGl; POKE #N(28850,4,,1)($),#REGh
  $983A CALL #R29032
  $983D #REGa=PEEK #N(28827,4,,1)($)
  $9840 POKE #N(23866,4,,1)($),#REGa
  $9843 #REGa=PEEK #N(28825,4,,1)($)
  $9846 POKE #N(23867,4,,1)($),#REGa
  $9849 CALL #R39016
  $984C #REGa=PEEK #N(38542,4,,1)($)
  $984F Shift #REGa right (copying bit 0 into the carry flag, and resetting bit 7)
  $9851 Shift #REGa right (copying bit 0 into the carry flag, and resetting bit 7)
  $9853 Shift #REGa right (copying bit 0 into the carry flag, and resetting bit 7)
  $9855 Shift #REGa right (copying bit 0 into the carry flag, and resetting bit 7)
  $9857 #REGc=#REGa
  $9858 #REGa=PEEK #N(28849,4,,1)($)
  $985B #REGb=#REGa
  $985C #REGa=PEEK #N(38543,4,,1)($)
  $985F #REGa=#REGa-#REGc
  $9860 Return if the carry flag is set
  $9861 Decrement #REGb and jump to #R39007 if #REGb>0
  $9863 POKE #N(38543,4,,1)($),#REGa
  $9866 Jump to #R38947
c $9868
  $9868 CALL #R39055
  $986B #REGa=PEEK #N(38543,4,,1)($)
  $986E Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $986F Jump to #R39026 if #REGa<PEEK #REGhl
  $9871 POKE #REGhl,#REGa
  $9872 CALL #R27466
  $9875 CALL #R26615
  $9878 #REGa=PEEK #N(38543,4,,1)($)
  $987B #REGa=#REGa-PEEK (#REGiy+#N(5,2,,1)($))
  $987E Jump to #R39050 if the carry flag is set
  $9880 POKE #N(38543,4,,1)($),#REGa
  $9883 #REGa=PEEK (#REGiy+#N(4,2,,1)($))
  $9886 Clear the carry flag and set the zero flag if #REGa=0
  $9887 Return if #REGa=0
  $9888 Jump to #R39029
c $988A
  $988A #REGa=0
  $988B POKE #N(38543,4,,1)($),#REGa
  $988E Return
c $988F
  $988F #REGa=PEEK #N(23866,4,,1)($)
  $9892 #REGhl=#N(38544,4,,1)($)
  $9895 #REGa=#REGa-PEEK #REGhl
  $9896 #REGb=#REGa
  $9897 #REGa=#REGa+#REGa
  $9898 #REGa=#REGa+#REGa
  $9899 #REGa=#REGa+#REGa
  $989A #REGa=#REGa+#REGb
  $989B #REGa=#REGa+#REGb
  $989C #REGa=#REGa+#REGb
  $989D #REGe=#REGa
  $989E #REGa=PEEK #N(23867,4,,1)($)
  $98A1 #REGhl=#N(38546,4,,1)($)
  $98A4 #REGa=#REGa-PEEK #REGhl
  $98A5 #REGa=#REGa+#REGe
  $98A6 #REGe=#REGa
  $98A7 #REGd=#N(0,2,,1)($)
  $98A9 #REGhl=#N(23296,4,,1)($)
  $98AC #REGhl=#REGhl+#REGde
  $98AD Return
s $98AE
c $98AF
  $98AF CALL #R39055
  $98B2 #REGa=PEEK #REGhl
  $98B3 POKE #N(23960,4,,1)($),#REGa
  $98B6 POKE #N(38543,4,,1)($),#REGa
  $98B9 CALL #R32816
  $98BC CALL #R37377
  $98BF #REGe=PEEK #N(23866,4,,1)($); #REGd=PEEK #N(23867,4,,1)($)
  $98C3 CALL #R24850
  $98C6 POKE #N(23870,4,,1)($),#REGl; POKE #N(23871,4,,1)($),#REGh
  $98C9 #REGa=PEEK #REGhl
  $98CA POKE #N(39086,4,,1)($),#REGa
  $98CD #REGa=PEEK #N(23847,4,,1)($)
  $98D0 POKE #N(23843,4,,1)($),#REGa
  $98D3 POKE #REGhl,#REGa
  $98D4 #REGhl=#N(23632,4,,1)($)
  $98D7 #REGde=#N(4,4,,1)($)
  $98DA #REGb=#N(20,2,,1)($)
  $98DC Push #REGhl onto the stack
  $98DD #REGa=PEEK #REGhl
  $98DE Set the zero flag if #REGa=#N(3,2,,1)($), or the carry flag if #REGa<#N(3,2,,1)($)
  $98E0 Jump to #R39169 if #REGa=#N(3,2,,1)($)
  $98E2 #REGhl=#REGhl+1
  $98E3 #REGa=PEEK #N(23866,4,,1)($)
  $98E6 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $98E7 Jump to #R39169 if #REGa<>PEEK #REGhl
  $98E9 #REGhl=#REGhl+1
  $98EA #REGa=PEEK #N(23867,4,,1)($)
  $98ED Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $98EE Jump to #R39169 if #REGa<>PEEK #REGhl
  $98F0 #REGhl=#REGhl+1
  $98F1 #REGa=PEEK #N(23847,4,,1)($)
  $98F4 POKE #REGhl,#REGa
  $98F5 #REGa=#N(160,2,,1)($)
  $98F7 #REGa=#REGa-#REGb
  $98F8 POKE #N(23865,4,,1)($),#REGa
  $98FB #REGl=PEEK #N(23870,4,,1)($); #REGh=PEEK #N(23871,4,,1)($)
  $98FE POKE #REGhl,#REGa
  $98FF Jump to #R39175
c $9901
  $9901 Pop last item from stack into #REGhl
  $9902 #REGhl=#REGhl+#REGde
  $9903 Decrement #REGb and jump to #R39132 if #REGb>0
  $9905 Jump to #R39207
c $9907
  $9907 Pop last item from stack into #REGhl
  $9908 CALL #R26562
  $990B POKE #N(23868,4,,1)($),#REGixl; POKE #N(23869,4,,1)($),#REGixh
  $990F #REGa=PEEK #N(23847,4,,1)($)
  $9912 POKE (#REGix+#N(22,2,,1)($)),#REGa
  $9915 #REGa=PEEK #N(38543,4,,1)($)
  $9918 POKE #N(23960,4,,1)($),#REGa
  $991B #REGl=PEEK #N(23866,4,,1)($); #REGh=PEEK #N(23867,4,,1)($)
  $991E POKE #N(23844,4,,1)($),#REGl; POKE #N(23845,4,,1)($),#REGh
  $9921 CALL #R33186
  $9924 CALL #R33275
  $9927 #REGa=0
  $9928 POKE #N(23822,4,,1)($),#REGa
  $992B #REGa=PEEK #N(46649,4,,1)($)
  $992E #REGb=#REGa
  $992F #REGiyl=PEEK #N(46890,4,,1)($); #REGiyh=PEEK #N(46891,4,,1)($)
  $9933 Push #REGbc onto the stack
  $9934 #REGa=PEEK (#REGiy+#N(0,2,,1)($))
  $9937 Clear the carry flag and set the zero flag if #REGa=0
  $9938 Jump to #R39300 if #REGa=0
  $993A #REGa=PEEK (#REGiy+#N(5,2,,1)($))
  $993D Clear the carry flag and set the zero flag if #REGa=0
  $993E Jump to #R39300 if #REGa>0
  $9940 #REGa=PEEK #N(23866,4,,1)($)
  $9943 Set the zero flag if #REGa=PEEK (#REGiy+#N(1,2,,1)($)), or the carry flag if #REGa<PEEK (#REGiy+#N(1,2,,1)($))
  $9946 Jump to #R39300 if #REGa<>PEEK (#REGiy+#N(1,2,,1)($))
  $9948 #REGa=PEEK #N(23867,4,,1)($)
  $994B Set the zero flag if #REGa=PEEK (#REGiy+#N(2,2,,1)($)), or the carry flag if #REGa<PEEK (#REGiy+#N(2,2,,1)($))
  $994E Jump to #R39300 if #REGa<>PEEK (#REGiy+#N(2,2,,1)($))
  $9950 #REGa=#N(1,2,,1)($)
  $9952 POKE #N(23822,4,,1)($),#REGa
  $9955 #REGa=PEEK #N(23847,4,,1)($)
  $9958 POKE (#REGiy+#N(3,2,,1)($)),#REGa
  $995B #REGa=PEEK (#REGiy+#N(0,2,,1)($))
  $995E CALL #R26591
  $9961 #REGa=PEEK #N(38543,4,,1)($)
  $9964 Set the zero flag if #REGa=PEEK (#REGix+#N(17,2,,1)($)), or the carry flag if #REGa<PEEK (#REGix+#N(17,2,,1)($))
  $9967 Jump to #R39300 if #REGa<PEEK (#REGix+#N(17,2,,1)($))
  $9969 POKE (#REGiy+#N(0,2,,1)($)),0
  $996D #REGl=PEEK #N(23870,4,,1)($); #REGh=PEEK #N(23871,4,,1)($)
  $9970 #REGa=PEEK #REGhl
  $9971 Set the zero flag if #REGa=#N(140,2,,1)($), or the carry flag if #REGa<#N(140,2,,1)($)
  $9973 Jump to #R39291 if #REGa>=#N(140,2,,1)($)
  $9975 #REGa=PEEK #N(23847,4,,1)($)
  $9978 POKE #REGhl,#REGa
  $9979 Jump to #R39300
c $997B
  $997B CALL #R26562
  $997E #REGa=PEEK #N(23847,4,,1)($)
  $9981 POKE (#REGix+#N(22,2,,1)($)),#REGa
  $9984 #REGde=#N(6,4,,1)($)
  $9987 #REGiy=#REGiy+#REGde
  $9989 Pop last item from stack into #REGbc
  $998A Decrement #REGb and jump to #R39219 if #REGb>0
  $998C #REGa=PEEK #N(23822,4,,1)($)
  $998F Clear the carry flag and set the zero flag if #REGa=0
  $9990 Return if #REGa=0
  $9991 #REGa=PEEK #N(39086,4,,1)($)
  $9994 Set the zero flag if #REGa=#N(110,2,,1)($), or the carry flag if #REGa<#N(110,2,,1)($)
  $9996 Return if #REGa<#N(110,2,,1)($)
  $9997 #REGl=PEEK #N(23866,4,,1)($); #REGh=PEEK #N(23867,4,,1)($)
  $999A CALL #R32328
  $999D #REGa=PEEK #N(23951,4,,1)($)
  $99A0 Clear the carry flag and set the zero flag if #REGa=0
  $99A1 Return if #REGa=0
  $99A2 #REGl=PEEK #N(23870,4,,1)($); #REGh=PEEK #N(23871,4,,1)($)
  $99A5 #REGa=PEEK #REGhl
  $99A6 Set the zero flag if #REGa=#N(140,2,,1)($), or the carry flag if #REGa<#N(140,2,,1)($)
  $99A8 Jump to #R39343 if #REGa>=#N(140,2,,1)($)
  $99AA #REGa=PEEK #N(23958,4,,1)($)
  $99AD POKE #REGhl,#REGa
  $99AE Return
c $99AF
  $99AF CALL #R26562
  $99B2 #REGa=PEEK #N(23958,4,,1)($)
  $99B5 POKE (#REGix+#N(22,2,,1)($)),#REGa
  $99B8 Return
c $99B9
  $99B9 Push #REGbc onto the stack
  $99BA #REGb=#N(22,2,,1)($)
  $99BC #REGhl=#N(22561,4,,1)($)
  $99BF #REGde=#N(10,4,,1)($)
  $99C2 Push #REGbc onto the stack
  $99C3 #REGb=#N(22,2,,1)($)
  $99C5 POKE #REGhl,#REGa
  $99C6 #REGhl=#REGhl+1
  $99C7 Decrement #REGb and jump to #R39365 if #REGb>0
  $99C9 #REGhl=#REGhl+#REGde
  $99CA Pop last item from stack into #REGbc
  $99CB Decrement #REGb and jump to #R39362 if #REGb>0
  $99CD Pop last item from stack into #REGbc
  $99CE Return
c $99CF
  $99CF #REGhl=#N(23731,4,,1)($)
  $99D2 POKE #N(24049,4,,1)($),#REGl; POKE #N(24050,4,,1)($),#REGh
  $99D5 POKE #N(24051,4,,1)($),#REGl; POKE #N(24052,4,,1)($),#REGh
  $99D8 #REGde=#N(23732,4,,1)($)
  $99DB #REGbc=#N(59,4,,1)($)
  $99DE POKE #REGhl,#N(0,2,,1)($)
  $99E0 POKE #REGde,PEEK #REGhl; #REGhl=#REGhl+1; #REGde=#REGde+1; #REGbc=#REGbc-1; repeat until #REGbc=0
  $99E2 #REGa=#N(255,2,,1)($)
  $99E4 POKE #N(23791,4,,1)($),#REGa
  $99E7 Return
c $99E8
  $99E8 #REGa=#N(255,2,,1)($)
  $99EA POKE #N(23791,4,,1)($),#REGa
  $99ED #REGl=PEEK #N(24049,4,,1)($); #REGh=PEEK #N(24050,4,,1)($)
  $99F0 #REGa=PEEK #REGhl
  $99F1 Clear the carry flag and set the zero flag if #REGa=0
  $99F2 Return if #REGa=0
  $99F3 POKE #N(38542,4,,1)($),#REGa
  $99F6 POKE #REGhl,#N(0,2,,1)($)
  $99F8 #REGhl=#REGhl+1
  $99F9 #REGa=PEEK #REGhl
  $99FA POKE #N(38548,4,,1)($),#REGa
  $99FD #REGhl=#REGhl+1
  $99FE #REGa=PEEK #REGhl
  $99FF POKE #N(38549,4,,1)($),#REGa
  $9A02 #REGhl=#REGhl+1
  $9A03 POKE #N(24049,4,,1)($),#REGl; POKE #N(24050,4,,1)($),#REGh
  $9A06 #REGa=PEEK #REGhl
  $9A07 Set the zero flag if #REGa=#N(255,2,,1)($), or the carry flag if #REGa<#N(255,2,,1)($)
  $9A09 Jump to #R39441 if #REGa<>#N(255,2,,1)($)
  $9A0B #REGhl=#N(23731,4,,1)($)
  $9A0E POKE #N(24049,4,,1)($),#REGl; POKE #N(24050,4,,1)($),#REGh
  $9A11 CALL #R38550
  $9A14 Jump to #R39400
c $9A16
  $9A16 #REGhl=#N(23632,4,,1)($)
  $9A19 #REGde=#N(4,4,,1)($)
  $9A1C #REGb=#N(20,2,,1)($)
  $9A1E Push #REGhl onto the stack
  $9A1F #REGa=PEEK #N(46866,4,,1)($)
  $9A22 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $9A23 Jump to #R39489 if #REGa<>PEEK #REGhl
  $9A25 #REGhl=#REGhl+1
  $9A26 #REGa=PEEK #N(23844,4,,1)($)
  $9A29 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $9A2A Jump to #R39489 if #REGa<>PEEK #REGhl
  $9A2C #REGhl=#REGhl+1
  $9A2D #REGa=PEEK #N(23845,4,,1)($)
  $9A30 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $9A31 Jump to #R39489 if #REGa<>PEEK #REGhl
  $9A33 #REGhl=#N(23846,4,,1)($)
  $9A36 #REGa=#N(160,2,,1)($)
  $9A38 #REGa=#REGa-#REGb
  $9A39 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $9A3A Jump to #R39489 if #REGa=PEEK #REGhl
  $9A3C Pop last item from stack into #REGhl
  $9A3D #REGa=#N(1,2,,1)($)
  $9A3F Clear the carry flag and set the zero flag if #REGa=0
  $9A40 Return
c $9A41
  $9A41 Pop last item from stack into #REGhl
  $9A42 #REGhl=#REGhl+#REGde
  $9A43 Decrement #REGb and jump to #R39454 if #REGb>0
  $9A45 #REGa=0
  $9A46 Return
c $9A47
  $9A47 #REGl=PEEK #N(23844,4,,1)($); #REGh=PEEK #N(23845,4,,1)($)
  $9A4A POKE #N(42458,4,,1)($),#REGl; POKE #N(42459,4,,1)($),#REGh
  $9A4D #REGl=PEEK #N(23866,4,,1)($); #REGh=PEEK #N(23867,4,,1)($)
  $9A50 POKE #N(42460,4,,1)($),#REGl; POKE #N(42461,4,,1)($),#REGh
  $9A53 CALL #R42464
  $9A56 #REGhl=#N(23296,4,,1)($)
  $9A59 POKE #N(24059,4,,1)($),#REGl; POKE #N(24060,4,,1)($),#REGh
  $9A5C #REGb=#N(8,2,,1)($)
  $9A5E Push #REGbc onto the stack
  $9A5F #REGl=PEEK #N(24059,4,,1)($); #REGh=PEEK #N(24060,4,,1)($)
  $9A62 #REGa=PEEK #REGhl
  $9A63 Set the zero flag if #REGa=#N(255,2,,1)($), or the carry flag if #REGa<#N(255,2,,1)($)
  $9A65 Jump to #R39562 if #REGa=#N(255,2,,1)($)
  $9A67 POKE #N(42460,4,,1)($),#REGa
  $9A6A #REGhl=#REGhl+1
  $9A6B #REGa=PEEK #REGhl
  $9A6C POKE #N(42461,4,,1)($),#REGa
  $9A6F #REGhl=#REGhl+1
  $9A70 #REGhl=#REGhl+1
  $9A71 POKE #N(24059,4,,1)($),#REGl; POKE #N(24060,4,,1)($),#REGh
  $9A74 #REGe=PEEK #N(42460,4,,1)($); #REGd=PEEK #N(42461,4,,1)($)
  $9A78 CALL #R24850
  $9A7B #REGe=PEEK #REGhl
  $9A7C #REGd=#N(0,2,,1)($)
  $9A7E #REGhl=#N(54015,4,,1)($)
  $9A81 #REGhl=#REGhl+#REGde
  $9A82 Set the zero flag if bit 1 of (#REGhl) is 0
  $9A84 Jump to #R39564 if bit 1 of PEEK #REGhl is reset
  $9A86 Pop last item from stack into #REGbc
  $9A87 Decrement #REGb and jump to #R39518 if #REGb>0
  $9A89 Return
c $9A8A
  $9A8A Pop last item from stack into #REGbc
  $9A8B Return
c $9A8C
  $9A8C Pop last item from stack into #REGbc
  $9A8D #REGe=PEEK #N(42460,4,,1)($); #REGd=PEEK #N(42461,4,,1)($)
  $9A91 POKE #N(23866,4,,1)($),#REGe; POKE #N(23867,4,,1)($),#REGd
  $9A95 CALL #R24850
  $9A98 POKE #N(23870,4,,1)($),#REGl; POKE #N(23871,4,,1)($),#REGh
  $9A9B Return
c $9A9C
  $9A9C #REGa=PEEK #N(24037,4,,1)($)
  $9A9F POKE #N(24013,4,,1)($),#REGa
  $9AA2 #REGa=PEEK #N(24038,4,,1)($)
  $9AA5 #REGb=#REGa
  $9AA6 #REGixl=PEEK #N(23859,4,,1)($); #REGixh=PEEK #N(23860,4,,1)($)
  $9AAA CALL #R27982
  $9AAD Return if the carry flag is set
  $9AAE CALL #R36852
  $9AB1 #REGa=#N(1,2,,1)($)
  $9AB3 POKE #N(24040,4,,1)($),#REGa
  $9AB6 #REGa=PEEK #N(23861,4,,1)($)
  $9AB9 POKE (#REGix+#N(6,2,,1)($)),#REGa
  $9ABC #REGiyl=PEEK #N(24002,4,,1)($); #REGiyh=PEEK #N(24003,4,,1)($)
  $9AC0 #REGa=PEEK (#REGix+#N(20,2,,1)($))
  $9AC3 #REGb=PEEK (#REGiy+#N(1,2,,1)($))
  $9AC6 CALL #R27417
  $9AC9 Push #REGbc onto the stack
  $9ACA #REGl=PEEK #N(23844,4,,1)($); #REGh=PEEK #N(23845,4,,1)($)
  $9ACD POKE #N(42315,4,,1)($),#REGl; POKE #N(42316,4,,1)($),#REGh
  $9AD0 #REGa=PEEK #N(23825,4,,1)($)
  $9AD3 POKE #N(28827,4,,1)($),#REGa
  $9AD6 #REGa=PEEK #N(23826,4,,1)($)
  $9AD9 POKE #N(28825,4,,1)($),#REGa
  $9ADC CALL #R35877
  $9ADF #REGl=PEEK #N(23866,4,,1)($); #REGh=PEEK #N(23867,4,,1)($)
  $9AE2 POKE #N(42317,4,,1)($),#REGl; POKE #N(42318,4,,1)($),#REGh
  $9AE5 CALL #R42320
  $9AE8 Shift #REGa right (copying bit 0 into the carry flag, and resetting bit 7)
  $9AEA Pop last item from stack into #REGbc
  $9AEB Set the zero flag if #REGa=#REGc, or the carry flag if #REGa<#REGc
  $9AEC Jump to #R39663 if #REGa<#REGc
  $9AEE #REGa=#REGc
  $9AEF #REGl=#REGa
  $9AF0 #REGh=#N(0,2,,1)($)
  $9AF2 #REGhl=#REGhl+#REGhl
  $9AF3 #REGhl=#REGhl+#REGhl
  $9AF4 #REGhl=#REGhl+#REGhl
  $9AF5 #REGhl=#REGhl+#REGhl
  $9AF6 #REGhl=#REGhl+#REGhl
  $9AF7 POKE #N(28847,4,,1)($),#REGl; POKE #N(28848,4,,1)($),#REGh
  $9AFA #REGl=PEEK #N(24007,4,,1)($); #REGh=PEEK #N(24008,4,,1)($)
  $9AFD POKE #N(23825,4,,1)($),#REGl; POKE #N(23826,4,,1)($),#REGh
  $9B00 #REGl=PEEK #N(24005,4,,1)($); #REGh=PEEK #N(24006,4,,1)($)
  $9B03 POKE #N(23804,4,,1)($),#REGl; POKE #N(23805,4,,1)($),#REGh
  $9B06 CALL #R36865
  $9B09 CALL #R36881
  $9B0C CALL #R36931
  $9B0F CALL #R35249
  $9B12 #REGa=PEEK #N(23991,4,,1)($)
  $9B15 Clear the carry flag and set the zero flag if #REGa=0
  $9B16 Jump to #R39717 if #REGa=0
  $9B19 #REGl=PEEK #N(23988,4,,1)($); #REGh=PEEK #N(23989,4,,1)($)
  $9B1C #REGa=PEEK #REGhl
  $9B1D POKE #N(28825,4,,1)($),#REGa
  $9B20 #REGhl=#REGhl+1
  $9B21 #REGa=PEEK #REGhl
  $9B22 POKE #N(28827,4,,1)($),#REGa
  $9B25 #REGhl=#N(58975,4,,1)($)
  $9B28 POKE #N(46870,4,,1)($),#REGl; POKE #N(46871,4,,1)($),#REGh
  $9B2B CALL #R35877
  $9B2E #REGl=PEEK #N(23870,4,,1)($); #REGh=PEEK #N(23871,4,,1)($)
  $9B31 #REGa=PEEK #REGhl
  $9B32 Set the zero flag if #REGa=#N(140,2,,1)($), or the carry flag if #REGa<#N(140,2,,1)($)
  $9B34 Jump to #R39784 if #REGa>=#N(140,2,,1)($)
  $9B36 #REGe=#REGa
  $9B37 #REGd=#N(0,2,,1)($)
  $9B39 #REGa=PEEK #N(23991,4,,1)($)
  $9B3C Clear the carry flag and set the zero flag if #REGa=0
  $9B3D Jump to #R39752 if #REGa>0
  $9B3F #REGhl=#N(54015,4,,1)($)
  $9B42 #REGhl=#REGhl+#REGde
  $9B43 Set the zero flag if bit 1 of (#REGhl) is 0
  $9B45 CALL #R39495 if bit 1 of PEEK #REGhl is set
  $9B48 CALL #R39947
  $9B4B #REGixl=PEEK #N(23859,4,,1)($); #REGixh=PEEK #N(23860,4,,1)($)
  $9B4F POKE (#REGix+#N(23,2,,1)($)),0
  $9B53 CALL #R27920
  $9B56 #REGl=PEEK #N(23866,4,,1)($); #REGh=PEEK #N(23867,4,,1)($)
  $9B59 CALL #R28179
  $9B5C CALL #R32664
  $9B5F CALL #R27275
  $9B62 CALL #R28044
  $9B65 Jump to #R39932
b $9B68
t $9B6F
c $9B7E
  $9B7E CALL #R29478
  $9B81 Clear the carry flag and set the zero flag if #REGa=0
  $9B82 Jump to #R39752 if #REGa>0
  $9B84 #REGa=PEEK (#REGix+#N(23,2,,1)($))
  $9B87 Clear the carry flag and set the zero flag if #REGa=0
  $9B88 Jump to #R39752 if #REGa>0
  $9B8A #REGa=PEEK #N(23846,4,,1)($)
  $9B8D Push #REGaf onto the stack
  $9B8E #REGa=PEEK #N(23865,4,,1)($)
  $9B91 POKE #N(23846,4,,1)($),#REGa
  $9B94 CALL #R30813
  $9B97 #REGa=PEEK #N(23951,4,,1)($)
  $9B9A Set the zero flag if #REGa=#N(10,2,,1)($), or the carry flag if #REGa<#N(10,2,,1)($)
  $9B9C Jump to #R39844 if #REGa<#N(10,2,,1)($)
  $9B9E Pop last item from stack into #REGaf
  $9B9F POKE #N(23846,4,,1)($),#REGa
  $9BA2 Jump to #R39752
c $9BA4
  $9BA4 #REGiyl=PEEK #N(23859,4,,1)($); #REGiyh=PEEK #N(23860,4,,1)($)
  $9BA8 #REGa=PEEK (#REGiy+#N(35,2,,1)($))
  $9BAB POKE (#REGix+#N(35,2,,1)($)),#REGa
  $9BAE #REGa=PEEK (#REGiy+#N(36,2,,1)($))
  $9BB1 POKE (#REGix+#N(36,2,,1)($)),#REGa
  $9BB4 #REGa=PEEK (#REGiy+#N(23,2,,1)($))
  $9BB7 POKE (#REGix+#N(23,2,,1)($)),#REGa
  $9BBA CALL #R27920
  $9BBD CALL #R39947
  $9BC0 #REGa=PEEK #N(23843,4,,1)($)
  $9BC3 POKE (#REGix+#N(22,2,,1)($)),#REGa
  $9BC6 #REGa=PEEK #N(23865,4,,1)($)
  $9BC9 POKE (#REGiy+#N(5,2,,1)($)),#REGa
  $9BCC Pop last item from stack into #REGaf
  $9BCD POKE #N(23846,4,,1)($),#REGa
  $9BD0 #REGixl=PEEK #N(23859,4,,1)($); #REGixh=PEEK #N(23860,4,,1)($)
  $9BD4 POKE (#REGix+#N(23,2,,1)($)),0
  $9BD8 CALL #R27920
  $9BDB CALL #R27085
  $9BDE #REGa=#N(81,2,,1)($)
  $9BE0 CALL #R26462
  $9BE3 #REGhl=#N(6148,4,,1)($)
  $9BE6 #REGa=PEEK #N(23865,4,,1)($)
  $9BE9 CALL #R26784
  $9BEC #REGl=PEEK #N(23866,4,,1)($); #REGh=PEEK #N(23867,4,,1)($)
  $9BEF CALL #R28179
  $9BF2 CALL #R32664
  $9BF5 CALL #R28044
  $9BF8 CALL #R27275
  $9BFB Return
c $9BFC
  $9BFC #REGixl=PEEK #N(23859,4,,1)($); #REGixh=PEEK #N(23860,4,,1)($)
  $9C00 POKE (#REGix+#N(35,2,,1)($)),0
  $9C04 POKE (#REGix+#N(23,2,,1)($)),0
  $9C08 Jump to #R36596
c $9C0B
  $9C0B #REGixl=PEEK #N(23859,4,,1)($); #REGixh=PEEK #N(23860,4,,1)($)
  $9C0F #REGa=PEEK (#REGix+#N(23,2,,1)($))
  $9C12 CALL #R26763
  $9C15 POKE (#REGiy+#N(5,2,,1)($)),0
  $9C19 #REGa=PEEK #N(23866,4,,1)($)
  $9C1C POKE (#REGiy+#N(1,2,,1)($)),#REGa
  $9C1F #REGa=PEEK #N(23867,4,,1)($)
  $9C22 POKE (#REGiy+#N(2,2,,1)($)),#REGa
  $9C25 CALL #R27466
  $9C28 POKE (#REGiy+#N(3,2,,1)($)),#REGa
  $9C2B #REGl=PEEK #N(23870,4,,1)($); #REGh=PEEK #N(23871,4,,1)($)
  $9C2E #REGa=PEEK #REGhl
  $9C2F Set the zero flag if #REGa=#N(140,2,,1)($), or the carry flag if #REGa<#N(140,2,,1)($)
  $9C31 Jump to #R39992 if #REGa>=#N(140,2,,1)($)
  $9C33 #REGa=PEEK #N(24039,4,,1)($)
  $9C36 POKE #REGhl,#REGa
  $9C37 Return
c $9C38
  $9C38 CALL #R26562
  $9C3B #REGa=PEEK #N(24039,4,,1)($)
  $9C3E POKE (#REGix+#N(22,2,,1)($)),#REGa
  $9C41 Return
c $9C42
  $9C42 #REGa=PEEK (#REGix+#N(5,2,,1)($))
  $9C45 #REGb=#N(5,2,,1)($)
  $9C47 CALL #R27417
  $9C4A #REGb=#REGc
  $9C4B CALL #R27982
  $9C4E Return if the carry flag is set
  $9C4F #REGa=PEEK #N(23861,4,,1)($)
  $9C52 POKE (#REGix+#N(6,2,,1)($)),#REGa
  $9C55 CALL #R27085
  $9C58 #REGa=#N(85,2,,1)($)
  $9C5A CALL #R26462
  $9C5D #REGhl=#N(6917,4,,1)($)
  $9C60 POKE #N(23945,4,,1)($),#REGl; POKE #N(23946,4,,1)($),#REGh
  $9C63 #REGa=0
  $9C64 POKE #N(23943,4,,1)($),#REGa
  $9C67 POKE #N(23942,4,,1)($),#REGa
  $9C6A #REGa=#N(41,2,,1)($)
  $9C6C POKE #N(23944,4,,1)($),#REGa
  $9C6F CALL #R37627
  $9C72 #REGa=PEEK (#REGix+#N(23,2,,1)($))
  $9C75 CALL #R26763
  $9C78 #REGa=PEEK #N(23942,4,,1)($)
  $9C7B #REGhl=#N(46865,4,,1)($)
  $9C7E #REGa=#REGa+PEEK #REGhl
  $9C7F #REGa=#REGa+PEEK #REGhl
  $9C80 #REGhl=#N(46866,4,,1)($)
  $9C83 #REGa=#REGa+PEEK #REGhl
  $9C84 POKE (#REGiy+#N(4,2,,1)($)),#REGa
  $9C87 POKE (#REGix+#N(36,2,,1)($)),#REGa
  $9C8A Return
c $9C8B
  $9C8B CALL #R27085
  $9C8E #REGiyl=PEEK #N(46890,4,,1)($); #REGiyh=PEEK #N(46891,4,,1)($)
  $9C92 #REGa=PEEK #N(46649,4,,1)($)
  $9C95 #REGb=#REGa
  $9C96 Push #REGbc onto the stack
  $9C97 #REGa=PEEK (#REGiy+#N(4,2,,1)($))
  $9C9A Shift #REGa right (copying bit 0 into the carry flag, and resetting bit 7)
  $9C9C #REGhl=#N(46865,4,,1)($)
  $9C9F Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $9CA0 Jump to #R40184 if #REGa<>PEEK #REGhl
  $9CA2 #REGa=PEEK (#REGiy+#N(4,2,,1)($))
  $9CA5 Keep only bit 0 of #REGa
  $9CA7 #REGhl=#N(46866,4,,1)($)
  $9CAA #REGa=#REGa^PEEK #REGhl
  $9CAB Jump to #R40184 if #REGa>0
  $9CAD #REGa=PEEK (#REGiy+#N(0,2,,1)($))
  $9CB0 Clear the carry flag and set the zero flag if #REGa=0
  $9CB1 Jump to #R40184 if #REGa=0
  $9CB3 CALL #R26591
  $9CB6 Set the zero flag if bit 3 of (#REGix+#N(0,2,,1)($)) is 0
  $9CBA Jump to #R40184 if bit 3 of PEEK (#REGix+#N(0,2,,1)($)) is reset
  $9CBC #REGa=PEEK (#REGiy+#N(5,2,,1)($))
  $9CBF Clear the carry flag and set the zero flag if #REGa=0
  $9CC0 Jump to #R40150 if #REGa=0
  $9CC2 #REGa=#REGa-#N(140,2,,1)($)
  $9CC4 #REGl=#REGa
  $9CC5 #REGh=#N(0,2,,1)($)
  $9CC7 #REGhl=#REGhl+#REGhl
  $9CC8 #REGhl=#REGhl+#REGhl
  $9CC9 #REGde=#N(23633,4,,1)($)
  $9CCC #REGhl=#REGhl+#REGde
  $9CCD #REGa=PEEK #REGhl
  $9CCE POKE (#REGiy+#N(1,2,,1)($)),#REGa
  $9CD1 #REGhl=#REGhl+1
  $9CD2 #REGa=PEEK #REGhl
  $9CD3 POKE (#REGiy+#N(2,2,,1)($)),#REGa
  $9CD6 #REGa=PEEK (#REGiy+#N(1,2,,1)($))
  $9CD9 POKE #N(38548,4,,1)($),#REGa
  $9CDC #REGa=PEEK (#REGiy+#N(2,2,,1)($))
  $9CDF POKE #N(38549,4,,1)($),#REGa
  $9CE2 #REGa=PEEK (#REGix+#N(15,2,,1)($))
  $9CE5 POKE #N(38542,4,,1)($),#REGa
  $9CE8 Push #REGiy onto the stack
  $9CEA CALL #R39375
  $9CED CALL #R38550
  $9CF0 CALL #R39400
  $9CF3 CALL #R25321
  $9CF6 Pop last item from stack into #REGiy
  $9CF8 #REGde=#N(6,4,,1)($)
  $9CFB #REGiy=#REGiy+#REGde
  $9CFD Pop last item from stack into #REGbc
  $9CFE Decrement #REGb and jump to #R40086 if #REGb>0
  $9D00 Return
c $9D01
  $9D01 #REGa=PEEK (#REGix+#N(5,2,,1)($))
  $9D04 #REGb=#N(2,2,,1)($)
  $9D06 CALL #R27417
  $9D09 #REGb=#REGc
  $9D0A CALL #R27982
  $9D0D Return if the carry flag is set
  $9D0E #REGa=PEEK #N(23861,4,,1)($)
  $9D11 POKE (#REGix+#N(6,2,,1)($)),#REGa
  $9D14 #REGa=PEEK #N(27981,4,,1)($)
  $9D17 #REGa=#REGa+PEEK (#REGix+#N(34,2,,1)($))
  $9D1A POKE (#REGix+#N(34,2,,1)($)),#REGa
  $9D1D #REGl=PEEK #N(23919,4,,1)($); #REGh=PEEK #N(23920,4,,1)($)
  $9D20 #REGa=PEEK #REGhl
  $9D21 CALL #R26763
  $9D24 POKE (#REGiy+#N(0,2,,1)($)),0
  $9D28 POKE (#REGiy+#N(5,2,,1)($)),0
  $9D2C #REGl=PEEK #N(23919,4,,1)($); #REGh=PEEK #N(23920,4,,1)($)
  $9D2F #REGhl=#REGhl+1
  $9D30 #REGa=PEEK #REGhl
  $9D31 CALL #R26591
  $9D34 #REGa=PEEK (#REGix+#N(16,2,,1)($))
  $9D37 #REGixl=PEEK #N(23859,4,,1)($); #REGixh=PEEK #N(23860,4,,1)($)
  $9D3B POKE (#REGix+#N(36,2,,1)($)),#REGa
  $9D3E Push #REGaf onto the stack
  $9D3F #REGa=PEEK (#REGix+#N(23,2,,1)($))
  $9D42 CALL #R26763
  $9D45 Pop last item from stack into #REGaf
  $9D46 POKE (#REGiy+#N(4,2,,1)($)),#REGa
  $9D49 CALL #R27085
  $9D4C #REGa=#N(86,2,,1)($)
  $9D4E CALL #R26462
  $9D51 CALL #R28044
  $9D54 Return
c $9D55
  $9D55 CALL #R24620
  $9D58 #REGhl=#N(46725,4,,1)($)
  $9D5B #REGa=PEEK #N(46866,4,,1)($)
  $9D5E Clear the carry flag and set the zero flag if #REGa=0
  $9D5F Jump to #R40292 if #REGa=0
  $9D61 #REGhl=#N(46755,4,,1)($)
  $9D64 POKE #N(24046,4,,1)($),#REGl; POKE #N(24047,4,,1)($),#REGh
  $9D67 #REGa=PEEK #N(46866,4,,1)($)
  $9D6A #REGd=#N(0,2,,1)($)
  $9D6C #REGe=#REGa
  $9D6D #REGhl=#N(46840,4,,1)($)
  $9D70 #REGhl=#REGhl+#REGde
  $9D71 #REGa=#N(88,2,,1)($)
  $9D73 CALL #R26462
  $9D76 #REGhl=#N(1280,4,,1)($)
  $9D79 #REGa=PEEK #N(46866,4,,1)($)
  $9D7C #REGa=#REGa+#N(160,2,,1)($)
  $9D7E CALL #R27514
  $9D81 #REGa=0
  $9D82 CALL #R40487
  $9D85 CALL #R40528
  $9D88 CALL #R40719
  $9D8B CALL #R40798
  $9D8E CALL #R41016
  $9D91 #REGa=#N(91,2,,1)($)
  $9D93 CALL #R26462
  $9D96 #REGa=#N(110,2,,1)($)
  $9D98 POKE #N(24045,4,,1)($),#REGa
  $9D9B CALL #R41130
  $9D9E #REGhl=#N(22528,4,,1)($)
  $9DA1 POKE #N(23853,4,,1)($),#REGl; POKE #N(23854,4,,1)($),#REGh
  $9DA4 #REGa=0
  $9DA5 POKE #N(23851,4,,1)($),#REGa
  $9DA8 CALL #R26904
  $9DAB CALL #R27245
  $9DAE CALL #R26321
  $9DB1 CALL #R45256
  $9DB4 #REGa=PEEK #N(23850,4,,1)($)
  $9DB7 Set the zero flag if bit 0 of #REGa is 0
  $9DB9 Jump to #R40450 if bit 0 of #REGa is reset
  $9DBB Set the zero flag if bit 1 of #REGa is 0
  $9DBD Jump to #R40405 if bit 1 of #REGa is set
  $9DBF CALL #R26904
  $9DC2 #REGa=PEEK #N(23851,4,,1)($)
  $9DC5 #REGa=#REGa-1
  $9DC6 Set the zero flag if #REGa=#N(255,2,,1)($), or the carry flag if #REGa<#N(255,2,,1)($)
  $9DC8 Jump to #R40397 if #REGa<>#N(255,2,,1)($)
  $9DCA #REGa=PEEK #N(23852,4,,1)($)
  $9DCD POKE #N(23851,4,,1)($),#REGa
  $9DD0 CALL #R26904
  $9DD3 Jump to #R40366
c $9DD5
  $9DD5 Set the zero flag if bit 2 of #REGa is 0
  $9DD7 Jump to #R40434 if bit 2 of #REGa is set
  $9DD9 CALL #R26904
  $9DDC #REGa=PEEK #N(23851,4,,1)($)
  $9DDF #REGa=#REGa+1
  $9DE0 #REGb=#REGa
  $9DE1 #REGa=PEEK #N(23852,4,,1)($)
  $9DE4 Set the zero flag if #REGa=#REGb, or the carry flag if #REGa<#REGb
  $9DE5 Jump to #R40425 if #REGa>=#REGb
  $9DE7 #REGb=#N(0,2,,1)($)
  $9DE9 #REGa=#REGb
  $9DEA POKE #N(23851,4,,1)($),#REGa
  $9DED CALL #R26904
  $9DF0 Jump to #R40366
c $9DF2
  $9DF2 #REGa=PEEK #N(23851,4,,1)($)
  $9DF5 Clear the carry flag and set the zero flag if #REGa=0
  $9DF6 CALL #R41060 if #REGa=0
  $9DF9 #REGa=PEEK #N(23851,4,,1)($)
  $9DFC Clear the carry flag and set the zero flag if #REGa=0
  $9DFD CALL #R41181 if #REGa>0
  $9E00 Jump to #R40366
c $9E02
  $9E02 CALL #R26904
  $9E05 #REGa=#N(89,2,,1)($)
  $9E07 CALL #R26462
  $9E0A CALL #R27245
  $9E0D CALL #R45256
  $9E10 #REGa=PEEK #N(23850,4,,1)($)
  $9E13 Set the zero flag if #REGa=#N(255,2,,1)($), or the carry flag if #REGa<#N(255,2,,1)($)
  $9E15 Jump to #R40461 if #REGa=#N(255,2,,1)($)
  $9E17 Set the zero flag if bit 0 of #REGa is 0
  $9E19 Return if bit 0 of #REGa is reset
  $9E1A #REGa=#N(91,2,,1)($)
  $9E1C CALL #R26462
  $9E1F CALL #R41130
  $9E22 CALL #R26904
  $9E25 Jump to #R40366
c $9E27
  $9E27 #REGb=#REGa
  $9E28 #REGhl=#N(18247,4,,1)($)
  $9E2B POKE #N(23808,4,,1)($),#REGl; POKE #N(23809,4,,1)($),#REGh
  $9E2E #REGa=#N(8,2,,1)($)
  $9E30 POKE #N(23817,4,,1)($),#REGa
  $9E33 #REGhl=#N(46840,4,,1)($)
  $9E36 #REGa=PEEK #N(46866,4,,1)($)
  $9E39 #REGe=#REGa
  $9E3A #REGd=#N(0,2,,1)($)
  $9E3C #REGhl=#REGhl+#REGde
  $9E3D #REGa=PEEK #REGhl
  $9E3E Set the zero flag if #REGa=#REGb, or the carry flag if #REGa<#REGb
  $9E3F Jump to #R40526 if #REGa<#REGb
  $9E41 #REGa=#REGa-#REGb
  $9E42 POKE #REGhl,#REGa
  $9E43 #REGhl=#N(7424,4,,1)($)
  $9E46 POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $9E49 CALL #R26360
  $9E4C Set the carry flag
  $9E4D Return
c $9E4E
  $9E4E Clear the carry flag and set the zero flag if #REGa=0
  $9E4F Return
b $9E50
t $9E51
c $9E5E
  $9E5E CALL #R64950 if the parity/overflow flag is not set (parity odd)
  $9E61 #REGhl=#N(23296,4,,1)($)
  $9E64 #REGb=#N(20,2,,1)($)
  $9E66 #REGa=PEEK #N(46866,4,,1)($)
  $9E69 #REGa=#REGa+1
  $9E6A #REGa=#REGa&PEEK #REGhl
  $9E6B Jump to #R40589 if #REGa=0
  $9E6D #REGa=#N(160,2,,1)($)
  $9E6F #REGa=#REGa-#REGb
  $9E70 POKE #N(23846,4,,1)($),#REGa
  $9E73 Push #REGhl onto the stack
  $9E74 CALL #R26562
  $9E77 Pop last item from stack into #REGhl
  $9E78 Set the zero flag if bit 7 of (#REGix+#N(37,2,,1)($)) is 0
  $9E7C Jump to #R40589 if bit 7 of PEEK (#REGix+#N(37,2,,1)($)) is set
  $9E7E #REGa=PEEK #N(23846,4,,1)($)
  $9E81 POKE (#REGiy+#N(0,2,,1)($)),#REGa
  $9E84 #REGiy=#REGiy+1
  $9E86 #REGa=PEEK #N(23852,4,,1)($)
  $9E89 #REGa=#REGa+1
  $9E8A POKE #N(23852,4,,1)($),#REGa
  $9E8D #REGhl=#REGhl+1
  $9E8E Decrement #REGb and jump to #R40550 if #REGb>0
  $9E90 #REGhl=#N(4,4,,1)($)
  $9E93 POKE #N(24043,4,,1)($),#REGl; POKE #N(24044,4,,1)($),#REGh
  $9E96 #REGhl=#N(23296,4,,1)($)
  $9E99 POKE #N(24041,4,,1)($),#REGl; POKE #N(24042,4,,1)($),#REGh
  $9E9C #REGa=PEEK #N(23852,4,,1)($)
  $9E9F #REGb=#REGa
  $9EA0 Push #REGbc onto the stack
  $9EA1 #REGl=PEEK #N(24041,4,,1)($); #REGh=PEEK #N(24042,4,,1)($)
  $9EA4 #REGa=PEEK #REGhl
  $9EA5 POKE #N(23846,4,,1)($),#REGa
  $9EA8 #REGhl=#REGhl+1
  $9EA9 POKE #N(24041,4,,1)($),#REGl; POKE #N(24042,4,,1)($),#REGh
  $9EAC #REGhl=#N(23808,4,,1)($)
  $9EAF POKE #REGhl,#N(70,2,,1)($)
  $9EB1 #REGl=PEEK #N(24043,4,,1)($); #REGh=PEEK #N(24044,4,,1)($)
  $9EB4 CALL #R27539
  $9EB7 #REGl=PEEK #N(24043,4,,1)($); #REGh=PEEK #N(24044,4,,1)($)
  $9EBA #REGde=#N(2048,4,,1)($)
  $9EBD #REGhl=#REGhl+#REGde
  $9EBE POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $9EC1 #REGa=PEEK #N(23846,4,,1)($)
  $9EC4 CALL #R24942
  $9EC7 #REGl=PEEK #N(24043,4,,1)($); #REGh=PEEK #N(24044,4,,1)($)
  $9ECA #REGde=#N(2,4,,1)($)
  $9ECD #REGhl=#REGhl+#REGde
  $9ECE POKE #N(24043,4,,1)($),#REGl; POKE #N(24044,4,,1)($),#REGh
  $9ED1 Pop last item from stack into #REGbc
  $9ED2 Decrement #REGb and jump to #R40608 if #REGb>0
  $9ED4 #REGa=PEEK #N(23852,4,,1)($)
  $9ED7 #REGb=#REGa
  $9ED8 #REGhl=#N(23296,4,,1)($)
  $9EDB Push #REGhl onto the stack
  $9EDC Push #REGbc onto the stack
  $9EDD #REGa=PEEK #N(46649,4,,1)($)
  $9EE0 #REGb=#REGa
  $9EE1 #REGa=PEEK #REGhl
  $9EE2 #REGiyl=PEEK #N(46890,4,,1)($); #REGiyh=PEEK #N(46891,4,,1)($)
  $9EE6 #REGde=#N(6,4,,1)($)
  $9EE9 Set the zero flag if #REGa=PEEK (#REGiy+#N(5,2,,1)($)), or the carry flag if #REGa<PEEK (#REGiy+#N(5,2,,1)($))
  $9EEC Jump to #R40694 if #REGa<>PEEK (#REGiy+#N(5,2,,1)($))
  $9EEE POKE (#REGiy+#N(0,2,,1)($)),0
  $9EF2 POKE (#REGiy+#N(5,2,,1)($)),0
  $9EF6 #REGiy=#REGiy+#REGde
  $9EF8 Decrement #REGb and jump to #R40681 if #REGb>0
  $9EFA CALL #R26562
  $9EFD POKE (#REGix+#N(23,2,,1)($)),0
  $9F01 POKE (#REGix+#N(35,2,,1)($)),0
  $9F05 POKE (#REGix+#N(36,2,,1)($)),0
  $9F09 Pop last item from stack into #REGbc
  $9F0A Pop last item from stack into #REGhl
  $9F0B #REGhl=#REGhl+1
  $9F0C Decrement #REGb and jump to #R40667 if #REGb>0
  $9F0E Return
c $9F0F
  $9F0F #REGa=#N(90,2,,1)($)
  $9F11 CALL #R26462
  $9F14 #REGa=#N(70,2,,1)($)
  $9F16 POKE #N(23808,4,,1)($),#REGa
  $9F19 #REGhl=#N(5129,4,,1)($)
  $9F1C POKE #N(24043,4,,1)($),#REGl; POKE #N(24044,4,,1)($),#REGh
  $9F1F #REGhl=#N(46792,4,,1)($)
  $9F22 POKE #N(24041,4,,1)($),#REGl; POKE #N(24042,4,,1)($),#REGh
  $9F25 #REGb=#N(4,2,,1)($)
  $9F27 Push #REGbc onto the stack
  $9F28 #REGb=#N(7,2,,1)($)
  $9F2A Push #REGbc onto the stack
  $9F2B #REGl=PEEK #N(24041,4,,1)($); #REGh=PEEK #N(24042,4,,1)($)
  $9F2E #REGa=PEEK #REGhl
  $9F2F #REGhl=#REGhl+1
  $9F30 POKE #N(24041,4,,1)($),#REGl; POKE #N(24042,4,,1)($),#REGh
  $9F33 #REGl=PEEK #N(24043,4,,1)($); #REGh=PEEK #N(24044,4,,1)($)
  $9F36 POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $9F39 CALL #R26360
  $9F3C #REGa=PEEK #N(24043,4,,1)($)
  $9F3F #REGa=#REGa+1
  $9F40 Set the zero flag if #REGa=#N(13,2,,1)($), or the carry flag if #REGa<#N(13,2,,1)($)
  $9F42 Jump to #R40773 if #REGa<>#N(13,2,,1)($)
  $9F44 #REGa=#REGa+1
  $9F45 Set the zero flag if #REGa=#N(16,2,,1)($), or the carry flag if #REGa<#N(16,2,,1)($)
  $9F47 Jump to #R40778 if #REGa<>#N(16,2,,1)($)
  $9F49 #REGa=#REGa+1
  $9F4A POKE #N(24043,4,,1)($),#REGa
  $9F4D Pop last item from stack into #REGbc
  $9F4E Decrement #REGb and jump to #R40746 if #REGb>0
  $9F50 #REGl=PEEK #N(24043,4,,1)($); #REGh=PEEK #N(24044,4,,1)($)
  $9F53 #REGde=#N(759,4,,1)($)
  $9F56 #REGhl=#REGhl+#REGde
  $9F57 POKE #N(24043,4,,1)($),#REGl; POKE #N(24044,4,,1)($),#REGh
  $9F5A Pop last item from stack into #REGbc
  $9F5B Decrement #REGb and jump to #R40743 if #REGb>0
  $9F5D Return
c $9F5E
  $9F5E #REGhl=#N(22592,4,,1)($)
  $9F61 POKE #N(23853,4,,1)($),#REGl; POKE #N(23854,4,,1)($),#REGh
  $9F64 #REGhl=#N(2564,4,,1)($)
  $9F67 POKE #N(23945,4,,1)($),#REGl; POKE #N(23946,4,,1)($),#REGh
  $9F6A #REGhl=#N(23296,4,,1)($)
  $9F6D POKE #N(24041,4,,1)($),#REGl; POKE #N(24042,4,,1)($),#REGh
  $9F70 #REGa=0
  $9F71 POKE #N(23943,4,,1)($),#REGa
  $9F74 #REGa=#N(5,2,,1)($)
  $9F76 POKE #N(23944,4,,1)($),#REGa
  $9F79 #REGhl=#N(18247,4,,1)($)
  $9F7C POKE #N(23808,4,,1)($),#REGl; POKE #N(23809,4,,1)($),#REGh
  $9F7F #REGa=PEEK #N(23852,4,,1)($)
  $9F82 #REGb=#REGa
  $9F83 Push #REGbc onto the stack
  $9F84 #REGl=PEEK #N(24041,4,,1)($); #REGh=PEEK #N(24042,4,,1)($)
  $9F87 #REGa=PEEK #REGhl
  $9F88 #REGhl=#REGhl+1
  $9F89 POKE #N(24041,4,,1)($),#REGl; POKE #N(24042,4,,1)($),#REGh
  $9F8C CALL #R26562
  $9F8F CALL #R26904
  $9F92 #REGa=0
  $9F93 POKE #N(23942,4,,1)($),#REGa
  $9F96 CALL #R27245
  $9F99 CALL #R37627
  $9F9C #REGa=PEEK #N(23942,4,,1)($)
  $9F9F #REGl=#REGa
  $9FA0 #REGh=#N(0,2,,1)($)
  $9FA2 #REGhl=#REGhl+#REGhl
  $9FA3 #REGhl=#REGhl+#REGhl
  $9FA4 #REGhl=#REGhl+#REGhl
  $9FA5 #REGd=#N(0,2,,1)($)
  $9FA7 #REGe=#REGa
  $9FA8 #REGhl=#REGhl-carry-#REGde
  $9FAA #REGde=#N(46785,4,,1)($)
  $9FAD #REGhl=#REGhl+#REGde
  $9FAE #REGa=PEEK #REGhl
  $9FAF POKE (#REGix+#N(13,2,,1)($)),#REGa
  $9FB2 #REGhl=#REGhl+1
  $9FB3 #REGa=PEEK #REGhl
  $9FB4 POKE (#REGix+#N(16,2,,1)($)),#REGa
  $9FB7 #REGhl=#REGhl+1
  $9FB8 #REGa=PEEK #REGhl
  $9FB9 POKE (#REGix+#N(14,2,,1)($)),#REGa
  $9FBC #REGhl=#REGhl+1
  $9FBD #REGa=PEEK #REGhl
  $9FBE POKE (#REGix+#N(15,2,,1)($)),#REGa
  $9FC1 #REGhl=#REGhl+1
  $9FC2 #REGa=PEEK #REGhl
  $9FC3 POKE (#REGix+#N(17,2,,1)($)),#REGa
  $9FC6 #REGhl=#REGhl+1
  $9FC7 #REGa=PEEK #REGhl
  $9FC8 POKE (#REGix+#N(38,2,,1)($)),#REGa
  $9FCB #REGhl=#REGhl+1
  $9FCC #REGa=PEEK #REGhl
  $9FCD CALL #R40487
  $9FD0 #REGhl=#N(23945,4,,1)($)
  $9FD3 POKE #REGhl,(PEEK #REGhl)+1
  $9FD4 POKE #REGhl,(PEEK #REGhl)+1
  $9FD5 CALL #R26904
  $9FD8 #REGhl=#N(23851,4,,1)($)
  $9FDB POKE #REGhl,(PEEK #REGhl)+1
  $9FDC Pop last item from stack into #REGbc
  $9FDD Decrement #REGb and jump to #R40835 if #REGb>0
  $9FDF Return
c $9FE0
  $9FE0 #REGa=PEEK #N(23851,4,,1)($)
  $9FE3 #REGa=#REGa-1
  $9FE4 #REGe=#REGa
  $9FE5 #REGd=#N(0,2,,1)($)
  $9FE7 #REGhl=#N(3076,4,,1)($)
  $9FEA #REGhl=#REGhl+#REGde
  $9FEB #REGhl=#REGhl+#REGde
  $9FEC POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $9FEF #REGiy=#N(23296,4,,1)($)
  $9FF3 #REGiy=#REGiy+#REGde
  $9FF5 #REGixl=PEEK #N(46890,4,,1)($); #REGixh=PEEK #N(46891,4,,1)($)
  $9FF9 #REGa=0
  $9FFA POKE #N(24053,4,,1)($),#REGa
  $9FFD #REGa=PEEK #N(46649,4,,1)($)
  $A000 #REGb=#REGa
  $A001 Push #REGbc onto the stack
  $A002 #REGa=PEEK (#REGix+#N(5,2,,1)($))
  $A005 Set the zero flag if #REGa=PEEK (#REGiy+#N(0,2,,1)($)), or the carry flag if #REGa<PEEK (#REGiy+#N(0,2,,1)($))
  $A008 Jump to #R40988 if #REGa<>PEEK (#REGiy+#N(0,2,,1)($))
  $A00A #REGa=PEEK (#REGix+#N(0,2,,1)($))
  $A00D CALL #R24942
  $A010 #REGa=PEEK #N(23807,4,,1)($)
  $A013 #REGa=#REGa+#N(2,2,,1)($)
  $A015 POKE #N(23807,4,,1)($),#REGa
  $A018 #REGhl=#N(24053,4,,1)($)
  $A01B POKE #REGhl,(PEEK #REGhl)+1
  $A01C Pop last item from stack into #REGbc
  $A01D #REGde=#N(6,4,,1)($)
  $A020 #REGix=#REGix+#REGde
  $A022 Decrement #REGb and jump to #R40961 if #REGb>0
  $A024 #REGa=PEEK #N(23807,4,,1)($)
  $A027 Set the zero flag if #REGa=#N(32,2,,1)($), or the carry flag if #REGa<#N(32,2,,1)($)
  $A029 Return if #REGa=#N(32,2,,1)($)
  $A02A #REGa=0
  $A02B CALL #R24751
  $A02E #REGa=PEEK #N(23807,4,,1)($)
  $A031 #REGa=#REGa+#N(2,2,,1)($)
  $A033 POKE #N(23807,4,,1)($),#REGa
  $A036 Jump to #R40996
c $A038
  $A038 #REGhl=#N(3076,4,,1)($)
  $A03B POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $A03E #REGb=#N(10,2,,1)($)
  $A040 Push #REGbc onto the stack
  $A041 #REGb=#N(10,2,,1)($)
  $A043 Push #REGbc onto the stack
  $A044 #REGa=0
  $A045 CALL #R24751
  $A048 #REGa=PEEK #N(23807,4,,1)($)
  $A04B #REGa=#REGa+#N(2,2,,1)($)
  $A04D POKE #N(23807,4,,1)($),#REGa
  $A050 Pop last item from stack into #REGbc
  $A051 Decrement #REGb and jump to #R41027 if #REGb>0
  $A053 #REGa=#N(12,2,,1)($)
  $A055 POKE #N(23807,4,,1)($),#REGa
  $A058 #REGa=PEEK #N(23806,4,,1)($)
  $A05B #REGa=#REGa+#N(2,2,,1)($)
  $A05D POKE #N(23806,4,,1)($),#REGa
  $A060 Pop last item from stack into #REGbc
  $A061 Decrement #REGb and jump to #R41024 if #REGb>0
  $A063 Return
c $A064
  $A064 #REGa=PEEK #N(23850,4,,1)($)
  $A067 Set the zero flag if bit 3 of #REGa is 0
  $A069 Jump to #R41089 if bit 3 of #REGa is set
  $A06B #REGa=PEEK #N(24045,4,,1)($)
  $A06E #REGa=#REGa+1
  $A06F Set the zero flag if #REGa=#N(140,2,,1)($), or the carry flag if #REGa<#N(140,2,,1)($)
  $A071 Jump to #R41077 if #REGa<>#N(140,2,,1)($)
  $A073 #REGa=#N(110,2,,1)($)
  $A075 POKE #N(24045,4,,1)($),#REGa
  $A078 CALL #R41114
  $A07B Jump to #R41067 if the zero flag is set
  $A07D CALL #R41130
  $A080 Return
c $A081
  $A081 Set the zero flag if bit 4 of #REGa is 0
  $A083 Return if bit 4 of #REGa is set
  $A084 #REGa=PEEK #N(24045,4,,1)($)
  $A087 #REGa=#REGa-1
  $A088 Set the zero flag if #REGa=#N(109,2,,1)($), or the carry flag if #REGa<#N(109,2,,1)($)
  $A08A Jump to #R41102 if #REGa<>#N(109,2,,1)($)
  $A08C #REGa=#N(139,2,,1)($)
  $A08E POKE #N(24045,4,,1)($),#REGa
  $A091 CALL #R41114
  $A094 Jump to #R41092 if the zero flag is set
  $A096 CALL #R41130
  $A099 Return
c $A09A
  $A09A #REGa=#REGa-#N(110,2,,1)($)
  $A09C #REGe=#REGa
  $A09D #REGd=#N(0,2,,1)($)
  $A09F #REGl=PEEK #N(24046,4,,1)($); #REGh=PEEK #N(24047,4,,1)($)
  $A0A2 #REGhl=#REGhl+#REGde
  $A0A3 #REGa=PEEK #REGhl
  $A0A4 POKE #N(24048,4,,1)($),#REGa
  $A0A7 Set the zero flag if #REGa=#N(255,2,,1)($), or the carry flag if #REGa<#N(255,2,,1)($)
  $A0A9 Return
c $A0AA
  $A0AA #REGhl=#N(2562,4,,1)($)
  $A0AD POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $A0B0 #REGa=PEEK #N(24045,4,,1)($)
  $A0B3 CALL #R24942
  $A0B6 #REGhl=#N(17990,4,,1)($)
  $A0B9 POKE #N(23808,4,,1)($),#REGl; POKE #N(23809,4,,1)($),#REGh
  $A0BC #REGhl=#N(3330,4,,1)($)
  $A0BF #REGa=PEEK #N(24045,4,,1)($)
  $A0C2 CALL #R27539
  $A0C5 #REGa=#N(8,2,,1)($)
  $A0C7 POKE #N(23817,4,,1)($),#REGa
  $A0CA #REGa=PEEK #N(24045,4,,1)($)
  $A0CD CALL #R41114
  $A0D0 #REGhl=#N(7426,4,,1)($)
  $A0D3 POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $A0D6 #REGa=PEEK #N(24048,4,,1)($)
  $A0D9 CALL #R26360
  $A0DC Return
c $A0DD
  $A0DD #REGa=PEEK #N(23850,4,,1)($)
  $A0E0 Set the zero flag if bit 3 of #REGa is 0
  $A0E2 CALL #R41198 if bit 3 of #REGa is reset
  $A0E5 #REGa=PEEK #N(23850,4,,1)($)
  $A0E8 Set the zero flag if bit 4 of #REGa is 0
  $A0EA CALL #R41415 if bit 4 of #REGa is reset
  $A0ED Return
c $A0EE
  $A0EE CALL #R40928
  $A0F1 #REGa=PEEK #N(24053,4,,1)($)
  $A0F4 Set the zero flag if #REGa=#N(10,2,,1)($), or the carry flag if #REGa<#N(10,2,,1)($)
  $A0F6 Return if #REGa=#N(10,2,,1)($)
  $A0F7 CALL #R41399
  $A0FA #REGa=PEEK #N(23846,4,,1)($)
  $A0FD CALL #R26562
  $A100 POKE #N(23859,4,,1)($),#REGixl; POKE #N(23860,4,,1)($),#REGixh
  $A104 CALL #R32267
  $A107 #REGa=PEEK #N(24045,4,,1)($)
  $A10A CALL #R26591
  $A10D #REGiyl=PEEK #N(23859,4,,1)($); #REGiyh=PEEK #N(23860,4,,1)($)
  $A111 #REGa=PEEK (#REGix+#N(1,2,,1)($))
  $A114 #REGhl=#N(23953,4,,1)($)
  $A117 #REGa=#REGa+PEEK #REGhl
  $A118 Jump to #R41267 if the carry flag is set
  $A11A Shift #REGa right (copying bit 0 into the carry flag, and resetting bit 7)
  $A11C #REGa=#REGa+#N(10,2,,1)($)
  $A11E Set the zero flag if #REGa=PEEK (#REGiy+#N(20,2,,1)($)), or the carry flag if #REGa<PEEK (#REGiy+#N(20,2,,1)($))
  $A121 Jump to #R41267 if #REGa>=PEEK (#REGiy+#N(20,2,,1)($))
  $A123 #REGa=PEEK (#REGix+#N(2,2,,1)($))
  $A126 #REGhl=#N(23954,4,,1)($)
  $A129 #REGa=#REGa+PEEK #REGhl
  $A12A Jump to #R41274 if the carry flag is set
  $A12C Set the zero flag if #REGa=PEEK (#REGiy+#N(38,2,,1)($)), or the carry flag if #REGa<PEEK (#REGiy+#N(38,2,,1)($))
  $A12F Jump to #R41274 if #REGa>=PEEK (#REGiy+#N(38,2,,1)($))
  $A131 Jump to #R41293
c $A133
  $A133 #REGa=#N(92,2,,1)($)
  $A135 CALL #R26462
  $A138 Jump to #R41279
c $A13A
  $A13A #REGa=#N(93,2,,1)($)
  $A13C CALL #R26462
  $A13F #REGa=#N(11,2,,1)($)
  $A141 CALL #R46526
  $A144 #REGa=#N(91,2,,1)($)
  $A146 CALL #R26462
  $A149 CALL #R41130
  $A14C Return
c $A14D
  $A14D CALL #R41399
  $A150 #REGiyl=PEEK #N(46890,4,,1)($); #REGiyh=PEEK #N(46891,4,,1)($)
  $A154 #REGa=PEEK #N(46649,4,,1)($)
  $A157 #REGa=#REGa-#N(16,2,,1)($)
  $A159 #REGb=#REGa
  $A15A Push #REGbc onto the stack
  $A15B #REGa=PEEK (#REGiy+#N(0,2,,1)($))
  $A15E Clear the carry flag and set the zero flag if #REGa=0
  $A15F Jump to #R41390 if #REGa>0
  $A161 #REGa=PEEK #N(24048,4,,1)($)
  $A164 CALL #R40487
  $A167 Jump to #R41380 if the carry flag is not set
  $A169 #REGa=PEEK #N(23846,4,,1)($)
  $A16C POKE (#REGiy+#N(5,2,,1)($)),#REGa
  $A16F #REGa=PEEK #N(24045,4,,1)($)
  $A172 POKE (#REGiy+#N(0,2,,1)($)),#REGa
  $A175 POKE (#REGiy+#N(4,2,,1)($)),0
  $A179 CALL #R26591
  $A17C Set the zero flag if bit 3 of (#REGix+#N(0,2,,1)($)) is 0
  $A180 Jump to #R41350 if bit 3 of PEEK (#REGix+#N(0,2,,1)($)) is reset
  $A182 POKE (#REGiy+#N(4,2,,1)($)),255
  $A186 Set the zero flag if bit 5 of (#REGix+#N(0,2,,1)($)) is 0
  $A18A Jump to #R41362 if bit 5 of PEEK (#REGix+#N(0,2,,1)($)) is reset
  $A18C #REGa=PEEK (#REGix+#N(16,2,,1)($))
  $A18F POKE (#REGiy+#N(4,2,,1)($)),#REGa
  $A192 Set the zero flag if bit 1 of (#REGix+#N(0,2,,1)($)) is 0
  $A196 Jump to #R41380 if bit 1 of PEEK (#REGix+#N(0,2,,1)($)) is reset
  $A198 #REGa=PEEK (#REGix+#N(16,2,,1)($))
  $A19B CALL #R26591
  $A19E #REGa=PEEK (#REGix+#N(16,2,,1)($))
  $A1A1 POKE (#REGiy+#N(4,2,,1)($)),#REGa
  $A1A4 Pop last item from stack into #REGbc
  $A1A5 CALL #R40928
  $A1A8 #REGa=#N(2,2,,1)($)
  $A1AA CALL #R46526
  $A1AD Return
c $A1AE
  $A1AE Pop last item from stack into #REGbc
  $A1AF #REGde=#N(6,4,,1)($)
  $A1B2 #REGiy=#REGiy+#REGde
  $A1B4 Decrement #REGb and jump to #R41306 if #REGb>0
  $A1B6 Return
c $A1B7
  $A1B7 #REGa=PEEK #N(23851,4,,1)($)
  $A1BA #REGa=#REGa-1
  $A1BB #REGe=#REGa
  $A1BC #REGd=#N(0,2,,1)($)
  $A1BE #REGhl=#N(23296,4,,1)($)
  $A1C1 #REGhl=#REGhl+#REGde
  $A1C2 #REGa=PEEK #REGhl
  $A1C3 POKE #N(23846,4,,1)($),#REGa
  $A1C6 Return
c $A1C7
  $A1C7 CALL #R41399
  $A1CA #REGiyl=PEEK #N(46890,4,,1)($); #REGiyh=PEEK #N(46891,4,,1)($)
  $A1CE #REGa=PEEK #N(46649,4,,1)($)
  $A1D1 #REGb=#REGa
  $A1D2 Push #REGbc onto the stack
  $A1D3 #REGa=PEEK #N(23846,4,,1)($)
  $A1D6 Set the zero flag if #REGa=PEEK (#REGiy+#N(5,2,,1)($)), or the carry flag if #REGa<PEEK (#REGiy+#N(5,2,,1)($))
  $A1D9 Jump to #R41480 if #REGa<>PEEK (#REGiy+#N(5,2,,1)($))
  $A1DB #REGa=PEEK #N(24045,4,,1)($)
  $A1DE Set the zero flag if #REGa=PEEK (#REGiy+#N(0,2,,1)($)), or the carry flag if #REGa<PEEK (#REGiy+#N(0,2,,1)($))
  $A1E1 Jump to #R41480 if #REGa<>PEEK (#REGiy+#N(0,2,,1)($))
  $A1E3 POKE (#REGiy+#N(5,2,,1)($)),0
  $A1E7 POKE (#REGiy+#N(0,2,,1)($)),0
  $A1EB #REGa=PEEK #N(46866,4,,1)($)
  $A1EE #REGe=#REGa
  $A1EF #REGd=#N(0,2,,1)($)
  $A1F1 #REGhl=#N(46840,4,,1)($)
  $A1F4 #REGhl=#REGhl+#REGde
  $A1F5 #REGa=PEEK #N(24048,4,,1)($)
  $A1F8 #REGa=#REGa+PEEK #REGhl
  $A1F9 POKE #REGhl,#REGa
  $A1FA #REGa=0
  $A1FB CALL #R40487
  $A1FE CALL #R40928
  $A201 #REGa=#N(1,2,,1)($)
  $A203 CALL #R46526
  $A206 Pop last item from stack into #REGbc
  $A207 Return
c $A208
  $A208 Pop last item from stack into #REGbc
  $A209 #REGde=#N(6,4,,1)($)
  $A20C #REGiy=#REGiy+#REGde
  $A20E Decrement #REGb and jump to #R41426 if #REGb>0
  $A210 Return
c $A211
  $A211 CALL #R24620
  $A214 #REGa=0
  $A215 POKE #N(24055,4,,1)($),#REGa
  $A218 #REGa=#N(94,2,,1)($)
  $A21A CALL #R26462
  $A21D #REGa=#N(2,2,,1)($)
  $A21F POKE #N(24054,4,,1)($),#REGa
  $A222 CALL #R27245
  $A225 CALL #R41590
  $A228 Set the zero flag if #REGa=#N(1,2,,1)($), or the carry flag if #REGa<#N(1,2,,1)($)
  $A22A Jump to #R41522 if #REGa=#N(1,2,,1)($)
  $A22C #REGa=#N(1,2,,1)($)
  $A22E CALL #R41658
  $A231 Return
c $A232
  $A232 CALL #R24620
  $A235 #REGa=PEEK #N(46724,4,,1)($)
  $A238 POKE #N(24054,4,,1)($),#REGa
  $A23B #REGhl=#N(4876,4,,1)($)
  $A23E POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $A241 CALL #R26360
  $A244 #REGa=#N(95,2,,1)($)
  $A246 CALL #R26462
  $A249 CALL #R27245
  $A24C CALL #R41590
  $A24F #REGb=#REGa
  $A250 #REGa=#REGa-1
  $A251 #REGe=#REGa
  $A252 #REGd=#N(0,2,,1)($)
  $A254 #REGhl=#N(46677,4,,1)($)
  $A257 #REGhl=#REGhl+#REGde
  $A258 #REGa=PEEK #REGhl
  $A259 POKE #N(24056,4,,1)($),#REGa
  $A25C #REGhl=#N(46842,4,,1)($)
  $A25F #REGhl=#REGhl+#REGde
  $A260 #REGa=PEEK #REGhl
  $A261 POKE #N(46840,4,,1)($),#REGa
  $A264 #REGa=#REGb
  $A265 #REGa=#REGa+1
  $A266 CALL #R41658
  $A269 #REGa=#N(1,2,,1)($)
  $A26B POKE #N(46854,4,,1)($),#REGa
  $A26E Return
c $A26F
  $A26F #REGa=#N(0,2,,1)($)
  $A271 POKE #N(24057,4,,1)($),#REGa
  $A274 Jump to #R41595
c $A276
  $A276 #REGa=#N(1,2,,1)($)
  $A278 POKE #N(24057,4,,1)($),#REGa
  $A27B CALL #R27245
  $A27E #REGa=PEEK #N(24057,4,,1)($)
  $A281 Clear the carry flag and set the zero flag if #REGa=0
  $A282 Jump to #R41616 if #REGa>0
  $A284 CALL #R45256
  $A287 #REGa=PEEK #N(23850,4,,1)($)
  $A28A Set the zero flag if bit 0 of #REGa is 0
  $A28C #REGa=#N(0,2,,1)($)
  $A28E Jump to #R41643 if the zero flag is set
  $A290 CALL #R654
  $A293 #REGa=#REGe
  $A294 Set the zero flag if #REGa=#N(255,2,,1)($), or the carry flag if #REGa<#N(255,2,,1)($)
  $A296 Jump to #R41598 if #REGa=#N(255,2,,1)($)
  $A298 #REGhl=#N(24054,4,,1)($)
  $A29B #REGb=PEEK #REGhl
  $A29C #REGc=#N(1,2,,1)($)
  $A29E #REGhl=#N(41651,4,,1)($)
  $A2A1 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $A2A2 Jump to #R41642 if #REGa=PEEK #REGhl
  $A2A4 #REGhl=#REGhl+1
  $A2A5 #REGc=#REGc+1
  $A2A6 Decrement #REGb and jump to #R41633 if #REGb>0
  $A2A8 Jump to #R41598
c $A2AA
  $A2AA #REGa=#REGc
  $A2AB Push #REGaf onto the stack
  $A2AC #REGa=0
  $A2AD CALL #R46526
  $A2B0 Pop last item from stack into #REGaf
  $A2B1 Clear the carry flag and set the zero flag if #REGa=0
  $A2B2 Return
c $A2B3
  $A2B3 #REGh=#REGh+1
  $A2B4 #REGe=#REGe+1
  $A2B5 #REGd=#REGd+1
  $A2B6 #REGc=#REGc+1
  $A2B7 #REGb=#REGb+1
  $A2B8 #REGbc=#REGbc+1
  $A2B9 #REGbc=#REGbc-1
  $A2BA #REGb=#REGa
  $A2BB #REGa=0
  $A2BC Set the carry flag
  $A2BD Rotate #REGa left through the carry flag
  $A2BE Decrement #REGb and jump to #R41661 if #REGb>0
  $A2C0 POKE #N(24058,4,,1)($),#REGa
  $A2C3 #REGa=#N(140,2,,1)($)
  $A2C5 POKE #N(23846,4,,1)($),#REGa
  $A2C8 #REGb=#N(20,2,,1)($)
  $A2CA #REGhl=#N(46704,4,,1)($)
  $A2CD Push #REGbc onto the stack
  $A2CE Push #REGhl onto the stack
  $A2CF #REGa=PEEK #REGhl
  $A2D0 #REGhl=#N(24058,4,,1)($)
  $A2D3 #REGa=#REGa&PEEK #REGhl
  $A2D4 Jump to #R41700 if #REGa>0
  $A2D6 #REGa=PEEK #N(23846,4,,1)($)
  $A2D9 CALL #R26562
  $A2DC #REGa=#N(128,2,,1)($)
  $A2DE #REGa=#REGa|PEEK (#REGix+#N(37,2,,1)($))
  $A2E1 POKE (#REGix+#N(37,2,,1)($)),#REGa
  $A2E4 #REGhl=#N(23846,4,,1)($)
  $A2E7 POKE #REGhl,(PEEK #REGhl)+1
  $A2E8 Pop last item from stack into #REGhl
  $A2E9 #REGhl=#REGhl+1
  $A2EA Pop last item from stack into #REGbc
  $A2EB Decrement #REGb and jump to #R41677 if #REGb>0
  $A2ED Return
c $A2EE
  $A2EE #REGa=#N(140,2,,1)($)
  $A2F0 POKE #N(23846,4,,1)($),#REGa
  $A2F3 #REGa=PEEK #N(23846,4,,1)($)
  $A2F6 CALL #R26562
  $A2F9 Set the zero flag if bit 7 of (#REGix+#N(37,2,,1)($)) is 0
  $A2FD Jump to #R41826 if bit 7 of PEEK (#REGix+#N(37,2,,1)($)) is set
  $A2FF #REGa=PEEK (#REGix+#N(28,2,,1)($))
  $A302 #REGhl=#N(46865,4,,1)($)
  $A305 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $A306 Jump to #R41826 if #REGa<>PEEK #REGhl
  $A308 #REGa=PEEK (#REGix+#N(30,2,,1)($))
  $A30B POKE #N(23963,4,,1)($),#REGa
  $A30E CALL #R32945
  $A311 #REGa=#REGa+PEEK (#REGix+#N(29,2,,1)($))
  $A314 POKE #N(23844,4,,1)($),#REGa
  $A317 #REGa=PEEK (#REGix+#N(32,2,,1)($))
  $A31A POKE #N(23963,4,,1)($),#REGa
  $A31D CALL #R32945
  $A320 #REGa=#REGa+PEEK (#REGix+#N(31,2,,1)($))
  $A323 POKE #N(23845,4,,1)($),#REGa
  $A326 #REGe=PEEK #N(23844,4,,1)($); #REGd=PEEK #N(23845,4,,1)($)
  $A32A CALL #R24850
  $A32D POKE #N(23855,4,,1)($),#REGl; POKE #N(23856,4,,1)($),#REGh
  $A330 #REGa=PEEK #REGhl
  $A331 Set the zero flag if #REGa=#N(140,2,,1)($), or the carry flag if #REGa<#N(140,2,,1)($)
  $A333 Jump to #R41736 if #REGa>=#N(140,2,,1)($)
  $A335 POKE (#REGix+#N(22,2,,1)($)),#REGa
  $A338 #REGl=PEEK #N(23844,4,,1)($); #REGh=PEEK #N(23845,4,,1)($)
  $A33B POKE #N(23866,4,,1)($),#REGl; POKE #N(23867,4,,1)($),#REGh
  $A33E CALL #R27466
  $A341 CALL #R26615
  $A344 #REGe=PEEK (#REGix+#N(4,2,,1)($))
  $A347 #REGd=#N(0,2,,1)($)
  $A349 #REGiy=#REGiy+#REGde
  $A34B #REGa=PEEK (#REGiy+#N(0,2,,1)($))
  $A34E Set the zero flag if #REGa=#N(255,2,,1)($), or the carry flag if #REGa<#N(255,2,,1)($)
  $A350 Jump to #R41736 if #REGa=#N(255,2,,1)($)
  $A352 #REGl=PEEK #N(23855,4,,1)($); #REGh=PEEK #N(23856,4,,1)($)
  $A355 #REGa=PEEK #N(23846,4,,1)($)
  $A358 POKE #REGhl,#REGa
  $A359 CALL #R27920
  $A35C #REGa=PEEK #N(23846,4,,1)($)
  $A35F CALL #R29889
  $A362 #REGa=PEEK #N(23846,4,,1)($)
  $A365 #REGa=#REGa+1
  $A366 POKE #N(23846,4,,1)($),#REGa
  $A369 Set the zero flag if #REGa=#N(160,2,,1)($), or the carry flag if #REGa<#N(160,2,,1)($)
  $A36B Jump to #R41715 if #REGa<>#N(160,2,,1)($)
  $A36E Return
s $A36F
c $A370
  $A370 CALL #R24620
  $A373 #REGa=#N(1,2,,1)($)
  $A375 POKE #N(41839,4,,1)($),#REGa
  $A378 #REGhl=#N(8980,4,,1)($)
  $A37B POKE #N(23804,4,,1)($),#REGl; POKE #N(23805,4,,1)($),#REGh
  $A37E #REGhl=#N(1285,4,,1)($)
  $A381 POKE #N(23825,4,,1)($),#REGl; POKE #N(23826,4,,1)($),#REGh
  $A384 #REGa=#N(140,2,,1)($)
  $A386 POKE #N(23846,4,,1)($),#REGa
  $A389 #REGa=PEEK #N(23846,4,,1)($)
  $A38C #REGa=#REGa-#N(140,2,,1)($)
  $A38E #REGe=#REGa
  $A38F #REGd=#N(0,2,,1)($)
  $A391 #REGhl=#N(46820,4,,1)($)
  $A394 #REGhl=#REGhl+#REGde
  $A395 Set the zero flag if bit 2 of (#REGhl) is 0
  $A397 Jump to #R42084 if bit 2 of PEEK #REGhl is reset
  $A39A #REGa=PEEK #N(23846,4,,1)($)
  $A39D CALL #R26562
  $A3A0 #REGa=PEEK (#REGix+#N(37,2,,1)($))
  $A3A3 Keep only bit 0 of #REGa
  $A3A5 #REGhl=#N(46866,4,,1)($)
  $A3A8 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $A3A9 Jump to #R42084 if #REGa<>PEEK #REGhl
  $A3AC Set the zero flag if bit 7 of (#REGix+#N(37,2,,1)($)) is 0
  $A3B0 Jump to #R42084 if bit 7 of PEEK (#REGix+#N(37,2,,1)($)) is set
  $A3B3 CALL #R27085
  $A3B6 #REGa=#N(96,2,,1)($)
  $A3B8 CALL #R26462
  $A3BB #REGhl=#N(18247,4,,1)($)
  $A3BE POKE #N(23808,4,,1)($),#REGl; POKE #N(23809,4,,1)($),#REGh
  $A3C1 #REGhl=#N(7936,4,,1)($)
  $A3C4 POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $A3C7 #REGhl=#N(46866,4,,1)($)
  $A3CA #REGa=#N(49,2,,1)($)
  $A3CC #REGa=#REGa+PEEK #REGhl
  $A3CD CALL #R25847
  $A3D0 #REGa=PEEK #N(23846,4,,1)($)
  $A3D3 #REGhl=#N(6148,4,,1)($)
  $A3D6 CALL #R26784
  $A3D9 #REGhl=#N(6411,4,,1)($)
  $A3DC POKE #N(23806,4,,1)($),#REGl; POKE #N(23807,4,,1)($),#REGh
  $A3DF CALL #R30813
  $A3E2 #REGa=PEEK #N(23951,4,,1)($)
  $A3E5 Clear the carry flag and set the zero flag if #REGa=0
  $A3E6 Jump to #R42003 if #REGa=0
  $A3E8 #REGb=#REGa
  $A3E9 #REGhl=#N(23418,4,,1)($)
  $A3EC Push #REGbc onto the stack
  $A3ED Push #REGhl onto the stack
  $A3EE #REGa=PEEK #REGhl
  $A3EF CALL #R24942
  $A3F2 #REGa=PEEK #N(23807,4,,1)($)
  $A3F5 #REGa=#REGa+#N(3,2,,1)($)
  $A3F7 POKE #N(23807,4,,1)($),#REGa
  $A3FA Set the zero flag if #REGa=#N(31,2,,1)($), or the carry flag if #REGa<#N(31,2,,1)($)
  $A3FC Jump to #R41995 if #REGa<>#N(31,2,,1)($)
  $A3FE #REGa=#REGa-#N(6,2,,1)($)
  $A400 POKE #N(23807,4,,1)($),#REGa
  $A403 #REGa=PEEK #N(23806,4,,1)($)
  $A406 #REGa=#REGa+#N(2,2,,1)($)
  $A408 POKE #N(23806,4,,1)($),#REGa
  $A40B Pop last item from stack into #REGhl
  $A40C Pop last item from stack into #REGbc
  $A40D #REGde=#N(3,4,,1)($)
  $A410 #REGhl=#REGhl+#REGde
  $A411 Decrement #REGb and jump to #R41964 if #REGb>0
  $A413 CALL #R24874
  $A416 CALL #R26501
  $A419 CALL #R25027
  $A41C #REGa=PEEK #N(23850,4,,1)($)
  $A41F Set the zero flag if bit 0 of #REGa is 0
  $A421 Jump to #R42009 if bit 0 of #REGa is set
  $A423 CALL #R26636
  $A426 #REGe=PEEK #N(23844,4,,1)($); #REGd=PEEK #N(23845,4,,1)($)
  $A42A CALL #R24850
  $A42D POKE #N(23855,4,,1)($),#REGl; POKE #N(23856,4,,1)($),#REGh
  $A430 #REGc=PEEK #REGhl
  $A431 #REGb=#N(6,2,,1)($)
  $A433 #REGhl=#N(46686,4,,1)($)
  $A436 Push #REGhl onto the stack
  $A437 #REGa=#REGc
  $A438 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $A439 Jump to #R42050 if #REGa<>PEEK #REGhl
  $A43B #REGhl=#REGhl+1
  $A43C #REGa=PEEK #N(46866,4,,1)($)
  $A43F Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $A440 Jump to #R42059 if #REGa=PEEK #REGhl
  $A442 Pop last item from stack into #REGhl
  $A443 #REGde=#N(3,4,,1)($)
  $A446 #REGhl=#REGhl+#REGde
  $A447 Decrement #REGb and jump to #R42038 if #REGb>0
  $A449 Jump to #R42009
c $A44B
  $A44B #REGhl=#REGhl+1
  $A44C #REGa=PEEK #REGhl
  $A44D POKE (#REGix+#N(22,2,,1)($)),#REGa
  $A450 POKE (#REGix+#N(28,2,,1)($)),255
  $A454 Pop last item from stack into #REGhl
  $A455 #REGl=PEEK #N(23855,4,,1)($); #REGh=PEEK #N(23856,4,,1)($)
  $A458 #REGa=PEEK #N(23846,4,,1)($)
  $A45B POKE #REGhl,#REGa
  $A45C CALL #R24874
  $A45F #REGa=#N(6,2,,1)($)
  $A461 CALL #R46526
  $A464 #REGa=PEEK #N(23846,4,,1)($)
  $A467 #REGa=#REGa+1
  $A468 POKE #N(23846,4,,1)($),#REGa
  $A46B Set the zero flag if #REGa=#N(160,2,,1)($), or the carry flag if #REGa<#N(160,2,,1)($)
  $A46D Jump to #R41865 if #REGa<>#N(160,2,,1)($)
  $A470 #REGa=0
  $A471 POKE #N(41839,4,,1)($),#REGa
  $A474 #REGhl=#N(54975,4,,1)($)
  $A477 #REGc=PEEK #REGhl
  $A478 #REGiy=#N(46686,4,,1)($)
  $A47C #REGde=#N(3,4,,1)($)
  $A47F #REGb=#N(6,2,,1)($)
  $A481 #REGa=#REGc
  $A482 Set the zero flag if #REGa=PEEK (#REGiy+#N(0,2,,1)($)), or the carry flag if #REGa<PEEK (#REGiy+#N(0,2,,1)($))
  $A485 Jump to #R42127 if #REGa<>PEEK (#REGiy+#N(0,2,,1)($))
  $A487 #REGa=PEEK #N(46866,4,,1)($)
  $A48A Set the zero flag if #REGa=PEEK (#REGiy+#N(1,2,,1)($)), or the carry flag if #REGa<PEEK (#REGiy+#N(1,2,,1)($))
  $A48D Jump to #R42133 if #REGa=PEEK (#REGiy+#N(1,2,,1)($))
  $A48F #REGiy=#REGiy+#REGde
  $A491 Decrement #REGb and jump to #R42113 if #REGb>0
  $A493 Jump to #R42137
c $A495
  $A495 #REGa=PEEK (#REGiy+#N(2,2,,1)($))
  $A498 POKE #REGhl,#REGa
  $A499 #REGhl=#REGhl+1
  $A49A #REGde=#N(58975,4,,1)($)
  $A49D Clear the carry flag and set the zero flag if #REGa=0
  $A49E #REGhl=#REGhl-carry-#REGde
  $A4A0 Return if #REGhl=0
  $A4A1 #REGhl=#REGhl+#REGde
  $A4A2 Jump to #R42103
c $A4A4
  $A4A4 #REGa=0
  $A4A5 CALL #R42298
  $A4A8 Jump to #R42162 if the zero flag is set
  $A4AA #REGa=PEEK #N(46684,4,,1)($)
  $A4AD #REGhl=#N(46864,4,,1)($)
  $A4B0 #REGa=#REGa+PEEK #REGhl
  $A4B1 POKE #REGhl,#REGa
  $A4B2 #REGa=#N(1,2,,1)($)
  $A4B4 CALL #R42298
  $A4B7 Jump to #R42177 if the zero flag is set
  $A4B9 #REGa=PEEK #N(46685,4,,1)($)
  $A4BC #REGhl=#N(46863,4,,1)($)
  $A4BF #REGa=#REGa+PEEK #REGhl
  $A4C0 POKE #REGhl,#REGa
  $A4C1 #REGa=PEEK #N(46863,4,,1)($)
  $A4C4 Set the zero flag if #REGa=#N(100,2,,1)($), or the carry flag if #REGa<#N(100,2,,1)($)
  $A4C6 Jump to #R42201 if #REGa>=#N(100,2,,1)($)
  $A4C8 #REGa=PEEK #N(46864,4,,1)($)
  $A4CB Set the zero flag if #REGa=#N(100,2,,1)($), or the carry flag if #REGa<#N(100,2,,1)($)
  $A4CD Jump to #R42201 if #REGa>=#N(100,2,,1)($)
  $A4CF #REGa=PEEK #N(46865,4,,1)($)
  $A4D2 #REGhl=#N(46849,4,,1)($)
  $A4D5 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $A4D6 Jump to #R42201 if #REGa=PEEK #REGhl
  $A4D8 Return
c $A4D9
  $A4D9 CALL #R24620
  $A4DC #REGa=PEEK #N(46863,4,,1)($)
  $A4DF Set the zero flag if #REGa=#N(100,2,,1)($), or the carry flag if #REGa<#N(100,2,,1)($)
  $A4E1 Jump to #R42218 if #REGa<#N(100,2,,1)($)
  $A4E3 #REGa=#N(160,2,,1)($)
  $A4E5 POKE #N(23810,4,,1)($),#REGa
  $A4E8 Jump to #R42239
c $A4EA
  $A4EA #REGa=PEEK #N(46864,4,,1)($)
  $A4ED Set the zero flag if #REGa=#N(100,2,,1)($), or the carry flag if #REGa<#N(100,2,,1)($)
  $A4EF Jump to #R42232 if #REGa<#N(100,2,,1)($)
  $A4F1 #REGa=#N(161,2,,1)($)
  $A4F3 POKE #N(23810,4,,1)($),#REGa
  $A4F6 Jump to #R42239
c $A4F8
  $A4F8 #REGa=#N(100,2,,1)($)
  $A4FA CALL #R26462
  $A4FD Jump to #R42253
c $A4FF
  $A4FF #REGa=#N(98,2,,1)($)
  $A501 CALL #R26462
  $A504 #REGa=PEEK #N(23810,4,,1)($)
  $A507 #REGhl=#N(1289,4,,1)($)
  $A50A CALL #R27514
  $A50D #REGa=PEEK #N(46863,4,,1)($)
  $A510 Set the zero flag if #REGa=#N(100,2,,1)($), or the carry flag if #REGa<#N(100,2,,1)($)
  $A512 Jump to #R42265 if #REGa<#N(100,2,,1)($)
  $A514 #REGa=#N(100,2,,1)($)
  $A516 POKE #N(46863,4,,1)($),#REGa
  $A519 #REGa=PEEK #N(46864,4,,1)($)
  $A51C Set the zero flag if #REGa=#N(100,2,,1)($), or the carry flag if #REGa<#N(100,2,,1)($)
  $A51E Jump to #R42277 if #REGa<#N(100,2,,1)($)
  $A520 #REGa=#N(100,2,,1)($)
  $A522 POKE #N(46864,4,,1)($),#REGa
  $A525 #REGa=#N(99,2,,1)($)
  $A527 CALL #R26476
  $A52A CALL #R24574
  $A52D #REGa=0
  $A52E POKE #N(24055,4,,1)($),#REGa
  $A531 CALL #R27245
  $A534 CALL #R30711
  $A537 Jump to #R45507
c $A53A
  $A53A #REGhl=#N(23632,4,,1)($)
  $A53D #REGde=#N(4,4,,1)($)
  $A540 #REGb=#N(20,2,,1)($)
  $A542 Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $A543 Return if #REGa=PEEK #REGhl
  $A544 #REGhl=#REGhl+#REGde
  $A545 Decrement #REGb and jump to #R42306 if #REGb>0
  $A547 #REGa=#N(1,2,,1)($)
  $A549 Clear the carry flag and set the zero flag if #REGa=0
  $A54A Return
s $A54B
c $A550
  $A550 #REGa=PEEK #N(42315,4,,1)($)
  $A553 #REGhl=#N(42317,4,,1)($)
  $A556 #REGa=#REGa-PEEK #REGhl
  $A557 Jump to #R42332 if #REGa<#N(128,2,,1)($)
  $A55A #REGa=#N(256,2,,1)($)-#REGa
  $A55C POKE #N(42319,4,,1)($),#REGa
  $A55F #REGa=PEEK #N(42316,4,,1)($)
  $A562 #REGhl=#N(42318,4,,1)($)
  $A565 #REGa=#REGa-PEEK #REGhl
  $A566 Jump to #R42347 if #REGa<#N(128,2,,1)($)
  $A569 #REGa=#N(256,2,,1)($)-#REGa
  $A56B #REGhl=#N(42319,4,,1)($)
  $A56E Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $A56F Jump to #R42357 if #REGa<PEEK #REGhl
  $A571 Shift #REGa left (copying bit 7 into the carry flag, and resetting bit 0)
  $A573 #REGa=#REGa+PEEK #REGhl
  $A574 Return
c $A575
  $A575 #REGa=#REGa+PEEK #REGhl
  $A576 #REGa=#REGa+PEEK #REGhl
  $A577 Return
s $A578
c $A57A
  $A57A #REGa=PEEK #N(24061,4,,1)($)
  $A57D #REGb=#REGa
  $A57E Push #REGbc onto the stack
  $A57F #REGa=PEEK #N(24061,4,,1)($)
  $A582 #REGb=#REGa
  $A583 #REGl=PEEK #N(42360,4,,1)($); #REGh=PEEK #N(42361,4,,1)($)
  $A586 #REGd=#N(0,2,,1)($)
  $A588 #REGe=#REGb
  $A589 #REGhl=#REGhl+#REGde
  $A58A #REGhl=#REGhl+#REGde
  $A58B #REGhl=#REGhl+#REGde
  $A58C #REGhl=#REGhl+1
  $A58D #REGhl=#REGhl+1
  $A58E POKE #N(24059,4,,1)($),#REGl; POKE #N(24060,4,,1)($),#REGh
  $A591 Push #REGbc onto the stack
  $A592 #REGl=PEEK #N(24059,4,,1)($); #REGh=PEEK #N(24060,4,,1)($)
  $A595 #REGde=#N(3,4,,1)($)
  $A598 #REGa=0
  $A599 #REGa=PEEK #REGhl
  $A59A #REGhl=#REGhl-carry-#REGde
  $A59C Set the zero flag if #REGa=PEEK #REGhl, or the carry flag if #REGa<PEEK #REGhl
  $A59D Jump to #R42423 if #REGa>=PEEK #REGhl
  $A59F #REGb=#N(3,2,,1)($)
  $A5A1 #REGl=PEEK #N(24059,4,,1)($); #REGh=PEEK #N(24060,4,,1)($)
  $A5A4 #REGde=#N(3,4,,1)($)
  $A5A7 #REGa=0
  $A5A8 #REGa=PEEK #REGhl
  $A5A9 #REGhl=#REGhl-carry-#REGde
  $A5AB #REGc=PEEK #REGhl
  $A5AC POKE #REGhl,#REGa
  $A5AD #REGhl=#REGhl+#REGde
  $A5AE POKE #REGhl,#REGc
  $A5AF #REGhl=#REGhl-1
  $A5B0 POKE #N(24059,4,,1)($),#REGl; POKE #N(24060,4,,1)($),#REGh
  $A5B3 Decrement #REGb and jump to #R42401 if #REGb>0
  $A5B5 Jump to #R42435
c $A5B7
  $A5B7 #REGl=PEEK #N(24059,4,,1)($); #REGh=PEEK #N(24060,4,,1)($)
  $A5BA #REGde=#N(3,4,,1)($)
  $A5BD #REGa=0
  $A5BE #REGhl=#REGhl-carry-#REGde
  $A5C0 POKE #N(24059,4,,1)($),#REGl; POKE #N(24060,4,,1)($),#REGh
  $A5C3 Pop last item from stack into #REGbc
  $A5C4 Decrement #REGb and jump to #R42385 if #REGb>0
  $A5C6 Pop last item from stack into #REGbc
  $A5C7 Decrement #REGb and jump to #R42366 if #REGb>0
  $A5C9 Return
b $A5CA
c $A5D1
  $A5D1 CALL #R56
  $A5D2 Do nothing
  $A5D3 CALL #R56
  $A5D4 CALL #R56
  $A5D5 CALL #R56
  $A5D6 CALL #R56
  $A5D7 Do nothing
  $A5D8 CALL #R56
  $A5D9 #REGbc=#N(0,4,,1)($)
  $A5DC Do nothing
  $A5DD Do nothing
  $A5DE Do nothing
  $A5DF Do nothing
  $A5E0 #REGl=PEEK #N(42458,4,,1)($); #REGh=PEEK #N(42459,4,,1)($)
  $A5E3 POKE #N(42315,4,,1)($),#REGl; POKE #N(42316,4,,1)($),#REGh
  $A5E6 #REGhl=#N(23296,4,,1)($)
  $A5E9 POKE #N(24059,4,,1)($),#REGl; POKE #N(24060,4,,1)($),#REGh
  $A5EC #REGhl=#N(42442,4,,1)($)
  $A5EF POKE #N(42462,4,,1)($),#REGl; POKE #N(42463,4,,1)($),#REGh
  $A5F2 #REGb=#N(8,2,,1)($)
  $A5F4 Push #REGbc onto the stack
  $A5F5 #REGl=PEEK #N(42462,4,,1)($); #REGh=PEEK #N(42463,4,,1)($)
  $A5F8 #REGa=PEEK #N(42460,4,,1)($)
  $A5FB #REGa=#REGa+PEEK #REGhl
  $A5FC Set the zero flag if #REGa=#N(50,2,,1)($), or the carry flag if #REGa<#N(50,2,,1)($)
  $A5FE Jump to #R42541 if #REGa>=#N(50,2,,1)($)
  $A600 POKE #N(42317,4,,1)($),#REGa
  $A603 #REGhl=#REGhl+1
  $A604 #REGa=PEEK #N(42461,4,,1)($)
  $A607 #REGa=#REGa+PEEK #REGhl
  $A608 Set the zero flag if #REGa=#N(80,2,,1)($), or the carry flag if #REGa<#N(80,2,,1)($)
  $A60A Jump to #R42541 if #REGa>=#N(80,2,,1)($)
  $A60C POKE #N(42318,4,,1)($),#REGa
  $A60F #REGhl=#REGhl+1
  $A610 POKE #N(42462,4,,1)($),#REGl; POKE #N(42463,4,,1)($),#REGh
  $A613 #REGl=PEEK #N(24059,4,,1)($); #REGh=PEEK #N(24060,4,,1)($)
  $A616 #REGe=PEEK #N(42317,4,,1)($); #REGd=PEEK #N(42318,4,,1)($)
  $A61A POKE #REGhl,#REGe
  $A61B #REGhl=#REGhl+1
  $A61C POKE #REGhl,#REGd
  $A61D #REGhl=#REGhl+1
  $A61E Push #REGhl onto the stack
  $A61F CALL #R42320
  $A622 Pop last item from stack into #REGhl
  $A623 POKE #REGhl,#REGa
  $A624 #REGhl=#REGhl+1
  $A625 POKE #N(24059,4,,1)($),#REGl; POKE #N(24060,4,,1)($),#REGh
  $A628 Pop last item from stack into #REGbc
  $A629 Decrement #REGb and jump to #R42484 if #REGb>0
  $A62B Jump to #R42559
c $A62D
  $A62D #REGl=PEEK #N(24059,4,,1)($); #REGh=PEEK #N(24060,4,,1)($)
  $A630 POKE #REGhl,#N(255,2,,1)($)
  $A632 #REGhl=#REGhl+1
  $A633 POKE #REGhl,#N(255,2,,1)($)
  $A635 #REGhl=#REGhl+1
  $A636 POKE #REGhl,#N(255,2,,1)($)
  $A638 #REGhl=#REGhl+1
  $A639 POKE #N(24059,4,,1)($),#REGl; POKE #N(24060,4,,1)($),#REGh
  $A63C Pop last item from stack into #REGbc
  $A63D Decrement #REGb and jump to #R42484 if #REGb>0
  $A63F #REGa=#N(7,2,,1)($)
  $A641 POKE #N(24061,4,,1)($),#REGa
  $A644 #REGhl=#N(23296,4,,1)($)
  $A647 POKE #N(42360,4,,1)($),#REGl; POKE #N(42361,4,,1)($),#REGh
  $A64A CALL #R42362
  $A64D Return
b $A64E
t $A653
b $A669
t $A66D
b $A683
t $A6A4
b $A6A7
t $A6B0
b $A6BF
c $A6C3
  $A6C3 Set the zero flag if #REGa=0, and reset the carry flag
  $A6C5 Do nothing
  $A6C6 Push #REGaf onto the stack
  $A6C7 #REGb=#REGb+1
  $A6C8 Jump to #R42706
c $A6CA
  $A6CA #REGa=#N($FF,2,,1)($)-#REGa
  $A6CB Exchange #REGaf and #REGaf'
  $A6CC Push #REGaf onto the stack
  $A6CD #REGhl=#REGhl+#REGbc
  $A6CE Jump to #R42712
b $A6D0
c $A6DA
  $A6DA Exchange #REGaf and #REGaf'
  $A6DB #REGa=#N($FF,2,,1)($)-#REGa
  $A6DC Exchange #REGaf and #REGaf'
  $A6DD #REGa=#REGh
  $A6DE Disable interrupts
  $A6DF Set bits 1, 2 and 6 of #REGa
  $A6E1 Push #REGaf onto the stack
  $A6E2 Do nothing
  $A6E3 #REGa=PEEK #REGde
  $A6E4 #REGbc=#N(1013,4,,1)($)
  $A6E7 Jump to #R42719
c $A6E9
  $A6E9 #REGb=#REGh
  $A6EA POKE #REGbc,#REGa
  $A6EB Rotate #REGa left circular (copying bit 7 into bit 0 and into the carry flag)
  $A6EC Push #REGaf onto the stack
  $A6ED Exchange #REGaf and #REGaf'
  $A6EE Jump to #R42739
c $A6F0
  $A6F0 Rotate #REGa left circular (copying bit 7 into bit 0 and into the carry flag)
  $A6F1 Push #REGaf onto the stack
  $A6F2 #REGc=#REGc-1
  $A6F3 Jump to #R42745
c $A6F5
  $A6F5 Rotate #REGa left circular (copying bit 7 into bit 0 and into the carry flag)
  $A6F6 Push #REGaf onto the stack
  $A6F7 POKE #REGde,#REGa
  $A6F8 Jump to #R42749
c $A6FA
  $A6FA #REGa=#N($FF,2,,1)($)-#REGa
  $A6FB CALL #R62213 if the sign flag is not set (positive)
  $A6FE #REGb=#N(7,2,,1)($)
  $A700 #REGa=#REGh
  $A701 Push #REGaf onto the stack
  $A702 Do nothing
  $A703 Jump to #R42747
s $A705
c $A707
  $A707 Exchange #REGaf and #REGaf'
  $A708 #REGa=#N($FF,2,,1)($)-#REGa
  $A709 Exchange #REGaf and #REGaf'
  $A70A #REGa=#N($FF,2,,1)($)-#REGa
  $A70B Exchange #REGaf and #REGaf'
  $A70C #REGa=#N($FF,2,,1)($)-#REGa
  $A70D Exchange #REGaf and #REGaf'
  $A70E #REGa=#N($FF,2,,1)($)-#REGa
  $A70F Exchange #REGaf and #REGaf'
  $A710 #REGa=#N($FF,2,,1)($)-#REGa
  $A711 Exchange #REGaf and #REGaf'
  $A712 #REGa=#N($FF,2,,1)($)-#REGa
  $A713 Exchange #REGaf and #REGaf'
  $A714 #REGa=#N($FF,2,,1)($)-#REGa
  $A715 Exchange #REGaf and #REGaf'
  $A716 #REGa=#N($FF,2,,1)($)-#REGa
  $A717 Exchange #REGaf and #REGaf'
  $A718 #REGa=#N($FF,2,,1)($)-#REGa
  $A719 Exchange #REGaf and #REGaf'
  $A71A #REGa=#N($FF,2,,1)($)-#REGa
  $A71B Exchange #REGaf and #REGaf'
  $A71C #REGa=#N($FF,2,,1)($)-#REGa
  $A71D Exchange #REGaf and #REGaf'
  $A71E #REGa=#REGh
  $A71F Push #REGaf onto the stack
  $A720 Do nothing
  $A721 #REGa=PEEK #REGde
  $A722 Set bits 2 and 6 of #REGa
  $A724 #REGbc=#N(757,4,,1)($)
  $A727 Jump to #R42783
b $A729
c $A734
  $A734 Enable interrupts
  $A735 #REGa=#N(124,2,,1)($)
  $A737 #REGhl=#REGhl+#REGbc
  $A738 #REGa=#N($FF,2,,1)($)-#REGa
  $A739 #REGa=#REGh
  $A73A Set bits 0, 2 and 6 of #REGa
  $A73C #REGb=#REGl
  $A73D #REGbc=#REGbc-1
  $A73E #REGa=#N($FF,2,,1)($)-#REGa
  $A73F #REGa=#REGh
  $A740 Set bits 2 and 6 of #REGa
  $A742 #REGb=#REGh
  $A743 Disable interrupts
  $A744 #REGc=#REGc+1
  $A745 #REGb=#REGb+1
  $A746 #REGa=#N($FF,2,,1)($)-#REGa
  $A747 Set bits 0, 1 and 6 of #REGa
  $A749 #REGb=#REGe
  $A74A #REGc=#REGc-1
  $A74B #REGa=#N($FF,2,,1)($)-#REGa
  $A74C Set bits 1 and 6 of #REGa
  $A74E #REGb=#REGd
  $A74F #REGc=#N(32,2,,1)($)
  $A751 Rotate #REGa right circular (copying bit 0 into bit 7 and into the carry flag)
  $A752 #REGa=#N($FF,2,,1)($)-#REGa
  $A753 Set bits 0, 1, 2 and 6 of #REGa
  $A755 #REGb=#REGa
  $A756 Decrement #REGb and jump to #R42964 if #REGb>0
  $A758 Set bits 2 and 6 of #REGa
  $A75A #REGb=#REGh
  $A75B Push #REGaf onto the stack
  $A75C #REGb=#REGb+1
  $A75D Jump to #R42864
c $A75F
  $A75F Push #REGaf onto the stack
  $A760 #REGhl=#REGhl+#REGbc
  $A761 Jump to #R42838
b $A763
c $A76B
  $A76B #REGd=#REGd+1
  $A76C Rotate #REGa left circular (copying bit 7 into bit 0 and into the carry flag)
  $A76D #REGa=#N($FF,2,,1)($)-#REGa
  $A76E #REGd=#REGd-1
  $A76F Rotate #REGa left circular (copying bit 7 into bit 0 and into the carry flag)
  $A770 #REGa=#N($FF,2,,1)($)-#REGa
  $A771 #REGbc=#REGbc+1
  $A772 Rotate #REGa left circular (copying bit 7 into bit 0 and into the carry flag)
  $A773 Push #REGaf onto the stack
  $A774 POKE #REGde,#REGa
  $A775 Jump to #R42893
b $A777
t $A778
b $A77B
t $A784
b $A787
t $A788
b $A78E
t $A791
b $A79D
t $A79E
b $A7A1
c $A7C2
  $A7C2 #REGa=#REGh
  $A7C3 Push #REGaf onto the stack
  $A7C4 #REGb=#N(28,2,,1)($)
  $A7C6 #REGl=PEEK #REGhl
  $A7C7 #REGa=#REGh
  $A7C8 Push #REGaf onto the stack
  $A7C9 #REGb=#REGb-1
  $A7CA #REGe=#REGe+1
  $A7CB #REGl=#REGa
  $A7CC #REGa=#REGh
  $A7CD Jump to #R43006
c $A7CF
  $A7CF #REGhl=#REGhl+#REGde
  $A7D0 #REGa=#N($FF,2,,1)($)-#REGa
  $A7D1 #REGa=PEEK #REGde
  $A7D2 #REGa=#N($FF,2,,1)($)-#REGa
  $A7D3 #REGde=#REGde-1
  $A7D4 #REGa=#REGh
  $A7D5 Exchange #REGaf and #REGaf'
  $A7D6 #REGa=#N($FF,2,,1)($)-#REGa
  $A7D7 Exchange #REGaf and #REGaf'
  $A7D8 #REGa=#REGh
  $A7D9 Push #REGaf onto the stack
  $A7DA #REGd=#N(24,2,,1)($)
  $A7DC Exchange #REGaf and #REGaf'
  $A7DD #REGa=#N($FF,2,,1)($)-#REGa
  $A7DE Exchange #REGaf and #REGaf'
  $A7DF #REGa=#REGh
  $A7E0 Set bits 1, 4, 5 and 6 of #REGa
  $A7E2 POKE #REGhl,#REGd
  $A7E3 Push #REGaf onto the stack
  $A7E4 #REGd=#N(26,2,,1)($)
  $A7E6 #REGhl=#REGhl+#REGhl
  $A7E7 #REGa=#REGh
  $A7E8 Push #REGaf onto the stack
  $A7E9 Do nothing
  $A7EA #REGbc=#REGbc+1
  $A7EB Disable interrupts
  $A7EC #REGe=#REGe+1
  $A7ED #REGe=#N(31,2,,1)($)
  $A7EF Jump to #R43029 if the zero flag is not set
  $A7F1 #REGe=#REGe-1
  $A7F2 #REGa=#REGh
  $A7F3 Push #REGaf onto the stack
  $A7F4 Do nothing
  $A7F5 Jump to #R43032
c $A7F7
  $A7F7 #REGa=#N($FF,2,,1)($)-#REGa
  $A7F8 POKE #N(63100,4,,1)($),#REGl; POKE #N(63101,4,,1)($),#REGh
  $A7FB #REGb=#REGl
  $A7FC Push #REGaf onto the stack
  $A7FD #REGd=#REGd-1
  $A7FE Jump to #R43043
c $A800
  $A800 #REGa=#N($FF,2,,1)($)-#REGa
  $A801 #REGh=#REGh+1
  $A802 #REGh=#REGh-1
  $A803 #REGa=#N($FF,2,,1)($)-#REGa
  $A804 #REGh=#N(124,2,,1)($)
  $A806 Push #REGaf onto the stack
  $A807 Do nothing
  $A808 Jump to #R43032
c $A80A
  $A80A Decimal adjust #REGa
  $A80B #REGa=#N($FF,2,,1)($)-#REGa
  $A80C #REGe=#N(42,2,,1)($)
  $A80E #REGa=#N($FF,2,,1)($)-#REGa
  $A80F Rotate #REGa right through the carry flag
  $A810 #REGa=#N($FF,2,,1)($)-#REGa
  $A811 #REGh=#REGh+1
  $A812 #REGa=#REGh
  $A813 Set bits 1 and 6 of #REGa
  $A815 #REGb=#REGd
  $A816 #REGc=#N(32,2,,1)($)
  $A818 Jump to #R43081 if the zero flag is set
  $A81A #REGa=#REGh
  $A81B Set bits 1, 2 and 6 of #REGa
  $A81D #REGb=PEEK #REGhl
  $A81E #REGh=#REGh+1
  $A81F #REGa=#N($FF,2,,1)($)-#REGa
  $A820 #REGa=#REGh
  $A821 Set bits 0, 2 and 6 of #REGa
  $A823 #REGb=#REGl
  $A824 #REGhl=#REGhl-1
  $A825 #REGa=#N($FF,2,,1)($)-#REGa
  $A826 #REGa=#REGh
  $A827 Set bits 0, 2 and 6 of #REGa
  $A829 #REGb=#REGl
  $A82A #REGl=#REGl+1
  $A82B Jump to #R43098 if #REGl>0
  $A82D #REGa=#N($FF,2,,1)($)-#REGa
  $A82E #REGa=#REGh
  $A82F Set bits 0, 2 and 6 of #REGa
  $A831 #REGb=#REGl
  $A832 #REGl=#N(47,2,,1)($)
  $A834 #REGa=#REGh
  $A835 Set bits 1, 2 and 6 of #REGa
  $A837 #REGb=PEEK #REGhl
  $A838 Jump to #R43113 if the carry flag is not set
  $A83A #REGa=#REGh
  $A83B Set bits 1, 2 and 6 of #REGa
  $A83D #REGb=PEEK #REGhl
  $A83E #REGsp=#N(31791,4,,1)($)
  $A841 Set bits 2 and 6 of #REGa
  $A843 #REGb=#REGh
  $A844 POKE #N(31791,4,,1)($),#REGa
  $A847 Set bits 2 and 6 of #REGa
  $A849 #REGb=#REGh
  $A84A #REGsp=#REGsp+1
  $A84B #REGa=#N($FF,2,,1)($)-#REGa
  $A84C #REGa=#REGh
  $A84D Set bits 2 and 6 of #REGa
  $A84F #REGb=#REGh
  $A850 POKE #REGhl,(PEEK #REGhl)+1
  $A851 #REGa=#N($FF,2,,1)($)-#REGa
  $A852 #REGa=#REGh
  $A853 Set bits 2 and 6 of #REGa
  $A855 #REGb=#REGh
  $A856 POKE #REGhl,(PEEK #REGhl)-1
  $A857 #REGsp=#REGsp+1
  $A858 #REGa=#N($FF,2,,1)($)-#REGa
  $A859 #REGa=#REGh
  $A85A Set bits 0, 1 and 6 of #REGa
  $A85C #REGb=#REGe
  $A85D #REGc=#REGc-1
  $A85E #REGa=#N($FF,2,,1)($)-#REGa
  $A85F #REGa=#REGh
  $A860 Set bits 0, 1, 2 and 6 of #REGa
  $A862 #REGb=#REGa
  $A863 Decrement #REGb and jump to #R43156 if #REGb>0
  $A865 #REGa=#REGh
  $A866 Push #REGaf onto the stack
  $A867 Do nothing
  $A868 #REGbc=#REGbc+1
  $A869 Set bits 0, 2 and 6 of #REGa
  $A86B #REGhl=#REGhl-1
  $A86C #REGbc=#REGbc+1
  $A86D #REGb=#REGb-1
  $A86E #REGb=#N(47,2,,1)($)
  $A870 Set bits 2 and 6 of #REGa
  $A872 #REGbc=#REGbc+1
  $A873 POKE #REGhl,#N(245,2,,1)($)
  $A875 #REGbc=#N(14101,4,,1)($)
  $A878 Jump to #R43187 if the carry flag is set
  $A87A Push #REGaf onto the stack
  $A87B POKE #REGbc,#REGa
  $A87C #REGbc=#REGbc+1
  $A87D Jump to #R18166 if the sign flag is set (negative)
  $A880 #REGb=PEEK #REGhl
  $A881 #REGa=PEEK #N(1283,4,,1)($)
  $A884 #REGb=#N(124,2,,1)($)
  $A886 Push #REGaf onto the stack
  $A887 Do nothing
  $A888 #REGbc=#REGbc+1
  $A889 Set bits 0, 2 and 6 of #REGa
  $A88B #REGl=#REGl+1
  $A88C #REGl=#REGl-1
  $A88D #REGbc=#REGbc+1
  $A88E #REGa=#N($FF,2,,1)($)-#REGa
  $A88F Set bits 2 and 6 of #REGa
  $A891 #REGbc=#REGbc+1
  $A892 POKE #REGhl,#N(245,2,,1)($)
  $A894 #REGbc=#N(14101,4,,1)($)
  $A897 Jump to #R43218 if the carry flag is set
  $A899 Push #REGaf onto the stack
  $A89A POKE #REGbc,#REGa
  $A89B #REGbc=#REGbc+1
  $A89C Jump to #R17398 if the sign flag is set (negative)
  $A89F #REGb=#REGd
  $A8A0 Decrement #REGb and jump to #R43294 if #REGb>0
  $A8A2 #REGbc=#REGbc+1
  $A8A3 #REGa=#N($FF,2,,1)($)-#REGa
  $A8A4 #REGsp=#REGsp-1
  $A8A5 #REGa=#REGa+1
  $A8A6 #REGa=#N($FF,2,,1)($)-#REGa
  $A8A7 #REGa=#REGa-1
  $A8A8 #REGa=#N($FF,2,,1)($)-#REGa
  $A8A9 #REGh=#REGh-1
  $A8AA #REGl=#REGl+1
  $A8AB #REGa=#N($FF,2,,1)($)-#REGa
  $A8AC #REGl=#REGl-1
  $A8AD #REGa=#REGh
  $A8AE #REGbc=#REGbc+1
  $A8AF #REGa=#N($FF,2,,1)($)-#REGa
  $A8B0 #REGsp=#REGsp-1
  $A8B1 #REGa=#REGa+1
  $A8B2 #REGa=#N($FF,2,,1)($)-#REGa
  $A8B3 #REGa=#N(37,2,,1)($)
  $A8B5 #REGa=#N($FF,2,,1)($)-#REGa
  $A8B6 #REGl=#REGl+1
  $A8B7 #REGl=#REGl-1
  $A8B8 #REGa=#REGh
  $A8B9 Jump to #R43242
b $A8BB
t $A8C0
b $A8C6
c $A8E0
  $A8E0 #REGa=#REGh
  $A8E1 #REGb=#REGd
  $A8E2 #REGa=#REGh
  $A8E3 #REGb=#REGe
  $A8E4 #REGa=#REGh
  $A8E5 #REGb=#REGh
  $A8E6 #REGa=#REGh
  $A8E7 #REGb=#REGl
  $A8E8 #REGa=#REGh
  $A8E9 #REGb=PEEK #REGhl
  $A8EA #REGa=#REGh
  $A8EB Push #REGaf onto the stack
  $A8EC Do nothing
  $A8ED Jump to #R43237
c $A8EF
  $A8EF #REGb=#REGh
  $A8F0 Disable interrupts
  $A8F1 #REGc=#REGl
  $A8F2 Rotate #REGa left circular (copying bit 7 into bit 0 and into the carry flag)
  $A8F3 Push #REGaf onto the stack
  $A8F4 #REGb=#N(24,2,,1)($)
  $A8F6 #REGc=PEEK #REGhl
  $A8F7 Push #REGaf onto the stack
  $A8F8 #REGa=PEEK #REGbc
  $A8F9 Jump to #R43338
c $A8FB
  $A8FB Rotate #REGa left circular (copying bit 7 into bit 0 and into the carry flag)
  $A8FC Push #REGaf onto the stack
  $A8FD #REGc=#N(24,2,,1)($)
  $A8FF #REGd=#REGb
  $A900 Rotate #REGa left circular (copying bit 7 into bit 0 and into the carry flag)
  $A901 Push #REGaf onto the stack
  $A902 #REGde=#REGde+1
  $A903 Jump to #R43350
b $A905
t $A90B
b $A90E
t $A913
b $A916
t $A91E
b $A921
t $A929
b $A92D
t $A961
b $A967
t $A974
b $A978
c $A97B
  $A97B #REGh=#REGe
  $A97C Push #REGaf onto the stack
  $A97D #REGd=#REGd+1
  $A97E #REGb=#N(18,2,,1)($)
  $A980 #REGh=#REGe
  $A981 Push #REGaf onto the stack
  $A982 #REGd=#N(5,2,,1)($)
  $A984 #REGde=#REGde+1
  $A985 #REGh=#REGe
  $A986 #REGa=#REGh
  $A987 Jump to #R12132 if the sign flag is set (negative)
  $A98A #REGa=#REGh
  $A98B Jump to #R12133 if the sign flag is set (negative)
  $A98E #REGa=#REGh
  $A98F Jump to #R12134 if the sign flag is set (negative)
  $A992 #REGa=#REGh
  $A993 Jump to #R12135 if the sign flag is set (negative)
  $A996 #REGa=#REGh
  $A997 Set bits 1 and 6 of #REGa
  $A999 #REGb=#REGd
  $A99A Disable interrupts
  $A99B #REGc=#N(32,2,,1)($)
  $A99D #REGh=#REGh+1
  $A99E #REGa=#N($FF,2,,1)($)-#REGa
  $A99F Set bits 0, 1, 2 and 6 of #REGa
  $A9A1 #REGb=#REGa
  $A9A2 Decrement #REGb and jump to #R43552 if #REGb>0
  $A9A4 Push #REGaf onto the stack
  $A9A5 #REGb=#REGb+1
  $A9A6 Jump to #R43419
b $A9A8
t $A9A9
b $A9B1
t $A9B3
b $A9CD
t $A9D3
b $A9D6
t $A9DA
c $A9DD
  $A9DD #REGb=#REGb-1
  $A9DE #REGa=#N($FF,2,,1)($)-#REGa
  $A9DF #REGc=#REGl
  $A9E0 #REGa=#REGh
  $A9E1 Push #REGaf onto the stack
  $A9E2 Do nothing
  $A9E3 Jump to #R43483
c $A9E5
  $A9E5 #REGb=#REGl
  $A9E6 #REGb=#REGb-1
  $A9E7 #REGhl=#REGhl+1
  $A9E8 #REGa=#N($FF,2,,1)($)-#REGa
  $A9E9 #REGh=#REGh+1
  $A9EA #REGh=#REGh-1
  $A9EB #REGa=#N($FF,2,,1)($)-#REGa
  $A9EC #REGhl=#REGhl+#REGbc
  $A9ED #REGa=#N($FF,2,,1)($)-#REGa
  $A9EE POKE #REGhl,#REGc
  $A9EF #REGa=#N($FF,2,,1)($)-#REGa
  $A9F0 POKE #REGhl,#REGd
  $A9F1 #REGa=#REGh
  $A9F2 Push #REGaf onto the stack
  $A9F3 Do nothing
  $A9F4 Jump to #R43500
b $A9F6
c $A9FA
  $A9FA #REGa=#N($FF,2,,1)($)-#REGa
  $A9FB POKE #REGhl,#REGb
  $A9FC #REGa=#REGh
  $A9FD Push #REGaf onto the stack
  $A9FE Do nothing
  $A9FF Jump to #R43636
b $AA01
c $AA1F
  $AA1F Push #REGaf onto the stack
  $AA20 POKE #REGbc,#REGa
  $AA21 #REGa=PEEK #REGbc
  $AA22 POKE #REGhl,#REGl
  $AA23 Push #REGaf onto the stack
  $AA24 POKE #REGbc,#REGa
  $AA25 #REGde=#N(31862,4,,1)($)
  $AA28 Disable interrupts
  $AA29 Set bits 2 and 6 of #REGa
  $AA2B #REGb=#REGh
  $AA2C Push #REGaf onto the stack
  $AA2D #REGb=#N(5,2,,1)($)
  $AA2F POKE #REGhl,#REGa
  $AA30 #REGh=#REGe
  $AA31 Push #REGaf onto the stack
  $AA32 #REGhl=#REGhl+#REGbc
  $AA33 #REGb=#REGb-1
  $AA34 Rotate #REGa right circular (copying bit 0 into bit 7 and into the carry flag)
  $AA35 #REGh=#REGe
  $AA36 Push #REGaf onto the stack
  $AA37 #REGhl=#REGhl+#REGbc
  $AA38 #REGc=#N(15,2,,1)($)
  $AA3A #REGa=#REGb
  $AA3B #REGd=#REGl
  $AA3C #REGh=#REGe
  $AA3D #REGa=#REGh
  $AA3E Push #REGaf onto the stack
  $AA3F Do nothing
  $AA40 #REGa=PEEK #REGde
  $AA41 Set bits 1 and 2 of #REGa
  $AA43 #REGb=#REGh
  $AA44 #REGa=#REGd
  $AA45 #REGa=#N($FF,2,,1)($)-#REGa
  $AA46 #REGa=#REGe
  $AA47 Set bits 0, 2 and 6 of #REGa
  $AA49 #REGb=#REGl
  $AA4A #REGa=#REGh
  $AA4B Push #REGaf onto the stack
  $AA4C Do nothing
  $AA4D Jump to #R43676
t $AA4F
b $AA52
t $AA71
b $AA75
t $AA86
b $AA8B
t $AA8F
b $AA94
t $AAA4
b $AAAF
t $AAB2
b $AAB5
t $AABB
b $AAC1
t $AAD0
b $AAD6
t $AAD7
b $AADC
t $AAE5
b $AAEB
t $AAEC
b $AAF3
c $AAF9
  $AAF9 Disable interrupts
  $AAFA POKE #REGhl,#REGa
  $AAFB #REGa=#REGb
  $AAFC #REGa=#REGa+#REGh
  $AAFD Set bit 2 of #REGa
  $AAFF #REGb=#REGh
  $AB00 #REGa=#N($FF,2,,1)($)-#REGa
  $AB01 #REGa=#REGa+carry+#REGe
  $AB02 #REGhl=#REGhl+1
  $AB03 #REGa=#REGa+carry+#REGh
  $AB04 #REGa=#REGh
  $AB05 Push #REGaf onto the stack
  $AB06 #REGa=PEEK #REGbc
  $AB07 Rotate #REGa left circular (copying bit 7 into bit 0 and into the carry flag)
  $AB08 #REGa=#REGa+carry+#REGl
  $AB09 #REGa=#REGa+carry+PEEK #REGhl
  $AB0A #REGa=#REGa+#REGh
  $AB0B #REGa=#N($FF,2,,1)($)-#REGa
  $AB0C Set bit 2 of #REGa
  $AB0E #REGb=#REGh
  $AB0F Disable interrupts
  $AB10 #REGa=#REGa+carry+#REGe
  $AB11 #REGhl=#REGhl+1
  $AB12 #REGa=#REGa+carry+#REGa
  $AB13 Push #REGaf onto the stack
  $AB14 #REGc=#REGc+1
  $AB15 #REGd=#REGd+1
  $AB16 #REGa=#REGa-#REGb
  $AB17 #REGa=#REGh
  $AB18 Push #REGaf onto the stack
  $AB19 Do nothing
  $AB1A Jump to #R43923
c $AB1C
  $AB1C #REGa=#N($FF,2,,1)($)-#REGa
  $AB1D Disable interrupts
  $AB1E Set bit 2 of #REGa
  $AB20 #REGb=#REGh
  $AB21 #REGa=#REGa-#REGc
  $AB22 #REGh=#REGe
  $AB23 Push #REGaf onto the stack
  $AB24 #REGhl=#REGhl+#REGbc
  $AB25 Jump to #R43818
c $AB27
  $AB27 #REGh=#REGe
  $AB28 Push #REGaf onto the stack
  $AB29 #REGd=#REGd-1
  $AB2A Jump to #R43813
c $AB2C
  $AB2C CALL #R17398 if the sign flag is not set (positive)
  $AB2F #REGhl=#REGhl+1
  $AB30 #REGa=#N($FF,2,,1)($)-#REGa
  $AB31 #REGh=#REGh+1
  $AB32 #REGh=#REGh-1
  $AB33 #REGa=#N($FF,2,,1)($)-#REGa
  $AB34 #REGa=#REGa-#REGc
  $AB35 #REGa=#REGh
  $AB36 Push #REGaf onto the stack
  $AB37 #REGb=#REGb-1
  $AB38 Jump to #R43724
b $AB3A
t $AB71
b $AB75
c $AB88
  $AB88 #REGa=#REGa-carry-#REGb
  $AB89 #REGa=#REGh
  $AB8A Jump to #R43921
b $AB8C
t $ABAE
b $ABB1
t $AC02
b $AC05
t $AC08
b $AC10
t $AC11
b $AC14
t $AC15
b $AC1B
t $AC1C
b $AC20
t $AC24
b $AC27
t $AC2E
b $AC36
t $AC37
b $AC3D
t $AC3E
b $AC44
t $AC45
b $AC49
t $AC4A
b $AC4E
t $AC4F
b $AC56
t $AC57
b $AC5A
t $AC5B
b $AC5F
t $AC60
b $AC66
t $AC6F
b $AC75
t $AC76
b $AC7D
t $AC7E
b $AC82
t $AC83
b $AC87
t $AC88
b $AC8F
t $AC90
b $AC94
t $AC95
b $AC98
t $AC99
b $AC9F
t $ACA0
b $ACA6
t $ACA7
b $ACAD
t $ACB8
b $ACBD
t $ACBE
b $ACC4
t $ACC7
b $ACCE
t $ACD2
b $ACD7
t $ACD8
b $ACDC
t $ACE0
b $ACE8
t $ACEC
b $ACF0
t $ACF1
b $ACF7
t $ACFA
b $AD00
t $AD01
b $AD05
t $AD09
b $AD0D
t $AD0F
b $AD13
t $AD14
b $AD19
t $AD1A
b $AD1E
t $AD1F
b $AD23
t $AD24
b $AD29
t $AD2D
b $AD31
t $AD32
b $AD35
t $AD36
b $AD39
t $AD3A
b $AD3D
t $AD44
b $AD47
t $AD48
b $AD4D
t $AD4E
b $AD51
t $AD52
b $AD5A
t $AD5B
b $AD61
t $AD62
b $AD68
t $AD69
b $AD6D
t $AD71
b $AD75
t $AD76
b $AD7B
t $AD7C
b $AD82
t $AD83
b $AD89
t $AD8A
b $AD8E
t $AD8F
b $AD95
t $AD96
b $AD99
t $AD9A
b $AD9F
t $ADA0
b $ADA6
t $ADA7
b $ADAD
t $ADAE
b $ADB6
t $ADB7
b $ADBB
t $ADBC
b $ADC2
t $ADC3
b $ADCB
t $ADCC
b $ADD3
t $ADD4
b $ADD9
t $ADDA
b $ADDF
t $ADE0
b $ADE4
t $ADE5
b $ADE9
t $ADEA
b $ADEE
t $ADEF
b $ADF3
t $ADF4
b $ADFD
t $ADFE
b $AE04
t $AE05
b $AE0B
t $AE0D
b $AE10
t $AE17
b $AE1C
t $AE1D
b $AE24
t $AE28
b $AE2D
t $AE2E
b $AE35
t $AE36
b $AE3E
t $AE3F
b $AE4B
t $AE4C
b $AE50
t $AE52
b $AE55
t $AE59
b $AE5D
t $AE5E
b $AE62
t $AE63
b $AE66
t $AE67
b $AE6C
t $AE6D
b $AE70
t $AE71
b $AE74
t $AE75
b $AE79
t $AE7B
b $AE7F
t $AE83
b $AE87
t $AE8D
b $AE91
t $AE92
b $AE96
t $AE97
b $AE9A
t $AE9B
b $AE9F
t $AEA0
b $AEA8
t $AEA9
b $AEAF
t $AEB0
b $AEB5
t $AEB6
b $AEBC
t $AEC0
b $AEC5
t $AEC6
b $AECB
t $AECC
b $AED2
t $AED6
b $AEDD
t $AEDE
b $AEE1
t $AEE2
b $AEE7
t $AEE9
b $AEEF
t $AEF0
b $AEF3
t $AEF7
b $AEFA
t $AEFB
b $AEFF
t $AF00
b $AF04
t $AF05
b $AF09
t $AF0C
b $AF11
t $AF12
b $AF23
t $AF24
b $AF2A
t $AF2B
b $AF30
t $AF31
b $AF36
t $AF37
b $AF3A
t $AF3D
b $AF45
t $AF46
b $AF4B
t $AF4C
b $AF51
t $AF52
b $AF58
t $AF5B
b $AF61
t $AF62
b $AF65
t $AF66
b $AF6A
t $AF6B
b $AF71
t $AF72
b $AF77
t $AF78
b $AF7E
t $AF7F
b $AF87
t $AF8B
b $AF90
t $AF91
b $AF97
t $AF98
b $AFA2
t $AFA3
b $AFAE
t $AFAF
b $AFB7
t $AFB8
b $AFC3
t $AFC4
b $AFDD
t $AFDE
b $AFE9
t $AFEA
b $AFEE
t $AFEF
b $AFF4
t $AFF5
b $AFFB
t $AFFC
b $AFFF
t $B000
b $B003
t $B004
b $B00E
t $B00F
b $B067
t $B068
b $B070
t $B071
c $B0A5
  $B0A5 #REGb=PEEK #REGhl
  $B0A6 #REGe=#REGc
  $B0A7 Jump to #R45296 if the zero flag is not set
  $B0A9 #REGb=#REGc
  $B0AA #REGc=#REGl
  $B0AB #REGb=#REGl
  $B0AC #REGa=#REGh
  $B0AD CALL #R24620
  $B0B0 #REGa=#N(83,2,,1)($)
  $B0B2 CALL #R26476
  $B0B5 #REGa=#N(105,2,,1)($)
  $B0B7 CALL #R26462
  $B0BA #REGa=#N(4,2,,1)($)
  $B0BC POKE #N(24054,4,,1)($),#REGa
  $B0BF CALL #R41590
  $B0C2 #REGa=#REGa-1
  $B0C3 POKE #N(45255,4,,1)($),#REGa
  $B0C6 Return
s $B0C7
c $B0C8
  $B0C8 #REGhl=#N(45280,4,,1)($)
  $B0CB #REGd=#N(0,2,,1)($)
  $B0CD #REGa=PEEK #N(45255,4,,1)($)
  $B0D0 #REGa=#REGa+#REGa
  $B0D1 #REGe=#REGa
  $B0D2 #REGhl=#REGhl+#REGde
  $B0D3 #REGe=PEEK #REGhl
  $B0D4 #REGhl=#REGhl+1
  $B0D5 #REGd=PEEK #REGhl
  $B0D6 Exchange #REGde and #REGhl
  $B0D7 #REGde=#N(45276,4,,1)($)
  $B0DA Push #REGde onto the stack
  $B0DB Jump to #REGhl
c $B0DC
  $B0DC POKE #N(23850,4,,1)($),#REGa
  $B0DF Return
c $B0E0
  $B0E0 Return if the parity/overflow flag is set (parity even)
  $B0E1 #REGa=#REGa|#REGb
  $B0E2
  $B0E4 Rotate #REGa left through the carry flag
  $B0E5 #REGa=#REGa|#REGc
  $B0E6 POKE #REGhl,#N(177,2,,1)($)
  $B0E8 #REGa=#N(239,2,,1)($)
  $B0EA Read keys 0-9-8-7-6
  $B0EC #REGe=#REGa
  $B0ED #REGa=#N(247,2,,1)($)
  $B0EF Read keys 1-2-3-4-5
  $B0F1 #REGb=#N(5,2,,1)($)
  $B0F3 Rotate #REGa right through the carry flag
  $B0F4 Rotate #REGc left through the carry flag
  $B0F6 Decrement #REGb and jump to #R45299 if #REGb>0
  $B0F8 #REGa=#REGc
  $B0F9 #REGa=#REGa&#REGe
  $B0FA Set bits 5, 6 and 7 of #REGa
  $B0FC Return
c $B0FD
  $B0FD #REGa=IN (#N(256,,,1)($)*#REGa+#N(31,2,,1)($))
  $B0FF #REGb=#N(0,2,,1)($)
  $B101 Rotate #REGa right through the carry flag
  $B102 Rotate #REGb right through the carry flag
  $B104 Rotate #REGa right through the carry flag
  $B105 Rotate #REGb left through the carry flag
  $B107 Rotate #REGb left through the carry flag
  $B109 Rotate #REGa right through the carry flag
  $B10A Rotate #REGb left through the carry flag
  $B10C Rotate #REGa right through the carry flag
  $B10D Rotate #REGb left through the carry flag
  $B10F Rotate #REGa right through the carry flag
  $B110 Rotate #REGb left through the carry flag
  $B112 #REGa=#REGb
  $B113 #REGa=#N($FF,2,,1)($)-#REGa
  $B114 Set bits 5, 6 and 7 of #REGa
  $B116 Return
c $B117
  $B117 #REGbc=#N(63486,4,,1)($)
  $B11A Read keys 1-2-3-4-5
  $B11C #REGb=#N(239,2,,1)($)
  $B11E #REGa=#REGa|#REGb
  $B11F #REGe=#REGa
  $B120 #REGa=IN #REGbc
  $B122 #REGd=#REGa
  $B123 Set bits 1, 2, 3, 4, 5, 6 and 7 of #REGa
  $B125 #REGa=#REGa&#REGe
  $B126 #REGe=#REGa
  $B127 #REGa=#REGd
  $B128 Set bits 0, 1, 2, 5, 6 and 7 of #REGa
  $B12A Rotate #REGa right circular (copying bit 0 into bit 7 and into the carry flag)
  $B12B Rotate #REGa right circular (copying bit 0 into bit 7 and into the carry flag)
  $B12C #REGa=#REGa&#REGe
  $B12D #REGe=#REGa
  $B12E #REGa=#REGd
  $B12F Set bits 0, 1, 3, 4, 5, 6 and 7 of #REGa
  $B131 Rotate #REGa left circular (copying bit 7 into bit 0 and into the carry flag)
  $B132 #REGa=#REGa&#REGe
  $B133 #REGe=#REGa
  $B134 Jump to #R45395
c $B136
  $B136 #REGbc=#N(65022,4,,1)($)
  $B139 Read keys A-S-D-F-G
  $B13B Set bits 1, 2, 3, 4, 5, 6 and 7 of #REGa
  $B13D Rotate #REGa left circular (copying bit 7 into bit 0 and into the carry flag)
  $B13E #REGe=#REGa
  $B13F #REGb=#N(251,2,,1)($)
  $B141 #REGa=IN #REGbc
  $B143 Set bits 1, 2, 3, 4, 5, 6 and 7 of #REGa
  $B145 #REGa=#REGa&#REGe
  $B146 Rotate #REGa left circular (copying bit 7 into bit 0 and into the carry flag)
  $B147 #REGe=#REGa
  $B148 #REGb=#N(223,2,,1)($)
  $B14A #REGa=IN #REGbc
  $B14C Set bits 2, 3, 4, 5, 6 and 7 of #REGa
  $B14E Rotate #REGa left circular (copying bit 7 into bit 0 and into the carry flag)
  $B14F Rotate #REGa left circular (copying bit 7 into bit 0 and into the carry flag)
  $B150 Rotate #REGa left circular (copying bit 7 into bit 0 and into the carry flag)
  $B151 #REGa=#REGa&#REGe
  $B152 #REGe=#REGa
  $B153 #REGb=#N(127,2,,1)($)
  $B155 #REGa=IN #REGbc
  $B157 Set bits 1, 2, 3, 4, 5, 6 and 7 of #REGa
  $B159 #REGa=#REGa&#REGe
  $B15A Return
s $B15B
c $B15C
  $B15C #REGh=#REGa
  $B15D POKE #N(45506,4,,1)($),#REGa
  $B160 #REGa=#N(1,2,,1)($)
  $B162 POKE #N(45403,4,,1)($),#REGa
  $B165 #REGa=#REGb
  $B166 #REGde=#N(18911,4,,1)($)
  $B169 #REGix=#N(46625,4,,1)($)
  $B16D Set the carry flag
  $B16E #REGh=#REGh-1
  $B16F Jump to #R45433 if #REGh=0
  $B171 Clear the carry flag and set the zero flag if #REGa=0
  $B172 #REGh=#REGh-1
  $B173 Jump to #R45433 if #REGh=0
  $B175 CALL #R45465
  $B178 Return
c $B179
  $B179 CALL #R45472
  $B17C Jump to #R45453 if the carry flag is set
  $B17E #REGa=#N(106,2,,1)($)
  $B180 Push #REGaf onto the stack
  $B181 #REGa=0
  $B182 CALL #R24621
  $B185 Pop last item from stack into #REGaf
  $B186 CALL #R26462
  $B189 CALL #R27400
  $B18C Return
c $B18D
  $B18D #REGa=PEEK #N(45506,4,,1)($)
  $B190 #REGa=#REGa-1
  $B191 POKE #N(45403,4,,1)($),#REGa
  $B194 Return if the zero flag is set
  $B195 #REGa=#N(107,2,,1)($)
  $B197 Jump to #R45440
c $B199
  $B199 #REGhl=#N(45486,4,,1)($)
  $B19C Push #REGhl onto the stack
  $B19D Jump to #R1222
c $B1A0
  $B1A0 #REGd=#REGd+1
  $B1A1 Exchange #REGaf and #REGaf'
  $B1A2 #REGd=#REGd-1
  $B1A3 #REGa=#N(15,2,,1)($)
  $B1A5 OUT #N(254,2,,1)($),#REGa
  $B1A7 #REGhl=#N(45486,4,,1)($)
  $B1AA Push #REGhl onto the stack
  $B1AB Jump to #R1378
c $B1AE
  $B1AE Push #REGaf onto the stack
  $B1AF #REGbc=#N(32766,4,,1)($)
  $B1B2 #REGa=0
  $B1B3 OUT #REGbc,#REGa
  $B1B5 #REGa=IN #REGbc
  $B1B7 Rotate #REGa right through the carry flag
  $B1B8 Jump to #R45504 if the carry flag is set
  $B1BA #REGa=IN #REGbc
  $B1BC Rotate #REGa right through the carry flag
  $B1BD Jump to #R45498 if the carry flag is not set
  $B1BF Pop last item from stack into #REGhl
  $B1C0 Pop last item from stack into #REGaf
  $B1C1 Return
s $B1C2
c $B1C3
  $B1C3 CALL #R24620
  $B1C6 #REGa=#N(83,2,,1)($)
  $B1C8 CALL #R26476
  $B1CB #REGa=#N(108,2,,1)($)
  $B1CD CALL #R26462
  $B1D0 #REGa=#N(5,2,,1)($)
  $B1D2 POKE #N(24054,4,,1)($),#REGa
  $B1D5 CALL #R41590
  $B1D8 Push #REGaf onto the stack
  $B1D9 #REGa=#REGa+#N(99,2,,1)($)
  $B1DB #REGb=#REGa
  $B1DC #REGa=#N(1,2,,1)($)
  $B1DE CALL #R45404
  $B1E1 Pop last item from stack into #REGbc
  $B1E2 #REGa=PEEK #N(45403,4,,1)($)
  $B1E5 Clear the carry flag and set the zero flag if #REGa=0
  $B1E6 Jump to #R45507 if #REGa>0
  $B1E8 #REGsp=#N(24121,4,,1)($)
  $B1EB #REGa=#REGb
  $B1EC Set the zero flag if #REGa=#N(4,2,,1)($), or the carry flag if #REGa<#N(4,2,,1)($)
  $B1EE Jump to #R24140 if #REGa<>#N(4,2,,1)($)
  $B1F1 CALL #R29832
  $B1F4 Jump to #R24210
c $B1F7
  $B1F7 CALL #R24620
  $B1FA #REGa=#N(83,2,,1)($)
  $B1FC CALL #R26476
  $B1FF #REGa=#N(109,2,,1)($)
  $B201 CALL #R26462
  $B204 #REGa=#N(4,2,,1)($)
  $B206 POKE #N(24054,4,,1)($),#REGa
  $B209 CALL #R41583
  $B20C Return if the zero flag is set
  $B20D Set the zero flag if #REGa=#N(2,2,,1)($), or the carry flag if #REGa<#N(2,2,,1)($)
  $B20F Jump to #R45598 if #REGa=#N(2,2,,1)($)
  $B211 Set the zero flag if #REGa=#N(3,2,,1)($), or the carry flag if #REGa<#N(3,2,,1)($)
  $B213 Jump to #R45507 if #REGa=#N(3,2,,1)($)
  $B215 Set the zero flag if #REGa=#N(4,2,,1)($), or the carry flag if #REGa<#N(4,2,,1)($)
  $B217 Jump to #R45613 if #REGa=#N(4,2,,1)($)
  $B219 CALL #R45229
  $B21C Jump to #R45559
c $B21E
  $B21E CALL #R24620
  $B221 CALL #R29143
  $B224 #REGa=#N(0,2,,1)($)
  $B226 #REGb=#N(103,2,,1)($)
  $B228 CALL #R45404
  $B22B Jump to #R45559
c $B22D
  $B22D CALL #R24620
  $B230 #REGa=#N(2,2,,1)($)
  $B232 #REGb=#N(103,2,,1)($)
  $B234 CALL #R45404
  $B237 Jump to #R45559
s $B239
c $B242
  $B242 Jump to #R45660
c $B244
  $B244 Jump to #R45638
c $B246
  $B246 Jump to #R45664
b $B248
t $B24A
b $B24D
t $B26D
b $B270
t $B283
c $B287
  $B287 #REGh=#REGb
  $B288 Do nothing
  $B289 Do nothing
  $B28A Do nothing
  $B28B #REGh=#REGh+1
  $B28C Jump to #R45836
c $B28E
  $B28E Jump to #R45748
s $B290
c $B293
  $B293 Jump to #R45741
c $B295
  $B295 #REGa=PEEK #REGhl
  $B296 Jump to #R45744
s $B298
c $B29E
  $B29E Jump to #R45752
b $B2A0
c $B2AE
  $B2AE Jump to #R45768
s $B2B0
c $B2B1
  $B2B1 #REGbc=#N(1539,4,,1)($)
  $B2B4 #REGc=#REGc+1
  $B2B5 Jump to #R45799
b $B2B7
c $B2BA
  $B2BA #REGa=#REGa+1
  $B2BB #REGb=PEEK #REGhl
  $B2BC #REGc=PEEK #REGhl
  $B2BD #REGd=PEEK #REGhl
  $B2BE #REGh=PEEK #REGhl
  $B2BF #REGa=#REGa+1
  $B2C0 Do nothing
  $B2C1 Do nothing
  $B2C2 Jump to #R45804
c $B2C4
  $B2C4 Exchange #REGaf and #REGaf'
  $B2C5 Jump to #R45791
b $B2C7
c $B2E4
  $B2E4 #REGa=#REGh
  $B2E5 #REGb=#N(70,2,,1)($)
  $B2E7 #REGa=#REGa+1
  $B2E8 Do nothing
  $B2E9 Do nothing
  $B2EA #REGa=#REGa+1
  $B2EB #REGh=#REGb
  $B2EC #REGa=#REGh
  $B2ED #REGh=PEEK #REGhl
  $B2EE #REGh=PEEK #REGhl
  $B2EF #REGa=#REGa+1
  $B2F0 Do nothing
  $B2F1 Do nothing
  $B2F2 #REGa=PEEK #REGhl
  $B2F3 #REGb=#N(4,2,,1)($)
  $B2F5 Exchange #REGaf and #REGaf'
  $B2F6 Jump to #R45840
b $B2F8
t $B2FA
b $B300
t $B302
b $B306
c $B312
  $B312 Jump to #R45868
s $B314
c $B316
  $B316 Jump to #R45872
b $B318
c $B335
  $B335 Jump to #R45879
c $B337
  $B337 Jump to #R45881
b $B339
t $B33A
b $B33D
t $B342
b $B345
t $B35B
b $B35F
t $B375
b $B378
t $B37D
b $B380
c $B385
  $B385 Jump to #R45983
b $B387
t $B392
b $B398
t $B3A2
b $B3A8
t $B3AA
b $B3B0
t $B3B2
b $B3B8
t $B3C2
b $B3C8
c $B3DD
  $B3DD Jump to #R46071
c $B3DF
  $B3DF Jump to #R46049
b $B3E1
t $B3E2
b $B3E8
t $B3EA
c $B3EE
  $B3EE #REGa=#REGa+1
  $B3EF Jump to #R46065
s $B3F1
c $B3F2
  $B3F2 #REGh=PEEK #REGhl
  $B3F3 #REGh=PEEK #REGhl
  $B3F4 #REGb=#REGd
  $B3F5 #REGe=#REGd
  $B3F6 #REGh=PEEK #REGhl
  $B3F7 #REGb=#REGd
  $B3F8 Do nothing
  $B3F9 Do nothing
  $B3FA #REGh=PEEK #REGhl
  $B3FB #REGa=#REGa+1
  $B3FC Jump to #R46102
c $B3FE
  $B3FE #REGa=#REGa+1
  $B3FF #REGh=PEEK #REGhl
  $B400 Do nothing
  $B401 Do nothing
  $B402 #REGb=#REGd
  $B403 #REGh=#REGh+1
  $B404 Jump to #R46110
c $B406
  $B406 Jump to #R46112
b $B408
t $B41D
b $B420
t $B428
b $B431
t $B432
b $B438
t $B469
b $B46C
c $B49D
  $B49D #REGa=#N(28,2,,1)($)
  $B49F Exchange #REGaf and #REGaf'
  $B4A0 Do nothing
  $B4A1 Do nothing
  $B4A2 POKE #N(14388,4,,1)($),#REGl; POKE #N(14389,4,,1)($),#REGh
  $B4A5 #REGa=#REGa+1
  $B4A6 #REGa=#N(0,2,,1)($)
  $B4A8 Do nothing
  $B4A9 Do nothing
  $B4AA Exchange #REGaf and #REGaf'
  $B4AB Jump to #R46309
b $B4AD
t $B4B3
b $B4B8
t $B4C5
b $B4C8
t $B4D9
b $B4E1
t $B4E2
b $B4E8
t $B4EE
b $B4F2
t $B516
b $B519
c $B581
  $B581 #REGd=#REGd+1
  $B582 POKE #REGbc,#REGa
  $B583 #REGbc=#REGbc+1
  $B584 #REGbc=#N(259,4,,1)($)
  $B587 #REGc=#REGc-1
  $B588 #REGbc=#N(285,4,,1)($)
  $B58B #REGbc=#REGbc+1
  $B58C POKE #REGbc,#REGa
  $B58D #REGbc=#REGbc+1
  $B58E #REGsp=#REGsp+1
  $B58F #REGbc=#REGbc+1
  $B590 #REGsp=#REGsp+1
  $B591 #REGc=#REGc+1
  $B592 #REGsp=#REGsp+1
  $B593 Rotate #REGa left through the carry flag
  $B594 #REGsp=#REGsp+1
  $B595 #REGb=#REGb-1
  $B596 #REGbc=#REGbc+1
  $B597 #REGb=#REGb+1
  $B598 #REGb=#REGb+1
  $B599 #REGb=#REGb+1
  $B59A #REGb=#REGb+1
  $B59B #REGhl=#REGhl+#REGbc
  $B59C #REGc=#REGc+1
  $B59D #REGe=#REGe-1
  $B59E Jump to #R46526
b $B5A0
c $B5BE
  $B5BE #REGl=#REGa
  $B5BF #REGh=#N(0,2,,1)($)
  $B5C1 #REGhl=#REGhl+#REGhl
  $B5C2 #REGhl=#REGhl+#REGhl
  $B5C3 #REGhl=#REGhl+#REGhl
  $B5C4 #REGe=#REGa
  $B5C5 #REGd=#N(0,2,,1)($)
  $B5C7 #REGhl=#REGhl+#REGde
  $B5C8 #REGhl=#REGhl+#REGde
  $B5C9 #REGde=#N(46385,4,,1)($)
  $B5CC #REGhl=#REGhl+#REGde
  $B5CD #REGde=#N(46515,4,,1)($)
  $B5D0 #REGbc=#N(10,4,,1)($)
  $B5D3 POKE #REGde,PEEK #REGhl; #REGhl=#REGhl+1; #REGde=#REGde+1; #REGbc=#REGbc-1; repeat until #REGbc=0
  $B5D5 #REGa=PEEK #N(46515,4,,1)($)
  $B5D8 #REGb=#REGa
  $B5D9 Push #REGbc onto the stack
  $B5DA #REGa=PEEK #N(46516,4,,1)($)
  $B5DD #REGb=#REGa
  $B5DE Push #REGbc onto the stack
  $B5DF #REGb=#N(4,2,,1)($)
  $B5E1 #REGhl=#N(46518,4,,1)($)
  $B5E4 #REGde=#N(2,4,,1)($)
  $B5E7 Push #REGbc onto the stack
  $B5E8 #REGb=PEEK #REGhl
  $B5E9 #REGc=#N(3,2,,1)($)
  $B5EB #REGc=#REGc-1
  $B5EC Jump to #R46571 if #REGc>0
  $B5EE Decrement #REGb and jump to #R46569 if #REGb>0
  $B5F0 #REGa=PEEK #N(46525,4,,1)($)
  $B5F3 Flip bit 4 of #REGa
  $B5F5 POKE #N(46525,4,,1)($),#REGa
  $B5F8 OUT #N(254,2,,1)($),#REGa
  $B5FA Pop last item from stack into #REGbc
  $B5FB #REGhl=#REGhl+#REGde
  $B5FC Decrement #REGb and jump to #R46567 if #REGb>0
  $B5FE Pop last item from stack into #REGbc
  $B5FF Decrement #REGb and jump to #R46558 if #REGb>0
  $B601 #REGhl=#N(46517,4,,1)($)
  $B604 #REGb=#N(4,2,,1)($)
  $B606 #REGde=#N(2,4,,1)($)
  $B609 #REGa=PEEK #REGhl
  $B60A #REGhl=#REGhl+1
  $B60B #REGa=#REGa+PEEK #REGhl
  $B60C POKE #REGhl,#REGa
  $B60D #REGhl=#REGhl+1
  $B60E Decrement #REGb and jump to #R46601 if #REGb>0
  $B610 Pop last item from stack into #REGbc
  $B611 Decrement #REGb and jump to #R46553 if #REGb>0
  $B613 Return
s $B614
c $FF18
  $FF18 Disable interrupts
  $FF19 #REGc=#REGc-1
  $FF1A #REGa=#REGa+carry+#N(11,2,,1)($)
  $FF1C Exchange the last item on the stack with #REGhl
  $FF1D #REGd=#REGb
  $FF1E #REGa=#REGa+carry+#N(11,2,,1)($)
  $FF20 CALL #R7504 if there was no overflow
  $FF23 Rotate #REGa left through the carry flag
  $FF24 CALL #R52746 if the carry flag is set
  $FF27 #REGbc=#REGbc-1
  $FF28 CALL #R32
  $FF29 #REGd=#REGb
  $FF2A #REGa=PEEK #REGde
  $FF2B Rotate #REGa left through the carry flag
  $FF2C CALL #R55050 if the carry flag is set
  $FF2F Jump to #R65385
b $FF31
t $FF59
b $FF5C
t $FF71
b $FF77
t $FF8C
b $FF8F
t $FF94
b $FF97
t $FFA4
b $FFA7
t $FFA9
b $FFAF
t $FFB9
b $FFBF
t $FFC1
b $FFC7
t $FFC9
b $FFCF
t $FFD9
b $FFDF
t $FFF9
b $FFFF
