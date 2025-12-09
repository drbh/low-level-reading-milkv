
activations:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100e8 <print_int>:
   100e8:	7139                	addi	sp,sp,-64
   100ea:	f822                	sd	s0,48(sp)
   100ec:	fc06                	sd	ra,56(sp)
   100ee:	0080                	addi	s0,sp,64
   100f0:	e129                	bnez	a0,10132 <print_int+0x4a>
   100f2:	03000793          	li	a5,48
   100f6:	fcf41023          	sh	a5,-64(s0)
   100fa:	fc040593          	addi	a1,s0,-64
   100fe:	862e                	mv	a2,a1
   10100:	00164783          	lbu	a5,1(a2)
   10104:	0605                	addi	a2,a2,1
   10106:	ffed                	bnez	a5,10100 <print_int+0x18>
   10108:	8e0d                	sub	a2,a2,a1
   1010a:	04000893          	li	a7,64
   1010e:	4505                	li	a0,1
   10110:	fc040593          	addi	a1,s0,-64
   10114:	00000073          	ecall
   10118:	70e2                	ld	ra,56(sp)
   1011a:	7442                	ld	s0,48(sp)
   1011c:	6121                	addi	sp,sp,64
   1011e:	4301                	li	t1,0
   10120:	4501                	li	a0,0
   10122:	4581                	li	a1,0
   10124:	4601                	li	a2,0
   10126:	4681                	li	a3,0
   10128:	4701                	li	a4,0
   1012a:	4781                	li	a5,0
   1012c:	4801                	li	a6,0
   1012e:	4881                	li	a7,0
   10130:	8082                	ret
   10132:	ccccd7b7          	lui	a5,0xccccd
   10136:	ccd78793          	addi	a5,a5,-819 # ffffffffcccccccd <__global_pointer$+0xffffffffcccba4cd>
   1013a:	02079893          	slli	a7,a5,0x20
   1013e:	fd840613          	addi	a2,s0,-40
   10142:	98be                	add	a7,a7,a5
   10144:	86b2                	mv	a3,a2
   10146:	4325                	li	t1,9
   10148:	031537b3          	mulhu	a5,a0,a7
   1014c:	85aa                	mv	a1,a0
   1014e:	8836                	mv	a6,a3
   10150:	0685                	addi	a3,a3,1
   10152:	838d                	srli	a5,a5,0x3
   10154:	00279713          	slli	a4,a5,0x2
   10158:	973e                	add	a4,a4,a5
   1015a:	0706                	slli	a4,a4,0x1
   1015c:	8d19                	sub	a0,a0,a4
   1015e:	0305051b          	addiw	a0,a0,48
   10162:	fea68fa3          	sb	a0,-1(a3)
   10166:	853e                	mv	a0,a5
   10168:	feb360e3          	bltu	t1,a1,10148 <print_int+0x60>
   1016c:	40c8083b          	subw	a6,a6,a2
   10170:	2805                	addiw	a6,a6,1
   10172:	fff8071b          	addiw	a4,a6,-1
   10176:	02071693          	slli	a3,a4,0x20
   1017a:	fc140793          	addi	a5,s0,-63
   1017e:	9281                	srli	a3,a3,0x20
   10180:	fc040593          	addi	a1,s0,-64
   10184:	9732                	add	a4,a4,a2
   10186:	00d78633          	add	a2,a5,a3
   1018a:	87ae                	mv	a5,a1
   1018c:	00074683          	lbu	a3,0(a4)
   10190:	0785                	addi	a5,a5,1
   10192:	177d                	addi	a4,a4,-1
   10194:	fed78fa3          	sb	a3,-1(a5)
   10198:	fec79ae3          	bne	a5,a2,1018c <print_int+0xa4>
   1019c:	fc044783          	lbu	a5,-64(s0)
   101a0:	9822                	add	a6,a6,s0
   101a2:	fc080023          	sb	zero,-64(a6)
   101a6:	4601                	li	a2,0
   101a8:	fbb9                	bnez	a5,100fe <print_int+0x16>
   101aa:	04000893          	li	a7,64
   101ae:	4505                	li	a0,1
   101b0:	fc040593          	addi	a1,s0,-64
   101b4:	00000073          	ecall
   101b8:	70e2                	ld	ra,56(sp)
   101ba:	7442                	ld	s0,48(sp)
   101bc:	6121                	addi	sp,sp,64
   101be:	4301                	li	t1,0
   101c0:	4501                	li	a0,0
   101c2:	4581                	li	a1,0
   101c4:	4601                	li	a2,0
   101c6:	4681                	li	a3,0
   101c8:	4701                	li	a4,0
   101ca:	4781                	li	a5,0
   101cc:	4801                	li	a6,0
   101ce:	4881                	li	a7,0
   101d0:	8082                	ret

00000000000101d2 <print_float>:
   101d2:	f00007d3          	fmv.w.x	fa5,zero
   101d6:	7179                	addi	sp,sp,-48
   101d8:	f022                	sd	s0,32(sp)
   101da:	a0f517d3          	flt.s	a5,fa0,fa5
   101de:	f406                	sd	ra,40(sp)
   101e0:	1800                	addi	s0,sp,48
   101e2:	4685                	li	a3,1
   101e4:	4e01                	li	t3,0
   101e6:	cb89                	beqz	a5,101f8 <print_float+0x26>
   101e8:	20a51553          	fneg.s	fa0,fa0
   101ec:	02d00793          	li	a5,45
   101f0:	fef40023          	sb	a5,-32(s0)
   101f4:	4689                	li	a3,2
   101f6:	4e05                	li	t3,1
   101f8:	c00517d3          	fcvt.w.s	a5,fa0,rtz
   101fc:	00002717          	auipc	a4,0x2
   10200:	e0472787          	flw	fa5,-508(a4) # 12000 <__DATA_BEGIN__>
   10204:	d007f753          	fcvt.s.w	fa4,a5
   10208:	2781                	sext.w	a5,a5
   1020a:	08e57553          	fsub.s	fa0,fa0,fa4
   1020e:	10f57553          	fmul.s	fa0,fa0,fa5
   10212:	c00515d3          	fcvt.w.s	a1,fa0,rtz
   10216:	2581                	sext.w	a1,a1
   10218:	efc9                	bnez	a5,102b2 <print_float+0xe0>
   1021a:	9e22                	add	t3,t3,s0
   1021c:	03000793          	li	a5,48
   10220:	fefe0023          	sb	a5,-32(t3)
   10224:	02e00713          	li	a4,46
   10228:	66666837          	lui	a6,0x66666
   1022c:	008687b3          	add	a5,a3,s0
   10230:	fee78023          	sb	a4,-32(a5)
   10234:	66780813          	addi	a6,a6,1639 # 66666667 <__global_pointer$+0x66653e67>
   10238:	0046861b          	addiw	a2,a3,4
   1023c:	03058733          	mul	a4,a1,a6
   10240:	41f5d79b          	sraiw	a5,a1,0x1f
   10244:	00860533          	add	a0,a2,s0
   10248:	367d                	addiw	a2,a2,-1
   1024a:	9709                	srai	a4,a4,0x22
   1024c:	9f1d                	subw	a4,a4,a5
   1024e:	0027179b          	slliw	a5,a4,0x2
   10252:	9fb9                	addw	a5,a5,a4
   10254:	0017979b          	slliw	a5,a5,0x1
   10258:	40f587bb          	subw	a5,a1,a5
   1025c:	0307879b          	addiw	a5,a5,48
   10260:	fef50023          	sb	a5,-32(a0)
   10264:	85ba                	mv	a1,a4
   10266:	fcd61be3          	bne	a2,a3,1023c <print_float+0x6a>
   1026a:	2615                	addiw	a2,a2,5
   1026c:	fe044783          	lbu	a5,-32(s0)
   10270:	9622                	add	a2,a2,s0
   10272:	fe060023          	sb	zero,-32(a2)
   10276:	cfc1                	beqz	a5,1030e <print_float+0x13c>
   10278:	fe040713          	addi	a4,s0,-32
   1027c:	863a                	mv	a2,a4
   1027e:	00164783          	lbu	a5,1(a2)
   10282:	0605                	addi	a2,a2,1
   10284:	ffed                	bnez	a5,1027e <print_float+0xac>
   10286:	8e19                	sub	a2,a2,a4
   10288:	04000893          	li	a7,64
   1028c:	4505                	li	a0,1
   1028e:	fe040593          	addi	a1,s0,-32
   10292:	00000073          	ecall
   10296:	70a2                	ld	ra,40(sp)
   10298:	7402                	ld	s0,32(sp)
   1029a:	6145                	addi	sp,sp,48
   1029c:	4301                	li	t1,0
   1029e:	4501                	li	a0,0
   102a0:	4581                	li	a1,0
   102a2:	4601                	li	a2,0
   102a4:	4681                	li	a3,0
   102a6:	4701                	li	a4,0
   102a8:	4781                	li	a5,0
   102aa:	4801                	li	a6,0
   102ac:	4881                	li	a7,0
   102ae:	4e01                	li	t3,0
   102b0:	8082                	ret
   102b2:	fd840513          	addi	a0,s0,-40
   102b6:	666668b7          	lui	a7,0x66666
   102ba:	882a                	mv	a6,a0
   102bc:	66788893          	addi	a7,a7,1639 # 66666667 <__global_pointer$+0x66653e67>
   102c0:	4601                	li	a2,0
   102c2:	03178733          	mul	a4,a5,a7
   102c6:	41f7d69b          	sraiw	a3,a5,0x1f
   102ca:	8332                	mv	t1,a2
   102cc:	0805                	addi	a6,a6,1
   102ce:	2605                	addiw	a2,a2,1
   102d0:	9709                	srai	a4,a4,0x22
   102d2:	9f15                	subw	a4,a4,a3
   102d4:	0027169b          	slliw	a3,a4,0x2
   102d8:	9eb9                	addw	a3,a3,a4
   102da:	0016969b          	slliw	a3,a3,0x1
   102de:	9f95                	subw	a5,a5,a3
   102e0:	0307879b          	addiw	a5,a5,48
   102e4:	fef80fa3          	sb	a5,-1(a6)
   102e8:	87ba                	mv	a5,a4
   102ea:	ff61                	bnez	a4,102c2 <print_float+0xf0>
   102ec:	006506b3          	add	a3,a0,t1
   102f0:	01c6063b          	addw	a2,a2,t3
   102f4:	87f2                	mv	a5,t3
   102f6:	0006c503          	lbu	a0,0(a3)
   102fa:	00878733          	add	a4,a5,s0
   102fe:	2785                	addiw	a5,a5,1
   10300:	fea70023          	sb	a0,-32(a4)
   10304:	16fd                	addi	a3,a3,-1
   10306:	fec798e3          	bne	a5,a2,102f6 <print_float+0x124>
   1030a:	86be                	mv	a3,a5
   1030c:	bf21                	j	10224 <print_float+0x52>
   1030e:	4601                	li	a2,0
   10310:	04000893          	li	a7,64
   10314:	4505                	li	a0,1
   10316:	fe040593          	addi	a1,s0,-32
   1031a:	00000073          	ecall
   1031e:	70a2                	ld	ra,40(sp)
   10320:	7402                	ld	s0,32(sp)
   10322:	6145                	addi	sp,sp,48
   10324:	4301                	li	t1,0
   10326:	4501                	li	a0,0
   10328:	4581                	li	a1,0
   1032a:	4601                	li	a2,0
   1032c:	4681                	li	a3,0
   1032e:	4701                	li	a4,0
   10330:	4781                	li	a5,0
   10332:	4801                	li	a6,0
   10334:	4881                	li	a7,0
   10336:	4e01                	li	t3,0
   10338:	8082                	ret

000000000001033a <benchmark.constprop.0>:
   1033a:	7139                	addi	sp,sp,-64
   1033c:	f822                	sd	s0,48(sp)
   1033e:	f04a                	sd	s2,32(sp)
   10340:	ec4e                	sd	s3,24(sp)
   10342:	e852                	sd	s4,16(sp)
   10344:	fc06                	sd	ra,56(sp)
   10346:	f426                	sd	s1,40(sp)
   10348:	e456                	sd	s5,8(sp)
   1034a:	0080                	addi	s0,sp,64
   1034c:	00054783          	lbu	a5,0(a0)
   10350:	892e                	mv	s2,a1
   10352:	89b2                	mv	s3,a2
   10354:	8a36                	mv	s4,a3
   10356:	22078563          	beqz	a5,10580 <benchmark.constprop.0+0x246>
   1035a:	87aa                	mv	a5,a0
   1035c:	0017c703          	lbu	a4,1(a5)
   10360:	0785                	addi	a5,a5,1
   10362:	ff6d                	bnez	a4,1035c <benchmark.constprop.0+0x22>
   10364:	40a78633          	sub	a2,a5,a0
   10368:	85aa                	mv	a1,a0
   1036a:	04000893          	li	a7,64
   1036e:	4505                	li	a0,1
   10370:	00000073          	ecall
   10374:	00001617          	auipc	a2,0x1
   10378:	9e460613          	addi	a2,a2,-1564 # 10d58 <dish_ref+0x90>
   1037c:	87b2                	mv	a5,a2
   1037e:	0017c703          	lbu	a4,1(a5)
   10382:	0785                	addi	a5,a5,1
   10384:	ff6d                	bnez	a4,1037e <benchmark.constprop.0+0x44>
   10386:	40c78633          	sub	a2,a5,a2
   1038a:	04000893          	li	a7,64
   1038e:	4505                	li	a0,1
   10390:	00001597          	auipc	a1,0x1
   10394:	9c858593          	addi	a1,a1,-1592 # 10d58 <dish_ref+0x90>
   10398:	00000073          	ecall
   1039c:	40000513          	li	a0,1024
   103a0:	d49ff0ef          	jal	100e8 <print_int>
   103a4:	00001617          	auipc	a2,0x1
   103a8:	9bc60613          	addi	a2,a2,-1604 # 10d60 <dish_ref+0x98>
   103ac:	87b2                	mv	a5,a2
   103ae:	0017c703          	lbu	a4,1(a5)
   103b2:	0785                	addi	a5,a5,1
   103b4:	ff6d                	bnez	a4,103ae <benchmark.constprop.0+0x74>
   103b6:	40c78633          	sub	a2,a5,a2
   103ba:	04000893          	li	a7,64
   103be:	4505                	li	a0,1
   103c0:	00001597          	auipc	a1,0x1
   103c4:	9a058593          	addi	a1,a1,-1632 # 10d60 <dish_ref+0x98>
   103c8:	00000073          	ecall
   103cc:	6509                	lui	a0,0x2
   103ce:	71050513          	addi	a0,a0,1808 # 2710 <print_int-0xd9d8>
   103d2:	d17ff0ef          	jal	100e8 <print_int>
   103d6:	4505                	li	a0,1
   103d8:	862a                	mv	a2,a0
   103da:	04000893          	li	a7,64
   103de:	00001597          	auipc	a1,0x1
   103e2:	9e258593          	addi	a1,a1,-1566 # 10dc0 <dish_ref+0xf8>
   103e6:	00000073          	ecall
   103ea:	06400493          	li	s1,100
   103ee:	40000613          	li	a2,1024
   103f2:	85d2                	mv	a1,s4
   103f4:	854e                	mv	a0,s3
   103f6:	34fd                	addiw	s1,s1,-1
   103f8:	9902                	jalr	s2
   103fa:	f8f5                	bnez	s1,103ee <benchmark.constprop.0+0xb4>
   103fc:	c0002af3          	rdcycle	s5
   10400:	6489                	lui	s1,0x2
   10402:	71048493          	addi	s1,s1,1808 # 2710 <print_int-0xd9d8>
   10406:	40000613          	li	a2,1024
   1040a:	85d2                	mv	a1,s4
   1040c:	854e                	mv	a0,s3
   1040e:	34fd                	addiw	s1,s1,-1
   10410:	9902                	jalr	s2
   10412:	f8f5                	bnez	s1,10406 <benchmark.constprop.0+0xcc>
   10414:	c00026f3          	rdcycle	a3
   10418:	346dc737          	lui	a4,0x346dc
   1041c:	5d670713          	addi	a4,a4,1494 # 346dc5d6 <__global_pointer$+0x346c9dd6>
   10420:	388667b7          	lui	a5,0x38866
   10424:	94b78793          	addi	a5,a5,-1717 # 3886594b <__global_pointer$+0x3885314b>
   10428:	1702                	slli	a4,a4,0x20
   1042a:	973e                	add	a4,a4,a5
   1042c:	415686b3          	sub	a3,a3,s5
   10430:	02e6b733          	mulhu	a4,a3,a4
   10434:	000fa937          	lui	s2,0xfa
   10438:	00001617          	auipc	a2,0x1
   1043c:	93060613          	addi	a2,a2,-1744 # 10d68 <dish_ref+0xa0>
   10440:	87b2                	mv	a5,a2
   10442:	00b75993          	srli	s3,a4,0xb
   10446:	03395933          	divu	s2,s2,s3
   1044a:	01575493          	srli	s1,a4,0x15
   1044e:	0017c703          	lbu	a4,1(a5)
   10452:	0785                	addi	a5,a5,1
   10454:	ff6d                	bnez	a4,1044e <benchmark.constprop.0+0x114>
   10456:	40c78633          	sub	a2,a5,a2
   1045a:	04000893          	li	a7,64
   1045e:	4505                	li	a0,1
   10460:	00001597          	auipc	a1,0x1
   10464:	90858593          	addi	a1,a1,-1784 # 10d68 <dish_ref+0xa0>
   10468:	00000073          	ecall
   1046c:	8536                	mv	a0,a3
   1046e:	c7bff0ef          	jal	100e8 <print_int>
   10472:	4505                	li	a0,1
   10474:	862a                	mv	a2,a0
   10476:	04000893          	li	a7,64
   1047a:	00001597          	auipc	a1,0x1
   1047e:	94658593          	addi	a1,a1,-1722 # 10dc0 <dish_ref+0xf8>
   10482:	00000073          	ecall
   10486:	00001617          	auipc	a2,0x1
   1048a:	8f260613          	addi	a2,a2,-1806 # 10d78 <dish_ref+0xb0>
   1048e:	87b2                	mv	a5,a2
   10490:	0017c703          	lbu	a4,1(a5)
   10494:	0785                	addi	a5,a5,1
   10496:	ff6d                	bnez	a4,10490 <benchmark.constprop.0+0x156>
   10498:	40c78633          	sub	a2,a5,a2
   1049c:	04000893          	li	a7,64
   104a0:	4505                	li	a0,1
   104a2:	00001597          	auipc	a1,0x1
   104a6:	8d658593          	addi	a1,a1,-1834 # 10d78 <dish_ref+0xb0>
   104aa:	00000073          	ecall
   104ae:	854e                	mv	a0,s3
   104b0:	c39ff0ef          	jal	100e8 <print_int>
   104b4:	4505                	li	a0,1
   104b6:	862a                	mv	a2,a0
   104b8:	04000893          	li	a7,64
   104bc:	00001597          	auipc	a1,0x1
   104c0:	90458593          	addi	a1,a1,-1788 # 10dc0 <dish_ref+0xf8>
   104c4:	00000073          	ecall
   104c8:	00001617          	auipc	a2,0x1
   104cc:	8c060613          	addi	a2,a2,-1856 # 10d88 <dish_ref+0xc0>
   104d0:	87b2                	mv	a5,a2
   104d2:	0017c703          	lbu	a4,1(a5)
   104d6:	0785                	addi	a5,a5,1
   104d8:	ff6d                	bnez	a4,104d2 <benchmark.constprop.0+0x198>
   104da:	40c78633          	sub	a2,a5,a2
   104de:	04000893          	li	a7,64
   104e2:	4505                	li	a0,1
   104e4:	00001597          	auipc	a1,0x1
   104e8:	8a458593          	addi	a1,a1,-1884 # 10d88 <dish_ref+0xc0>
   104ec:	00000073          	ecall
   104f0:	8526                	mv	a0,s1
   104f2:	bf7ff0ef          	jal	100e8 <print_int>
   104f6:	4505                	li	a0,1
   104f8:	862a                	mv	a2,a0
   104fa:	04000893          	li	a7,64
   104fe:	00001597          	auipc	a1,0x1
   10502:	8c258593          	addi	a1,a1,-1854 # 10dc0 <dish_ref+0xf8>
   10506:	00000073          	ecall
   1050a:	00001617          	auipc	a2,0x1
   1050e:	88e60613          	addi	a2,a2,-1906 # 10d98 <dish_ref+0xd0>
   10512:	87b2                	mv	a5,a2
   10514:	0017c703          	lbu	a4,1(a5)
   10518:	0785                	addi	a5,a5,1
   1051a:	ff6d                	bnez	a4,10514 <benchmark.constprop.0+0x1da>
   1051c:	40c78633          	sub	a2,a5,a2
   10520:	04000893          	li	a7,64
   10524:	4505                	li	a0,1
   10526:	00001597          	auipc	a1,0x1
   1052a:	87258593          	addi	a1,a1,-1934 # 10d98 <dish_ref+0xd0>
   1052e:	00000073          	ecall
   10532:	854a                	mv	a0,s2
   10534:	bb5ff0ef          	jal	100e8 <print_int>
   10538:	00001617          	auipc	a2,0x1
   1053c:	87060613          	addi	a2,a2,-1936 # 10da8 <dish_ref+0xe0>
   10540:	87b2                	mv	a5,a2
   10542:	0017c703          	lbu	a4,1(a5)
   10546:	0785                	addi	a5,a5,1
   10548:	ff6d                	bnez	a4,10542 <benchmark.constprop.0+0x208>
   1054a:	40c78633          	sub	a2,a5,a2
   1054e:	04000893          	li	a7,64
   10552:	4505                	li	a0,1
   10554:	00001597          	auipc	a1,0x1
   10558:	85458593          	addi	a1,a1,-1964 # 10da8 <dish_ref+0xe0>
   1055c:	00000073          	ecall
   10560:	70e2                	ld	ra,56(sp)
   10562:	7442                	ld	s0,48(sp)
   10564:	74a2                	ld	s1,40(sp)
   10566:	7902                	ld	s2,32(sp)
   10568:	69e2                	ld	s3,24(sp)
   1056a:	6a42                	ld	s4,16(sp)
   1056c:	6aa2                	ld	s5,8(sp)
   1056e:	6121                	addi	sp,sp,64
   10570:	4501                	li	a0,0
   10572:	4581                	li	a1,0
   10574:	4601                	li	a2,0
   10576:	4681                	li	a3,0
   10578:	4701                	li	a4,0
   1057a:	4781                	li	a5,0
   1057c:	4881                	li	a7,0
   1057e:	8082                	ret
   10580:	4601                	li	a2,0
   10582:	b3dd                	j	10368 <benchmark.constprop.0+0x2e>

0000000000010584 <_start>:
   10584:	7131                	addi	sp,sp,-192
   10586:	f922                	sd	s0,176(sp)
   10588:	fd06                	sd	ra,184(sp)
   1058a:	f526                	sd	s1,168(sp)
   1058c:	f14a                	sd	s2,160(sp)
   1058e:	ed4e                	sd	s3,152(sp)
   10590:	e952                	sd	s4,144(sp)
   10592:	e556                	sd	s5,136(sp)
   10594:	e15a                	sd	s6,128(sp)
   10596:	fcde                	sd	s7,120(sp)
   10598:	f8e2                	sd	s8,112(sp)
   1059a:	f4e6                	sd	s9,104(sp)
   1059c:	f0ea                	sd	s10,96(sp)
   1059e:	0180                	addi	s0,sp,192
   105a0:	72f9                	lui	t0,0xffffe
   105a2:	00001617          	auipc	a2,0x1
   105a6:	82660613          	addi	a2,a2,-2010 # 10dc8 <dish_ref+0x100>
   105aa:	87b2                	mv	a5,a2
   105ac:	9116                	add	sp,sp,t0
   105ae:	0017c703          	lbu	a4,1(a5)
   105b2:	0785                	addi	a5,a5,1
   105b4:	ff6d                	bnez	a4,105ae <_start+0x2a>
   105b6:	40c78633          	sub	a2,a5,a2
   105ba:	04000893          	li	a7,64
   105be:	4505                	li	a0,1
   105c0:	00001597          	auipc	a1,0x1
   105c4:	80858593          	addi	a1,a1,-2040 # 10dc8 <dish_ref+0x100>
   105c8:	00000073          	ecall
   105cc:	00001797          	auipc	a5,0x1
   105d0:	8ac78793          	addi	a5,a5,-1876 # 10e78 <dish_ref+0x1b0>
   105d4:	7679                	lui	a2,0xffffe
   105d6:	0007b883          	ld	a7,0(a5)
   105da:	0087b803          	ld	a6,8(a5)
   105de:	6b94                	ld	a3,16(a5)
   105e0:	6f98                	ld	a4,24(a5)
   105e2:	f4060793          	addi	a5,a2,-192 # ffffffffffffdf40 <__global_pointer$+0xfffffffffffeb740>
   105e6:	00f404b3          	add	s1,s0,a5
   105ea:	8932                	mv	s2,a2
   105ec:	00c407b3          	add	a5,s0,a2
   105f0:	f6060613          	addi	a2,a2,-160
   105f4:	00c405b3          	add	a1,s0,a2
   105f8:	8526                	mv	a0,s1
   105fa:	4621                	li	a2,8
   105fc:	f517b023          	sd	a7,-192(a5)
   10600:	f507b423          	sd	a6,-184(a5)
   10604:	f4d7b823          	sd	a3,-176(a5)
   10608:	f4e7bc23          	sd	a4,-168(a5)
   1060c:	37c000ef          	jal	10988 <gelu_rvv>
   10610:	f8090793          	addi	a5,s2,-128 # f9f80 <__global_pointer$+0xe7780>
   10614:	00f405b3          	add	a1,s0,a5
   10618:	4621                	li	a2,8
   1061a:	8526                	mv	a0,s1
   1061c:	432000ef          	jal	10a4e <gelu_ref>
   10620:	00000617          	auipc	a2,0x0
   10624:	7c860613          	addi	a2,a2,1992 # 10de8 <dish_ref+0x120>
   10628:	87b2                	mv	a5,a2
   1062a:	0017c703          	lbu	a4,1(a5)
   1062e:	0785                	addi	a5,a5,1
   10630:	ff6d                	bnez	a4,1062a <_start+0xa6>
   10632:	40c78633          	sub	a2,a5,a2
   10636:	04000893          	li	a7,64
   1063a:	4505                	li	a0,1
   1063c:	00000597          	auipc	a1,0x0
   10640:	7ac58593          	addi	a1,a1,1964 # 10de8 <dish_ref+0x120>
   10644:	00000073          	ecall
   10648:	77f9                	lui	a5,0xffffe
   1064a:	f8078713          	addi	a4,a5,-128 # ffffffffffffdf80 <__global_pointer$+0xfffffffffffeb780>
   1064e:	00e404b3          	add	s1,s0,a4
   10652:	f6078713          	addi	a4,a5,-160
   10656:	f4078793          	addi	a5,a5,-192
   1065a:	00e40a33          	add	s4,s0,a4
   1065e:	00f409b3          	add	s3,s0,a5
   10662:	02048a93          	addi	s5,s1,32
   10666:	8926                	mv	s2,s1
   10668:	8cd2                	mv	s9,s4
   1066a:	8c4e                	mv	s8,s3
   1066c:	00000b97          	auipc	s7,0x0
   10670:	7a4b8b93          	addi	s7,s7,1956 # 10e10 <dish_ref+0x148>
   10674:	00000b17          	auipc	s6,0x0
   10678:	794b0b13          	addi	s6,s6,1940 # 10e08 <dish_ref+0x140>
   1067c:	00000d17          	auipc	s10,0x0
   10680:	784d0d13          	addi	s10,s10,1924 # 10e00 <dish_ref+0x138>
   10684:	00000617          	auipc	a2,0x0
   10688:	77c60613          	addi	a2,a2,1916 # 10e00 <dish_ref+0x138>
   1068c:	00164783          	lbu	a5,1(a2)
   10690:	0605                	addi	a2,a2,1
   10692:	ffed                	bnez	a5,1068c <_start+0x108>
   10694:	41a60633          	sub	a2,a2,s10
   10698:	04000893          	li	a7,64
   1069c:	4505                	li	a0,1
   1069e:	00000597          	auipc	a1,0x0
   106a2:	76258593          	addi	a1,a1,1890 # 10e00 <dish_ref+0x138>
   106a6:	00000073          	ecall
   106aa:	000c2507          	flw	fa0,0(s8)
   106ae:	b25ff0ef          	jal	101d2 <print_float>
   106b2:	00000617          	auipc	a2,0x0
   106b6:	75660613          	addi	a2,a2,1878 # 10e08 <dish_ref+0x140>
   106ba:	00164783          	lbu	a5,1(a2)
   106be:	0605                	addi	a2,a2,1
   106c0:	ffed                	bnez	a5,106ba <_start+0x136>
   106c2:	41660633          	sub	a2,a2,s6
   106c6:	04000893          	li	a7,64
   106ca:	4505                	li	a0,1
   106cc:	00000597          	auipc	a1,0x0
   106d0:	73c58593          	addi	a1,a1,1852 # 10e08 <dish_ref+0x140>
   106d4:	00000073          	ecall
   106d8:	000ca507          	flw	fa0,0(s9)
   106dc:	af7ff0ef          	jal	101d2 <print_float>
   106e0:	00000617          	auipc	a2,0x0
   106e4:	73060613          	addi	a2,a2,1840 # 10e10 <dish_ref+0x148>
   106e8:	00164783          	lbu	a5,1(a2)
   106ec:	0605                	addi	a2,a2,1
   106ee:	ffed                	bnez	a5,106e8 <_start+0x164>
   106f0:	41760633          	sub	a2,a2,s7
   106f4:	04000893          	li	a7,64
   106f8:	4505                	li	a0,1
   106fa:	00000597          	auipc	a1,0x0
   106fe:	71658593          	addi	a1,a1,1814 # 10e10 <dish_ref+0x148>
   10702:	00000073          	ecall
   10706:	00092507          	flw	fa0,0(s2)
   1070a:	ac9ff0ef          	jal	101d2 <print_float>
   1070e:	4505                	li	a0,1
   10710:	862a                	mv	a2,a0
   10712:	04000893          	li	a7,64
   10716:	00000597          	auipc	a1,0x0
   1071a:	6aa58593          	addi	a1,a1,1706 # 10dc0 <dish_ref+0xf8>
   1071e:	00000073          	ecall
   10722:	0911                	addi	s2,s2,4
   10724:	0c91                	addi	s9,s9,4
   10726:	0c11                	addi	s8,s8,4
   10728:	f5591ee3          	bne	s2,s5,10684 <_start+0x100>
   1072c:	77f9                	lui	a5,0xffffe
   1072e:	f4078713          	addi	a4,a5,-192 # ffffffffffffdf40 <__global_pointer$+0xfffffffffffeb740>
   10732:	00e40933          	add	s2,s0,a4
   10736:	8c3e                	mv	s8,a5
   10738:	f6078793          	addi	a5,a5,-160
   1073c:	00f405b3          	add	a1,s0,a5
   10740:	854a                	mv	a0,s2
   10742:	4621                	li	a2,8
   10744:	4c8000ef          	jal	10c0c <dish_rvv>
   10748:	f80c0793          	addi	a5,s8,-128
   1074c:	00f405b3          	add	a1,s0,a5
   10750:	4621                	li	a2,8
   10752:	854a                	mv	a0,s2
   10754:	574000ef          	jal	10cc8 <dish_ref>
   10758:	00000617          	auipc	a2,0x0
   1075c:	6c060613          	addi	a2,a2,1728 # 10e18 <dish_ref+0x150>
   10760:	87b2                	mv	a5,a2
   10762:	0017c703          	lbu	a4,1(a5)
   10766:	0785                	addi	a5,a5,1
   10768:	ff6d                	bnez	a4,10762 <_start+0x1de>
   1076a:	40c78633          	sub	a2,a5,a2
   1076e:	04000893          	li	a7,64
   10772:	4505                	li	a0,1
   10774:	00000597          	auipc	a1,0x0
   10778:	6a458593          	addi	a1,a1,1700 # 10e18 <dish_ref+0x150>
   1077c:	00000073          	ecall
   10780:	00000917          	auipc	s2,0x0
   10784:	6b090913          	addi	s2,s2,1712 # 10e30 <dish_ref+0x168>
   10788:	00000617          	auipc	a2,0x0
   1078c:	6a860613          	addi	a2,a2,1704 # 10e30 <dish_ref+0x168>
   10790:	00164783          	lbu	a5,1(a2)
   10794:	0605                	addi	a2,a2,1
   10796:	ffed                	bnez	a5,10790 <_start+0x20c>
   10798:	41260633          	sub	a2,a2,s2
   1079c:	04000893          	li	a7,64
   107a0:	4505                	li	a0,1
   107a2:	00000597          	auipc	a1,0x0
   107a6:	68e58593          	addi	a1,a1,1678 # 10e30 <dish_ref+0x168>
   107aa:	00000073          	ecall
   107ae:	0009a507          	flw	fa0,0(s3)
   107b2:	a21ff0ef          	jal	101d2 <print_float>
   107b6:	00000617          	auipc	a2,0x0
   107ba:	65260613          	addi	a2,a2,1618 # 10e08 <dish_ref+0x140>
   107be:	00164783          	lbu	a5,1(a2)
   107c2:	0605                	addi	a2,a2,1
   107c4:	ffed                	bnez	a5,107be <_start+0x23a>
   107c6:	41660633          	sub	a2,a2,s6
   107ca:	04000893          	li	a7,64
   107ce:	4505                	li	a0,1
   107d0:	00000597          	auipc	a1,0x0
   107d4:	63858593          	addi	a1,a1,1592 # 10e08 <dish_ref+0x140>
   107d8:	00000073          	ecall
   107dc:	000a2507          	flw	fa0,0(s4)
   107e0:	9f3ff0ef          	jal	101d2 <print_float>
   107e4:	00000617          	auipc	a2,0x0
   107e8:	62c60613          	addi	a2,a2,1580 # 10e10 <dish_ref+0x148>
   107ec:	00164783          	lbu	a5,1(a2)
   107f0:	0605                	addi	a2,a2,1
   107f2:	ffed                	bnez	a5,107ec <_start+0x268>
   107f4:	41760633          	sub	a2,a2,s7
   107f8:	04000893          	li	a7,64
   107fc:	4505                	li	a0,1
   107fe:	00000597          	auipc	a1,0x0
   10802:	61258593          	addi	a1,a1,1554 # 10e10 <dish_ref+0x148>
   10806:	00000073          	ecall
   1080a:	0004a507          	flw	fa0,0(s1)
   1080e:	9c5ff0ef          	jal	101d2 <print_float>
   10812:	4505                	li	a0,1
   10814:	862a                	mv	a2,a0
   10816:	04000893          	li	a7,64
   1081a:	00000597          	auipc	a1,0x0
   1081e:	5a658593          	addi	a1,a1,1446 # 10dc0 <dish_ref+0xf8>
   10822:	00000073          	ecall
   10826:	0491                	addi	s1,s1,4
   10828:	0a11                	addi	s4,s4,4
   1082a:	0991                	addi	s3,s3,4
   1082c:	f5549ee3          	bne	s1,s5,10788 <_start+0x204>
   10830:	00001797          	auipc	a5,0x1
   10834:	7d47a687          	flw	fa3,2004(a5) # 12004 <__DATA_BEGIN__+0x4>
   10838:	00001797          	auipc	a5,0x1
   1083c:	7d07a707          	flw	fa4,2000(a5) # 12008 <__DATA_BEGIN__+0x8>
   10840:	51eb8637          	lui	a2,0x51eb8
   10844:	77f9                	lui	a5,0xffffe
   10846:	fa078793          	addi	a5,a5,-96 # ffffffffffffdfa0 <__global_pointer$+0xfffffffffffeb7a0>
   1084a:	00f406b3          	add	a3,s0,a5
   1084e:	51f60613          	addi	a2,a2,1311 # 51eb851f <__global_pointer$+0x51ea5d1f>
   10852:	4701                	li	a4,0
   10854:	06400513          	li	a0,100
   10858:	40000593          	li	a1,1024
   1085c:	02071793          	slli	a5,a4,0x20
   10860:	9381                	srli	a5,a5,0x20
   10862:	02c787b3          	mul	a5,a5,a2
   10866:	0691                	addi	a3,a3,4
   10868:	9395                	srli	a5,a5,0x25
   1086a:	02f507bb          	mulw	a5,a0,a5
   1086e:	40f707bb          	subw	a5,a4,a5
   10872:	d007f7d3          	fcvt.s.w	fa5,a5
   10876:	2705                	addiw	a4,a4,1
   10878:	18d7f7d3          	fdiv.s	fa5,fa5,fa3
   1087c:	08e7f7d3          	fsub.s	fa5,fa5,fa4
   10880:	fef6ae27          	fsw	fa5,-4(a3)
   10884:	fcb71ce3          	bne	a4,a1,1085c <_start+0x2d8>
   10888:	4505                	li	a0,1
   1088a:	862a                	mv	a2,a0
   1088c:	04000893          	li	a7,64
   10890:	00000597          	auipc	a1,0x0
   10894:	53058593          	addi	a1,a1,1328 # 10dc0 <dish_ref+0xf8>
   10898:	00000073          	ecall
   1089c:	77fd                	lui	a5,0xfffff
   1089e:	fa078793          	addi	a5,a5,-96 # ffffffffffffefa0 <__global_pointer$+0xfffffffffffec7a0>
   108a2:	00f40933          	add	s2,s0,a5
   108a6:	77f9                	lui	a5,0xffffe
   108a8:	fa078793          	addi	a5,a5,-96 # ffffffffffffdfa0 <__global_pointer$+0xfffffffffffeb7a0>
   108ac:	00f404b3          	add	s1,s0,a5
   108b0:	8626                	mv	a2,s1
   108b2:	86ca                	mv	a3,s2
   108b4:	00000597          	auipc	a1,0x0
   108b8:	0d458593          	addi	a1,a1,212 # 10988 <gelu_rvv>
   108bc:	00000517          	auipc	a0,0x0
   108c0:	57c50513          	addi	a0,a0,1404 # 10e38 <dish_ref+0x170>
   108c4:	a77ff0ef          	jal	1033a <benchmark.constprop.0>
   108c8:	4505                	li	a0,1
   108ca:	862a                	mv	a2,a0
   108cc:	04000893          	li	a7,64
   108d0:	00000597          	auipc	a1,0x0
   108d4:	4f058593          	addi	a1,a1,1264 # 10dc0 <dish_ref+0xf8>
   108d8:	00000073          	ecall
   108dc:	00000597          	auipc	a1,0x0
   108e0:	17258593          	addi	a1,a1,370 # 10a4e <gelu_ref>
   108e4:	8626                	mv	a2,s1
   108e6:	86ca                	mv	a3,s2
   108e8:	00000517          	auipc	a0,0x0
   108ec:	56050513          	addi	a0,a0,1376 # 10e48 <dish_ref+0x180>
   108f0:	a4bff0ef          	jal	1033a <benchmark.constprop.0>
   108f4:	4505                	li	a0,1
   108f6:	862a                	mv	a2,a0
   108f8:	04000893          	li	a7,64
   108fc:	00000597          	auipc	a1,0x0
   10900:	4c458593          	addi	a1,a1,1220 # 10dc0 <dish_ref+0xf8>
   10904:	00000073          	ecall
   10908:	00000597          	auipc	a1,0x0
   1090c:	30458593          	addi	a1,a1,772 # 10c0c <dish_rvv>
   10910:	8626                	mv	a2,s1
   10912:	86ca                	mv	a3,s2
   10914:	00000517          	auipc	a0,0x0
   10918:	54450513          	addi	a0,a0,1348 # 10e58 <dish_ref+0x190>
   1091c:	a1fff0ef          	jal	1033a <benchmark.constprop.0>
   10920:	4505                	li	a0,1
   10922:	862a                	mv	a2,a0
   10924:	04000893          	li	a7,64
   10928:	00000597          	auipc	a1,0x0
   1092c:	49858593          	addi	a1,a1,1176 # 10dc0 <dish_ref+0xf8>
   10930:	00000073          	ecall
   10934:	00000597          	auipc	a1,0x0
   10938:	39458593          	addi	a1,a1,916 # 10cc8 <dish_ref>
   1093c:	86ca                	mv	a3,s2
   1093e:	8626                	mv	a2,s1
   10940:	00000517          	auipc	a0,0x0
   10944:	52850513          	addi	a0,a0,1320 # 10e68 <dish_ref+0x1a0>
   10948:	9f3ff0ef          	jal	1033a <benchmark.constprop.0>
   1094c:	05d00893          	li	a7,93
   10950:	4501                	li	a0,0
   10952:	00000073          	ecall
   10956:	6289                	lui	t0,0x2
   10958:	9116                	add	sp,sp,t0
   1095a:	70ea                	ld	ra,184(sp)
   1095c:	744a                	ld	s0,176(sp)
   1095e:	74aa                	ld	s1,168(sp)
   10960:	790a                	ld	s2,160(sp)
   10962:	69ea                	ld	s3,152(sp)
   10964:	6a4a                	ld	s4,144(sp)
   10966:	6aaa                	ld	s5,136(sp)
   10968:	6b0a                	ld	s6,128(sp)
   1096a:	7be6                	ld	s7,120(sp)
   1096c:	7c46                	ld	s8,112(sp)
   1096e:	7ca6                	ld	s9,104(sp)
   10970:	7d06                	ld	s10,96(sp)
   10972:	6129                	addi	sp,sp,192
   10974:	4281                	li	t0,0
   10976:	4501                	li	a0,0
   10978:	4581                	li	a1,0
   1097a:	4601                	li	a2,0
   1097c:	4681                	li	a3,0
   1097e:	4701                	li	a4,0
   10980:	4781                	li	a5,0
   10982:	4801                	li	a6,0
   10984:	4881                	li	a7,0
   10986:	8082                	ret

0000000000010988 <gelu_rvv>:
   10988:	1141                	addi	sp,sp,-16
   1098a:	e022                	sd	s0,0(sp)
   1098c:	e406                	sd	ra,8(sp)
   1098e:	0800                	addi	s0,sp,16
   10990:	c645                	beqz	a2,10a38 <gelu_rvv+0xb0>
   10992:	00001797          	auipc	a5,0x1
   10996:	67a7a087          	flw	ft1,1658(a5) # 1200c <__DATA_BEGIN__+0xc>
   1099a:	00001797          	auipc	a5,0x1
   1099e:	6767a007          	flw	ft0,1654(a5) # 12010 <__DATA_BEGIN__+0x10>
   109a2:	00001797          	auipc	a5,0x1
   109a6:	6727a507          	flw	fa0,1650(a5) # 12014 <__DATA_BEGIN__+0x14>
   109aa:	00001797          	auipc	a5,0x1
   109ae:	66e7a587          	flw	fa1,1646(a5) # 12018 <__DATA_BEGIN__+0x18>
   109b2:	00001797          	auipc	a5,0x1
   109b6:	66a7a607          	flw	fa2,1642(a5) # 1201c <__DATA_BEGIN__+0x1c>
   109ba:	00001797          	auipc	a5,0x1
   109be:	6667a787          	flw	fa5,1638(a5) # 12020 <__DATA_BEGIN__+0x20>
   109c2:	00001797          	auipc	a5,0x1
   109c6:	6627a687          	flw	fa3,1634(a5) # 12024 <__DATA_BEGIN__+0x24>
   109ca:	00001797          	auipc	a5,0x1
   109ce:	65e7a707          	flw	fa4,1630(a5) # 12028 <__DATA_BEGIN__+0x28>
   109d2:	4681                	li	a3,0
   109d4:	00269713          	slli	a4,a3,0x2
   109d8:	40d607b3          	sub	a5,a2,a3
   109dc:	0087f7d7          	th.vsetvli	a5,a5,e32,m1,d1
   109e0:	00e50833          	add	a6,a0,a4
   109e4:	02087107          	th.vle.v	v2,(a6)
   109e8:	972e                	add	a4,a4,a1
   109ea:	96be                	add	a3,a3,a5
   109ec:	922110d7          	th.vfmul.vv	v1,v2,v2
   109f0:	921110d7          	th.vfmul.vv	v1,v1,v2
   109f4:	9210d0d7          	th.vfmul.vf	v1,v1,ft1
   109f8:	022090d7          	th.vfadd.vv	v1,v2,v1
   109fc:	921050d7          	th.vfmul.vf	v1,v1,ft0
   10a00:	921091d7          	th.vfmul.vv	v3,v1,v1
   10a04:	92355257          	th.vfmul.vf	v4,v3,fa0
   10a08:	923651d7          	th.vfmul.vf	v3,v3,fa2
   10a0c:	0245d257          	th.vfadd.vf	v4,v4,fa1
   10a10:	0237d1d7          	th.vfadd.vf	v3,v3,fa5
   10a14:	921210d7          	th.vfmul.vv	v1,v1,v4
   10a18:	821190d7          	th.vfdiv.vv	v1,v1,v3
   10a1c:	1217d0d7          	th.vfmin.vf	v1,v1,fa5
   10a20:	1a16d0d7          	th.vfmax.vf	v1,v1,fa3
   10a24:	0217d0d7          	th.vfadd.vf	v1,v1,fa5
   10a28:	92209157          	th.vfmul.vv	v2,v2,v1
   10a2c:	92275157          	th.vfmul.vf	v2,v2,fa4
   10a30:	02077127          	th.vse.v	v2,(a4)
   10a34:	fac6e0e3          	bltu	a3,a2,109d4 <gelu_rvv+0x4c>
   10a38:	60a2                	ld	ra,8(sp)
   10a3a:	6402                	ld	s0,0(sp)
   10a3c:	0141                	addi	sp,sp,16
   10a3e:	4501                	li	a0,0
   10a40:	4581                	li	a1,0
   10a42:	4601                	li	a2,0
   10a44:	4681                	li	a3,0
   10a46:	4701                	li	a4,0
   10a48:	4781                	li	a5,0
   10a4a:	4801                	li	a6,0
   10a4c:	8082                	ret

0000000000010a4e <gelu_ref>:
   10a4e:	1a060963          	beqz	a2,10c00 <gelu_ref+0x1b2>
   10a52:	715d                	addi	sp,sp,-80
   10a54:	e0a2                	sd	s0,64(sp)
   10a56:	bc22                	fsd	fs0,56(sp)
   10a58:	b826                	fsd	fs1,48(sp)
   10a5a:	b44a                	fsd	fs2,40(sp)
   10a5c:	b04e                	fsd	fs3,32(sp)
   10a5e:	ac52                	fsd	fs4,24(sp)
   10a60:	a856                	fsd	fs5,16(sp)
   10a62:	a45a                	fsd	fs6,8(sp)
   10a64:	a05e                	fsd	fs7,0(sp)
   10a66:	e486                	sd	ra,72(sp)
   10a68:	0880                	addi	s0,sp,80
   10a6a:	00001797          	auipc	a5,0x1
   10a6e:	5c27a887          	flw	fa7,1474(a5) # 1202c <__DATA_BEGIN__+0x2c>
   10a72:	00001797          	auipc	a5,0x1
   10a76:	5ae7a587          	flw	fa1,1454(a5) # 12020 <__DATA_BEGIN__+0x20>
   10a7a:	00001797          	auipc	a5,0x1
   10a7e:	5b67a807          	flw	fa6,1462(a5) # 12030 <__DATA_BEGIN__+0x30>
   10a82:	00001797          	auipc	a5,0x1
   10a86:	5b27a387          	flw	ft7,1458(a5) # 12034 <__DATA_BEGIN__+0x34>
   10a8a:	00001797          	auipc	a5,0x1
   10a8e:	5ae7a307          	flw	ft6,1454(a5) # 12038 <__DATA_BEGIN__+0x38>
   10a92:	00001797          	auipc	a5,0x1
   10a96:	5aa7a287          	flw	ft5,1450(a5) # 1203c <__DATA_BEGIN__+0x3c>
   10a9a:	00001797          	auipc	a5,0x1
   10a9e:	5a67a207          	flw	ft4,1446(a5) # 12040 <__DATA_BEGIN__+0x40>
   10aa2:	00001797          	auipc	a5,0x1
   10aa6:	5a27a187          	flw	ft3,1442(a5) # 12044 <__DATA_BEGIN__+0x44>
   10aaa:	00001797          	auipc	a5,0x1
   10aae:	59e7a107          	flw	ft2,1438(a5) # 12048 <__DATA_BEGIN__+0x48>
   10ab2:	00001797          	auipc	a5,0x1
   10ab6:	5767a087          	flw	ft1,1398(a5) # 12028 <__DATA_BEGIN__+0x28>
   10aba:	00001797          	auipc	a5,0x1
   10abe:	56a7ab87          	flw	fs7,1386(a5) # 12024 <__DATA_BEGIN__+0x24>
   10ac2:	00001797          	auipc	a5,0x1
   10ac6:	58a7ab07          	flw	fs6,1418(a5) # 1204c <__DATA_BEGIN__+0x4c>
   10aca:	00001797          	auipc	a5,0x1
   10ace:	5867aa87          	flw	fs5,1414(a5) # 12050 <__DATA_BEGIN__+0x50>
   10ad2:	00001797          	auipc	a5,0x1
   10ad6:	5827aa07          	flw	fs4,1410(a5) # 12054 <__DATA_BEGIN__+0x54>
   10ada:	00001797          	auipc	a5,0x1
   10ade:	57e7a987          	flw	fs3,1406(a5) # 12058 <__DATA_BEGIN__+0x58>
   10ae2:	00001797          	auipc	a5,0x1
   10ae6:	57a7a907          	flw	fs2,1402(a5) # 1205c <__DATA_BEGIN__+0x5c>
   10aea:	00001797          	auipc	a5,0x1
   10aee:	5767a487          	flw	fs1,1398(a5) # 12060 <__DATA_BEGIN__+0x60>
   10af2:	00001797          	auipc	a5,0x1
   10af6:	5727a407          	flw	fs0,1394(a5) # 12064 <__DATA_BEGIN__+0x64>
   10afa:	00001797          	auipc	a5,0x1
   10afe:	56e7af87          	flw	ft11,1390(a5) # 12068 <__DATA_BEGIN__+0x68>
   10b02:	00001797          	auipc	a5,0x1
   10b06:	56a7af07          	flw	ft10,1386(a5) # 1206c <__DATA_BEGIN__+0x6c>
   10b0a:	00001797          	auipc	a5,0x1
   10b0e:	5667ae87          	flw	ft9,1382(a5) # 12070 <__DATA_BEGIN__+0x70>
   10b12:	00001797          	auipc	a5,0x1
   10b16:	5627ae07          	flw	ft8,1378(a5) # 12074 <__DATA_BEGIN__+0x74>
   10b1a:	060a                	slli	a2,a2,0x2
   10b1c:	f0000053          	fmv.w.x	ft0,zero
   10b20:	00c507b3          	add	a5,a0,a2
   10b24:	a0b1                	j	10b70 <gelu_ref+0x122>
   10b26:	a967f6c3          	fmadd.s	fa3,fa5,fs6,fs5
   10b2a:	a0d7f6c3          	fmadd.s	fa3,fa5,fa3,fs4
   10b2e:	98d7f6c3          	fmadd.s	fa3,fa5,fa3,fs3
   10b32:	90d7f6c3          	fmadd.s	fa3,fa5,fa3,fs2
   10b36:	48d7f6c3          	fmadd.s	fa3,fa5,fa3,fs1
   10b3a:	40d7f6c3          	fmadd.s	fa3,fa5,fa3,fs0
   10b3e:	f8d7f6c3          	fmadd.s	fa3,fa5,fa3,ft11
   10b42:	f0d7f6c3          	fmadd.s	fa3,fa5,fa3,ft10
   10b46:	e8d7f6c3          	fmadd.s	fa3,fa5,fa3,ft9
   10b4a:	e0d7f7c3          	fmadd.s	fa5,fa5,fa3,ft8
   10b4e:	58e7f74b          	fnmsub.s	fa4,fa5,fa4,fa1
   10b52:	a0e59753          	flt.s	a4,fa1,fa4
   10b56:	c32d                	beqz	a4,10bb8 <gelu_ref+0x16a>
   10b58:	10167653          	fmul.s	fa2,fa2,ft1
   10b5c:	00b57553          	fadd.s	fa0,fa0,fa1
   10b60:	0511                	addi	a0,a0,4
   10b62:	0591                	addi	a1,a1,4
   10b64:	10a67653          	fmul.s	fa2,fa2,fa0
   10b68:	fec5ae27          	fsw	fa2,-4(a1)
   10b6c:	06f50963          	beq	a0,a5,10bde <gelu_ref+0x190>
   10b70:	00052607          	flw	fa2,0(a0)
   10b74:	20b58553          	fmv.s	fa0,fa1
   10b78:	111677d3          	fmul.s	fa5,fa2,fa7
   10b7c:	a0079753          	flt.s	a4,fa5,ft0
   10b80:	c719                	beqz	a4,10b8e <gelu_ref+0x140>
   10b82:	20f797d3          	fneg.s	fa5,fa5
   10b86:	00001717          	auipc	a4,0x1
   10b8a:	49e72507          	flw	fa0,1182(a4) # 12024 <__DATA_BEGIN__+0x24>
   10b8e:	5907f743          	fmadd.s	fa4,fa5,fa6,fa1
   10b92:	10f7f7d3          	fmul.s	fa5,fa5,fa5
   10b96:	18e5f753          	fdiv.s	fa4,fa1,fa4
   10b9a:	a0f11753          	flt.s	a4,ft2,fa5
   10b9e:	307776c3          	fmadd.s	fa3,fa4,ft7,ft6
   10ba2:	28d776c3          	fmadd.s	fa3,fa4,fa3,ft5
   10ba6:	20d776c3          	fmadd.s	fa3,fa4,fa3,ft4
   10baa:	18d776c3          	fmadd.s	fa3,fa4,fa3,ft3
   10bae:	10d77753          	fmul.s	fa4,fa4,fa3
   10bb2:	db35                	beqz	a4,10b26 <gelu_ref+0xd8>
   10bb4:	5807774b          	fnmsub.s	fa4,fa4,ft0,fa1
   10bb8:	a1771753          	flt.s	a4,fa4,fs7
   10bbc:	c319                	beqz	a4,10bc2 <gelu_ref+0x174>
   10bbe:	217b8753          	fmv.s	fa4,fs7
   10bc2:	10e57553          	fmul.s	fa0,fa0,fa4
   10bc6:	10167653          	fmul.s	fa2,fa2,ft1
   10bca:	0511                	addi	a0,a0,4
   10bcc:	0591                	addi	a1,a1,4
   10bce:	00b57553          	fadd.s	fa0,fa0,fa1
   10bd2:	10a67653          	fmul.s	fa2,fa2,fa0
   10bd6:	fec5ae27          	fsw	fa2,-4(a1)
   10bda:	f8f51be3          	bne	a0,a5,10b70 <gelu_ref+0x122>
   10bde:	60a6                	ld	ra,72(sp)
   10be0:	6406                	ld	s0,64(sp)
   10be2:	3462                	fld	fs0,56(sp)
   10be4:	34c2                	fld	fs1,48(sp)
   10be6:	3922                	fld	fs2,40(sp)
   10be8:	3982                	fld	fs3,32(sp)
   10bea:	2a62                	fld	fs4,24(sp)
   10bec:	2ac2                	fld	fs5,16(sp)
   10bee:	2b22                	fld	fs6,8(sp)
   10bf0:	2b82                	fld	fs7,0(sp)
   10bf2:	6161                	addi	sp,sp,80
   10bf4:	4501                	li	a0,0
   10bf6:	4581                	li	a1,0
   10bf8:	4601                	li	a2,0
   10bfa:	4701                	li	a4,0
   10bfc:	4781                	li	a5,0
   10bfe:	8082                	ret
   10c00:	4501                	li	a0,0
   10c02:	4581                	li	a1,0
   10c04:	4601                	li	a2,0
   10c06:	4701                	li	a4,0
   10c08:	4781                	li	a5,0
   10c0a:	8082                	ret

0000000000010c0c <dish_rvv>:
   10c0c:	1141                	addi	sp,sp,-16
   10c0e:	e022                	sd	s0,0(sp)
   10c10:	e406                	sd	ra,8(sp)
   10c12:	0800                	addi	s0,sp,16
   10c14:	ce49                	beqz	a2,10cae <dish_rvv+0xa2>
   10c16:	00001797          	auipc	a5,0x1
   10c1a:	40a7a687          	flw	fa3,1034(a5) # 12020 <__DATA_BEGIN__+0x20>
   10c1e:	00001797          	auipc	a5,0x1
   10c22:	40a7a787          	flw	fa5,1034(a5) # 12028 <__DATA_BEGIN__+0x28>
   10c26:	00001797          	auipc	a5,0x1
   10c2a:	4527a707          	flw	fa4,1106(a5) # 12078 <__DATA_BEGIN__+0x78>
   10c2e:	5f3768b7          	lui	a7,0x5f376
   10c32:	9df8889b          	addiw	a7,a7,-1569 # 5f3759df <__global_pointer$+0x5f3631df>
   10c36:	4681                	li	a3,0
   10c38:	4305                	li	t1,1
   10c3a:	00269713          	slli	a4,a3,0x2
   10c3e:	40d607b3          	sub	a5,a2,a3
   10c42:	0087f7d7          	th.vsetvli	a5,a5,e32,m1,d1
   10c46:	00e50833          	add	a6,a0,a4
   10c4a:	02087207          	th.vle.v	v4,(a6)
   10c4e:	972e                	add	a4,a4,a1
   10c50:	96be                	add	a3,a3,a5
   10c52:	92421157          	th.vfmul.vv	v2,v4,v4
   10c56:	0226d157          	th.vfadd.vf	v2,v2,fa3
   10c5a:	00807057          	th.vsetvli	zero,zero,e32,m1,d1
   10c5e:	5e0100d7          	th.vmv.v.v	v1,v2
   10c62:	0087f057          	th.vsetvli	zero,a5,e32,m1,d1
   10c66:	a21340d7          	th.vsrl.vx	v1,v1,t1
   10c6a:	0e18c0d7          	th.vrsub.vx	v1,v1,a7
   10c6e:	921091d7          	th.vfmul.vv	v3,v1,v1
   10c72:	922191d7          	th.vfmul.vv	v3,v2,v3
   10c76:	9237d1d7          	th.vfmul.vf	v3,v3,fa5
   10c7a:	9e3751d7          	th.vfrsub.vf	v3,v3,fa4
   10c7e:	921190d7          	th.vfmul.vv	v1,v1,v3
   10c82:	921091d7          	th.vfmul.vv	v3,v1,v1
   10c86:	92219157          	th.vfmul.vv	v2,v2,v3
   10c8a:	9227d157          	th.vfmul.vf	v2,v2,fa5
   10c8e:	9e275157          	th.vfrsub.vf	v2,v2,fa4
   10c92:	921110d7          	th.vfmul.vv	v1,v1,v2
   10c96:	924090d7          	th.vfmul.vv	v1,v4,v1
   10c9a:	0216d0d7          	th.vfadd.vf	v1,v1,fa3
   10c9e:	9217d0d7          	th.vfmul.vf	v1,v1,fa5
   10ca2:	92409257          	th.vfmul.vv	v4,v4,v1
   10ca6:	02077227          	th.vse.v	v4,(a4)
   10caa:	f8c6e8e3          	bltu	a3,a2,10c3a <dish_rvv+0x2e>
   10cae:	60a2                	ld	ra,8(sp)
   10cb0:	6402                	ld	s0,0(sp)
   10cb2:	0141                	addi	sp,sp,16
   10cb4:	4301                	li	t1,0
   10cb6:	4501                	li	a0,0
   10cb8:	4581                	li	a1,0
   10cba:	4601                	li	a2,0
   10cbc:	4681                	li	a3,0
   10cbe:	4701                	li	a4,0
   10cc0:	4781                	li	a5,0
   10cc2:	4801                	li	a6,0
   10cc4:	4881                	li	a7,0
   10cc6:	8082                	ret

0000000000010cc8 <dish_ref>:
   10cc8:	1141                	addi	sp,sp,-16
   10cca:	e022                	sd	s0,0(sp)
   10ccc:	e406                	sd	ra,8(sp)
   10cce:	0800                	addi	s0,sp,16
   10cd0:	ce25                	beqz	a2,10d48 <dish_ref+0x80>
   10cd2:	00001797          	auipc	a5,0x1
   10cd6:	34e7a507          	flw	fa0,846(a5) # 12020 <__DATA_BEGIN__+0x20>
   10cda:	00001797          	auipc	a5,0x1
   10cde:	34e7a607          	flw	fa2,846(a5) # 12028 <__DATA_BEGIN__+0x28>
   10ce2:	060a                	slli	a2,a2,0x2
   10ce4:	00c507b3          	add	a5,a0,a2
   10ce8:	00052587          	flw	fa1,0(a0)
   10cec:	0511                	addi	a0,a0,4
   10cee:	0591                	addi	a1,a1,4
   10cf0:	50b5f7c3          	fmadd.s	fa5,fa1,fa1,fa0
   10cf4:	18f7f6d3          	fdiv.s	fa3,fa5,fa5
   10cf8:	00f6f6d3          	fadd.s	fa3,fa3,fa5
   10cfc:	10c6f6d3          	fmul.s	fa3,fa3,fa2
   10d00:	18d7f753          	fdiv.s	fa4,fa5,fa3
   10d04:	00d77753          	fadd.s	fa4,fa4,fa3
   10d08:	10c77753          	fmul.s	fa4,fa4,fa2
   10d0c:	18e7f6d3          	fdiv.s	fa3,fa5,fa4
   10d10:	00e6f6d3          	fadd.s	fa3,fa3,fa4
   10d14:	10c6f6d3          	fmul.s	fa3,fa3,fa2
   10d18:	18d7f753          	fdiv.s	fa4,fa5,fa3
   10d1c:	00d77753          	fadd.s	fa4,fa4,fa3
   10d20:	10c77753          	fmul.s	fa4,fa4,fa2
   10d24:	18e7f7d3          	fdiv.s	fa5,fa5,fa4
   10d28:	00e7f7d3          	fadd.s	fa5,fa5,fa4
   10d2c:	10c7f7d3          	fmul.s	fa5,fa5,fa2
   10d30:	18f5f7d3          	fdiv.s	fa5,fa1,fa5
   10d34:	00a7f7d3          	fadd.s	fa5,fa5,fa0
   10d38:	10c7f7d3          	fmul.s	fa5,fa5,fa2
   10d3c:	10b7f7d3          	fmul.s	fa5,fa5,fa1
   10d40:	fef5ae27          	fsw	fa5,-4(a1)
   10d44:	faa792e3          	bne	a5,a0,10ce8 <dish_ref+0x20>
   10d48:	60a2                	ld	ra,8(sp)
   10d4a:	6402                	ld	s0,0(sp)
   10d4c:	0141                	addi	sp,sp,16
   10d4e:	4501                	li	a0,0
   10d50:	4581                	li	a1,0
   10d52:	4601                	li	a2,0
   10d54:	4781                	li	a5,0
   10d56:	8082                	ret
