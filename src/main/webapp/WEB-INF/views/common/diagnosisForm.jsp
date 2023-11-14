	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>



		<style type="text/css">
 			.cdTable {table-layout:fixed; margin-top:0pt; margin-bottom:0pt}
 			 .inline-block {display: inline-block;}
			.cdTd1 { width:180px; table-layout: fixed; }
			.cdTd2 {width: 180px}
		</style>
			<table class="cdTable" cellspacing="0" cellpadding="0" style="border-collapse:collapse">
				<tr style="height:25.5pt">
					<td colspan="8" style="padding:1.4pt 5.1pt; vertical-align:top">
						<p class="a" style="line-height:104%; font-size:9pt">
							<span class="a" style="line-height:104%; font-family:'Arial Unicode MS'; font-size:9pt; letter-spacing:-0.3pt; vertical-align:baseline">■ </span>
							<span class="a" style="line-height:104%; font-family:돋움; font-size:9pt; letter-spacing:-0.3pt; vertical-align:baseline">의료법 시행규칙 [별지 제5호의2서식] </span>
							<span class="a" style="line-height:104%; font-family:돋움; font-size:9pt; letter-spacing:normal; vertical-align:baseline; color:#0000ff">&lt;개정 2019. 9. 27.&gt; </span>
						</p>
					</td>
					<td colspan="2" style="padding:1.4pt 5.1pt; vertical-align:top">
						<p class="a" style="line-height:104%; font-size:8pt">
							<span style="font-family:돋움체; letter-spacing:normal">&#xa0;</span>
						</p>
					</td>
				</tr>
				<tr style="height:29.75pt">
					<td colspan="10" style=" padding:1.4pt 5.1pt; vertical-align:middle">
						<p class="a6" style="text-align: center; line-height:104%; font-size:16pt">
<!-- 진단서 #cdHcrtfPapersClDt(span) -->
							<span id="cdHcrtfPapersClDt" class="a cdInsert1" style="line-height:104%; font-family:HY견고딕; font-size:16pt; font-weight:bold; letter-spacing:-0.4pt; vertical-align:baseline">진  단  서</span>
						</p>
					</td>
				</tr>
				<tr>
					<td colspan="10" style="padding:1.4pt 4.72pt 0pt; ">
							<span class="a" style="font-family:돋움체; letter-spacing:-0.25pt; vertical-align:baseline">등록번호 :</span> 
<!-- 등록 번호 == 환자 번호 cdPatntNo-->		<!-- 등록 번호 == 환자 번호 -->
<!-- 등록번호(환자번호) #cdPatntNoDt(span) -->
							<span id="cdPatntNoDt" class="a cdVal cdInsert1" style="font-family:돋움체; letter-spacing:-0.25pt; vertical-align:baseline"></span>
					</td>
				</tr>
				<tr style="height:20.75pt">
					<td colspan="10" style="padding:0pt 4.72pt; ">
							<span class="a" style="font-family:돋움체; letter-spacing:-0.25pt; vertical-align:baseline">연 번 호 :</span>
<!-- 발행일 불러오기cdYear -->							
<!-- 1. 연번호 (sysdate yyyyMMdd)-서류번호 -->
<!--  연번호 #cdhcrtfDtDt / 서류번호 #cdFileNoDt (둘 다 span)-->
							<span class="a" id="cdhcrtfDtDt" style="font-family:돋움체; letter-spacing:-0.25pt; vertical-align:baseline"></span>-<span id="cdFileNoDt" class="a cdVal" style="font-family:돋움체; letter-spacing:-0.25pt; vertical-align:baseline"></span>
					</td>
				</tr>
				<tr style="height:32.1pt">
					<td class="cdTd1" style="border-top:0.75pt solid #939393; border-right:0.75pt solid #939393; border-bottom:0.75pt solid #939393; padding:1.4pt 4.72pt 1.4pt 5.1pt; vertical-align:middle">
						<p class="a7 " style="text-align:center; line-height:104%; font-size:11pt">
							<span class="a" style="line-height:104%; font-family:돋움체; font-size:11pt; letter-spacing:0.8pt; vertical-align:baseline">환자의 성명</span>
						</p>
					</td>
					<td class="cdTd2" colspan="4" style="border:0.75pt solid #939393; padding:0pt 4.72pt; vertical-align:middle">
						<p class="a" style="line-height:normal; font-size:11pt">
<!-- 2. 환자 이름 -->				<!-- 환자 이름 -->
<!-- 환자 이름 #cdPatntNmDt (span) -->
							<span id="cdPatntNmDt" class="cdVal" style="font-family:돋움체; letter-spacing:-0.25pt"></span>
						</p>
					</td>
					<td colspan="4" style="border:0.75pt solid #939393; padding:1.4pt 4.72pt; vertical-align:middle">
						<p class="a" style="text-align:center; line-height:normal; font-size:11pt">
							<span class="a" style="font-family:돋움체; font-size:11pt; letter-spacing:-0.25pt; vertical-align:baseline">환자의</span>
						</p>
						<p class="a" style="text-align:center; line-height:normal; font-size:11pt">
							<span class="a" style="font-family:돋움체; font-size:11pt; letter-spacing:-0.25pt; vertical-align:baseline">주민등록번호</span>
						</p>
					</td>
					<td style="border-top:0.75pt solid #939393; border-left:0.75pt solid #939393; border-bottom:0.75pt solid #939393; padding:1.4pt 5.1pt 1.4pt 4.72pt; vertical-align:middle">
						<p class="a" style="line-height:normal; font-size:11pt">
<!-- 3. 환자 주민등록번호 -->			<!-- 환자 주민등록번호 -->
<!-- 환자주민등록번호 (합쳐서 넣기 ) #cdPatntRrno (span) -->
							<span id="cdPatntRrno" class="a cdVal" style="line-height:117%; font-family:돋움체; font-size:11pt; letter-spacing:-0.25pt; vertical-align:baseline"></span>
						</p>
					</td>
				</tr>
				<tr style="height:29.8pt">
					<td style="border-top:0.75pt solid #939393; border-right:0.75pt solid #939393; border-bottom:0.75pt solid #939393; padding:1.4pt 4.72pt 1.4pt 5.1pt; vertical-align:middle">
						<p class="a7" style="text-align:center; line-height:104%; font-size:11pt">
							<span class="a" style="line-height:104%; font-family:돋움체; font-size:11pt; letter-spacing:0.8pt; vertical-align:baseline">환자의 주소</span>
						</p>
					</td>
					<td colspan="9" style="font-family:돋움체; :355.15pt; border-top:0.75pt solid #939393; border-left:0.75pt solid #939393; border-bottom:0.75pt solid #939393; padding:1.4pt 5.1pt 1.4pt 4.72pt; vertical-align:top">
						<p class="a" style="text-align:left; line-height:104%; font-size:11pt">
<!-- 4. 환자 주소 --><!-- 5. 우편번호 -->
<!-- 환자주소 #cdPatntAddressDt(span)  우편번호 #cdZipDt (span) -->
							<span id="cdPatntAddress1Dt" class="a cdVal" style="text-align:left; line-height:104%; font-family:돋움체; font-size:11pt">&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0; </span><span> (</span><span id="cdZipDt" class="a cdVal" style="text-align:left; line-height:104%; font-family:돋움체; font-size:11pt">&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;</span>) <br>
<!-- 6. 상세 주소 -->				<!--상세 주소 -->
<!-- 환자상세주소 #cdPatntAddress2Dt (span) -->
							<span id="cdPatntAddress2Dt" class="a cdVal" style="text-align:left; line-height:104%; font-family:돋움체; font-size:11pt"></span>
						</p>
					</td>
				</tr>
				<tr style="height:29.8pt">
					<td style="border-top:0.75pt solid #939393; border-right:0.75pt solid #939393; border-bottom:0.75pt solid #939393; padding:1.4pt 4.72pt 1.4pt 5.1pt; vertical-align:middle">
						<p class="a7" style="text-align:center; line-height:104%; font-size:11pt">
							<span class="a" style="line-height:104%; font-family:돋움체; font-size:11pt; letter-spacing:0.8pt; vertical-align:baseline">환자의 연락처</span>
						</p>
					</td>
					<td colspan="9" style="border-top:0.75pt solid #939393; border-left:0.75pt solid #939393; border-bottom:0.75pt solid #939393; padding:1.4pt 5.1pt 1.4pt 4.72pt; vertical-align:middle">
						<p class="a" style="text-align:left; line-height:normal; font-size:11pt">
<!-- 7. 환자 연락처 -->				<!-- 환자 연락처 -->
<!-- 환자 연락처 #cdPatntTelNoDt (span) -->
							<span id="cdPatntTelNoDt" class="a cdVal" style="line-height:117%; font-family:돋움체; font-size:11pt; letter-spacing:-0.25pt; vertical-align:baseline"></span>
						</p>
					</td>
				</tr>
				<tr style="height:59pt">
					<td style="border-top:0.75pt solid #939393; border-right:0.75pt solid #939393; border-bottom:0.75pt solid #939393; padding:1.4pt 4.72pt 1.4pt 5.1pt; vertical-align:middle">
						<p class="a" style="margin-right:5pt; margin-left:5pt; text-align:center; line-height:normal; font-size:11pt">
							<span class="a" style="font-family:돋움체; font-size:11pt; letter-spacing:-0.25pt; vertical-align:baseline">병 명</span>
						</p>
<!-- 추정 여부(class="paRadio")(input라디오)-><!-- 추정 여부 -->
						<div class="row" style="vertical-align:middle">
							<div class="col-1 p-0" style="vertical-align: middle;">
							</div>
							<div class="col-9 ps-3 text-start">
								<span style="color:black; position: absolute; margin-left: 5px; margin-top:2px; font-family:돋움체; font-size:11pt;" id="prsmpAtNSpan">[ ]</span>
								<input style="position: absolute; margin-top: 6px; margin-left: 10px;" class="paRadio prsmpAtN" type="radio" name="prsmpAt" value="N">
								<span class="a" style="position:relative; margin-left:24px; font-family:돋움체; font-size:11pt; letter-spacing:-0.8pt;">&nbsp;임상적 추정</span>
							</div>
						</div>
						
						<div class="row" style="vertical-align:middle">
							<div class="col-1 p-0" style="vertical-align: middle;">
							</div>
							<div class="col-9 ps-3 text-start">
								<span style="color:black; position: absolute; margin-left: 5px; margin-top: 2px; font-family:돋움체; font-size:11pt;" id="prsmpAtYSpan">[ ]</span>
								<input style="position: absolute; margin-top: 5px; margin-left: 10px;" class="paRadio prsmpAtY" type="radio" name="prsmpAt" value="Y">
								<span class="a" style="position:relative; margin-left:25px; font-family:돋움체; font-size:11pt; letter-spacing:-0.8pt;">&nbsp;최종 진단</span>
							</div>
						</div>
					</td>
					<td colspan="8" style="border:0.75pt solid #939393; padding:1.4pt 4.72pt; vertical-align:middle; width: 380px;">
						<p class="a" style="line-height:117%">
							<span class="a" style="line-height:117%; font-family:돋움체; font-size:11pt; letter-spacing:-0.25pt; vertical-align:baseline">(주 질병ㆍ부상)</span>
						</p>
<!-- 8. 주 상병 -->				<!-- 주 상병 -->
<!-- #cdMainSickDt (한글명, 영문명) (span)-->					
							<span id="cdMainSickDt" class="a cdVal" style="line-height:117%; font-family:돋움체; font-size:11pt; letter-spacing:-0.25pt; vertical-align:baseline;  width: 380px;"></span> <br>
						<p class="a" style="line-height:117%">
							<span class="a" style="line-height:117%; font-family:돋움체; font-size:11pt; letter-spacing:-0.25pt; vertical-align:baseline">(부 질병ㆍ부상)</span>
						</p>
<!-- 9. 부 상병 -->				<!-- 부 상병 -->
<!-- #cdSubSickDt (한글명, 영문명 (span))-->			
							<span id="cdSubSickDt" class="a cdVal" style="line-height:117%; font-family:돋움체; font-size:11pt; letter-spacing:-0.25pt; vertical-align:baseline; width: 380px;"></span> <br>
					</td>
					<td style="border-top:0.75pt solid #939393; border-left:0.75pt solid #939393; border-bottom:0.75pt solid #939393; padding:1.4pt 5.1pt 1.4pt 4.72pt; vertical-align:top">
						<p class="a" style="margin-top:4.2pt; margin-right:3pt; margin-left:3pt; text-align:center; line-height:normal">
							<span class="a" style="line-height:117%; font-family:돋움체; font-size:11pt; letter-spacing:-0.25pt; vertical-align:baseline">[질병분류기호]</span> <br>
<!-- 10. 질병분류기호 -->			<!-- 질병분류기호 -->
<!-- #cdKcdDt (span) -->				
							<span id="cdKcdDt" class="a cdVal" style="line-height:117%; font-family:돋움체; font-size:11pt; letter-spacing:-0.25pt; vertical-align:baseline"></span>
						</p>
					</td>
				</tr>
				<tr style="height:29.8pt">
					<td style="border-top:0.75pt solid #939393; border-right:0.75pt solid #939393; border-bottom:0.75pt solid #939393; padding:1.4pt 4.72pt 1.4pt 5.1pt; vertical-align:middle">
						<p class="a" style="margin-right:5pt; margin-left:5pt; text-align:center; line-height:normal; font-size:11pt">
							<span class="a" style="font-family:돋움체; font-size:11pt; letter-spacing:-0.25pt; vertical-align:baseline">발병 연월일</span>
						</p>
					</td>
					<td colspan="4" style="border:0.75pt solid #939393; padding:1.4pt 4.72pt; vertical-align:middle">
						<p class="a" style="text-align:center">
<!-- 11. 발병일 --> 					<!-- 발병일 -->	
<!-- #cdAtfssDt (span) -->							
							<span id="cdAtfssDt" class="a cdVal" style="line-height:117%; font-family:돋움체; font-size:11pt; letter-spacing:-0.25pt; vertical-align:baseline">&#xa0;&#xa0;&#xa0;&#xa0;년 &#xa0;&#xa0;월 &#xa0;&#xa0;일
							</span>
						</p>
					</td>
					<td colspan="4" style="border:0.75pt solid #939393; padding:1.4pt 4.72pt; vertical-align:middle">
						<p class="a" style="margin-left:5pt; text-indent:-4.8pt; text-align:center; line-height:104%; font-size:11pt">
							<span class="a" style="line-height:104%; font-family:돋움체; font-size:11pt; letter-spacing:-0.25pt; vertical-align:baseline">진단 연월일</span>
						</p>
					</td>
					<td style=" border-top:0.75pt solid #939393; border-left:0.75pt solid #939393; border-bottom:0.75pt solid #939393; padding:1.4pt 5.1pt 1.4pt 4.72pt; vertical-align:middle">
						<p class="a" style="text-align:center;">
<!-- 12. 진단일 -->				<!-- 진단일 -->
<!-- #cdClnicTimeDt(span) -->
							<span id="cdClnicTimeDt" class="a cdVal" style="line-height:117%; font-family:돋움체; font-size:11pt; letter-spacing:-0.25pt; vertical-align:baseline">&#xa0;&#xa0;&#xa0;&#xa0;년 &#xa0;&#xa0;월 &#xa0;&#xa0;일
							</span>
						</p>
					</td>
				</tr>
				<tr style="width: 250px; height:73.85pt">
					<td style="border-top:0.75pt solid #939393; border-right:0.75pt solid #939393; border-bottom:0.75pt solid #939393; padding:1.4pt 4.72pt 1.4pt 5.1pt; vertical-align:middle">
						<p class="a" style="margin-right:5pt; margin-left:5pt; text-align:center; line-height:104%; font-size:11pt">
							<span class="a" style="line-height:104%; font-family:돋움체; font-size:11pt; letter-spacing:-0.25pt; vertical-align:baseline">치료내용 및 향후</span>
						</p>
						<p class="a" style="margin-right:5pt; margin-left:5pt; text-align:center; line-height:104%; font-size:11pt">
							<span class="a" style="line-height:104%; font-family:돋움체; font-size:11pt; letter-spacing:-0.25pt; vertical-align:baseline">치료에 대한 소견</span>
						</p>
					</td>
					<td colspan="9" style="border-top:0.75pt solid #939393; border-left:0.75pt solid #939393; border-bottom:0.75pt solid #939393; padding:1.4pt 5.1pt 1.4pt 4.72pt; vertical-align:middle">
<!-- 						<p class="a" style="line-height:117%; font-size:11pt"> -->
<!-- 13. 검사 날짜, 의사 소견 내용 --><!-- 치료 및 검사 날짜, 의사 소견 내용 -->
<!-- 검사날짜 #hlthchkpDtDt -->
<!-- 검사 테이블 tbody #cdMEOTable -->
							<table style="width: 550px; padding:0px; margin: 0px; color: black; font-family:돋움체; font-size:11pt;">
								<tbody id="cdMEOTable">
								</tbody>
<!-- 치료 테이블 tbody #cdMTRTable -->
								<tbody id="cdMTRTable">
								
								</tbody>
<!-- 의사 소견 #cdDocNoteDt -->
								<tr>
									<td colspan="3">
										<span id="cdDocNoteDtSpan" class="col-3 a " style="line-height:117%; font-family:돋움체; font-size:11pt; letter-spacing:-0.25pt; vertical-align:baseline"></span>
										<textarea style="color: black; font-family:돋움체; font-size:11pt; " id="cdDocNoteDtTa" rows="5" cols="65"></textarea> 
									</td> 
								</tr>
							</table>
<!-- 							<div> -->
<!-- 								<div class="inline-block"> -->
<!-- 									<span id="hlthchkpDtDt" class="col-3 a cdVal" style="line-height:117%; font-family:돋움체; font-size:11pt; letter-spacing:-0.25pt; vertical-align:baseline"></span> -->
<!-- 								</div> -->
<!--  14. 검사명 -->
<!-- 								<div class="inline-block"> -->
<!-- 									<span class="col-3 a cdVal" style="line-height:117%; font-family:돋움체; font-size:11pt; letter-spacing:-0.25pt; vertical-align:baseline"></span> -->
<!-- 								</div> -->
<!-- 15. 검사 결과 --> 
<!-- 								<div class="inline-block"> -->
<!-- 									<span class="col-4 a cdVal" style="line-height:117%; font-family:돋움체; font-size:11pt; letter-spacing:-0.25pt; vertical-align:baseline"></span> -->
<!-- 								</div> -->
								
<!-- 							</div> -->
<!-- 							<div> -->
<!-- 								<div class="inline-block"> -->
<!-- 16. 치료 날짜 -->	
<!-- 									<span class="a cdVal" style="line-height:117%; font-family:돋움체; font-size:11pt; letter-spacing:-0.25pt; vertical-align:baseline"></span> -->
<!-- 								</div> -->
<!-- 								<div class="inline-block"> -->
<!-- 17. 치료 명 -->	
<!-- 									<span class="a cdVal" style="line-height:117%; font-family:돋움체; font-size:11pt; letter-spacing:-0.25pt; vertical-align:baseline"></span> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 의사소견 .cdInsert1(2) .cdDocNote -->
<!-- 							<textarea class="a cdDocNote cdInsert1" style="line-height:117%; font-family:돋움체; font-size:11pt; letter-spacing:-0.25pt; vertical-align:baseline" rows="5" cols="65"></textarea> -->
<!-- 						</p> -->
					</td>
				</tr>
				<tr style="height:29.85pt">
					<td style="border-top:0.75pt solid #939393; border-right:0.75pt solid #939393; border-bottom:0.75pt solid #939393; padding:1.4pt 4.72pt 1.4pt 5.1pt; vertical-align:middle">
						<p class="a" style="margin-right:5pt; margin-left:5pt; text-align:center; line-height:104%; font-size:11pt">
							<span class="a" style="line-height:104%; font-family:돋움체; font-size:11pt; letter-spacing:-0.25pt; vertical-align:baseline">입원ㆍ퇴원</span>
						</p>
						<p class="a" style="margin-right:5pt; margin-left:5pt; text-align:center; line-height:104%; font-size:11pt">
							<span class="a" style="line-height:104%; font-family:돋움체; font-size:11pt; letter-spacing:-0.25pt; vertical-align:baseline">연월일</span>
						</p>
					</td>
					<td colspan="5" style="border:0.75pt solid #939393; padding:1.4pt 4.72pt; vertical-align:middle">
						<p class="a" style="line-height:117%; font-size:11pt">
							<span class="a" style="line-height:117%; font-family:돋움체; font-size:11pt; letter-spacing:-0.25pt; vertical-align:baseline">&#xa0;입원일:&#xa0;</span>
<!-- 18. 입원일 #cdHsptlzDeDt -->				<!-- 입원일 -->							
							<span class="a cdVal" id="cdHsptlzDeDt" style="line-height:117%; font-family:돋움체; font-size:11pt; letter-spacing:-0.25pt; vertical-align:baseline">&#xa0;&#xa0;&#xa0;&#xa0;년 &#xa0;&#xa0;월 &#xa0;&#xa0;일
							</span>
							<span class="a" style="line-height:117%; font-family:돋움체; font-size:11pt; letter-spacing:-0.25pt; vertical-align:baseline">부터&#xa0; </span>
						</p>
					</td>
					<td colspan="4" style="border-top:0.75pt solid #939393; border-left:0.75pt solid #939393; border-bottom:0.75pt solid #939393; padding:1.4pt 5.1pt 1.4pt 4.72pt; vertical-align:middle">
						<p class="a" style="line-height:117%; font-size:11pt">
							<span class="a" style="line-height:117%; font-family:돋움체; font-size:11pt; letter-spacing:-0.25pt; vertical-align:baseline">&#xa0;퇴원일:&#xa0;</span>
<!-- 19. 퇴원일 #cdRealLhstlDt -->				<!-- 퇴원일 -->					
							<span class="a cdVal" id="cdRealLhstlDt" style="line-height:117%; font-family:돋움체; font-size:11pt; letter-spacing:-0.25pt; vertical-align:baseline">&#xa0;&#xa0;&#xa0;&#xa0;년 &#xa0;&#xa0;월 &#xa0;&#xa0;일
							</span>
						</p>
					</td>
				</tr>
				<tr style="height:27pt">
					<td style="border-top:0.75pt solid #939393; border-right:0.75pt solid #939393; border-bottom:0.75pt solid #939393; padding:1.4pt 4.72pt 1.4pt 5.1pt; vertical-align:middle">
						<p class="a" style="margin-right:2.5pt; margin-left:2.5pt; text-align:center; line-height:104%; font-size:11pt">
							<span class="a" style="line-height:104%; font-family:돋움체; font-size:11pt; letter-spacing:-0.25pt; vertical-align:baseline">용&#xa0;&#xa0; 도</span>
						</p>
					</td>
					<td colspan="9" style="border-top:0.75pt solid #939393; border-left:0.75pt solid #939393; border-bottom:0.75pt solid #939393; padding:1.4pt 5.1pt 1.4pt 4.72pt; vertical-align:middle">
						<p class="a" style="margin-right:2.5pt; margin-left:2.5pt; line-height:104%; font-size:11pt">
<!-- 20. 용도 cdInsert2 #cdHcrtfPrposDt -->	<!-- 용도 -->
							<textarea style="color: black; font-family:돋움체; font-size:11pt; " id="cdHcrtfPrposDtTa" rows="1" cols="65"></textarea>
							<span class="a cdVal cdInsert2" id="cdHcrtfPrposDt" style="line-height:117%; font-family:돋움체; font-size:11pt; letter-spacing:-0.25pt; vertical-align:baseline"></span>
						</p>
					</td>
				</tr>
				<tr style="height:27pt">
					<td style="border-top:0.75pt solid #939393; border-right:0.75pt solid #939393; border-bottom:0.75pt solid #939393; padding:1.4pt 4.72pt 1.4pt 5.1pt; vertical-align:middle">
						<p class="a" style="margin-right:2.5pt; margin-left:2.5pt; text-align:center; line-height:104%; font-size:11pt">
							<span class="a" style="line-height:104%; font-family:돋움체; font-size:11pt; letter-spacing:-0.25pt; vertical-align:baseline">비&#xa0;&#xa0; 고</span>
						</p>
					</td>
					<td colspan="9" style="border-top:0.75pt solid #939393; border-left:0.75pt solid #939393; border-bottom:0.75pt solid #939393; padding:1.4pt 5.1pt 1.4pt 4.72pt; vertical-align:middle">
						<p class="a" style="margin-right:2.5pt; margin-left:2.5pt; line-height:104%; font-size:11pt">
<!-- 21. 비고  cdInsert2 #cdHcrtfRmDt-->	<!-- 비고 -->
							<textarea style="color: black; font-family:돋움체; font-size:11pt; " id="cdHcrtfRmDtTa" rows="1" cols="65"></textarea>
							<span class="a cdVal cdInsert2" id="cdHcrtfRmDt" style="line-height:117%; font-family:돋움체; font-size:11pt; letter-spacing:-0.25pt; vertical-align:baseline"></span>
						</p>
					</td>
				</tr>
				<tr style="height:27.35pt">
					<td colspan="10" style="border-top:0.75pt solid #939393; padding:1.4pt 5.1pt; vertical-align:middle">
						<p class="a">
							<span class="a" style="font-family:돋움체; letter-spacing:normal; vertical-align:baseline">&#xa0;</span><span class="a" style="font-family:돋움체; letter-spacing:normal; vertical-align:baseline">「의료법」 제17조 및 같은 법 시행규칙 제9조제1항에 따라 위와 같이 진단합니다. </span>
						</p>
					</td>
				</tr>
				<tr style="height:21.3pt">
					<td colspan="10" style="padding:1.4pt 5.1pt; vertical-align:middle">
						<p class="a" style="margin-right:7.5pt; margin-left:7.5pt; text-align:center; line-height:normal; font-size:9pt">
<!-- 발행일시 .cdInsert2 #cdHcrtfDtDt2-->		<!-- 발행일시 -->
							<span class="a cdInsert2" id="cdHcrtfDtDt2" style="font-family:돋움체; font-size:9pt; letter-spacing:normal; vertical-align:baseline">
							</span>
						</p>
					</td>
				</tr>
				<tr style="height:21.3pt">
					<td colspan="5" style="vertical-align:middle">
						<p class="a" style="text-align:right; line-height:normal">
							<span class="a" style="font-family:돋움체; letter-spacing:normal; vertical-align:baseline">의료기관 명칭:</span>
						</p>
					</td>
					<td colspan="5" style="vertical-align:middle">
						<p class="a" style="text-align:left; line-height:normal">
							<span class="a" style="font-family:돋움체; letter-spacing:normal; vertical-align:baseline">&#xa0;메디폼 재활전문 병원</span>
						</p>
					</td>
				</tr>
				<tr style="height:21.3pt">
					<td colspan="5" style="vertical-align:middle">
						<p class="a" style="text-align:right; line-height:normal">
							<span class="a" style="font-family:돋움체; letter-spacing:normal; vertical-align:baseline">주소:</span>
						</p>
					</td>
					<td colspan="5" style="vertical-align:middle">
						<p class="a" style="text-align:left; line-height:normal">
							<span class="a" style="font-family:돋움체; letter-spacing:normal; vertical-align:baseline">&#xa0;대전광역시 중구 계룡로 846 (오류동 175-13)</span>
						</p>
					</td>
				</tr>
				<tr style="height:21.3pt; margin-bottom:21.3pt">
					<td colspan="5" style="vertical-align:middle">
						<p class="a" style="text-align:right; line-height:normal">
							<span class="a" style="font-family:돋움체; letter-spacing:normal; vertical-align:baseline">재활전문의 면허번호:</span>
						</p>
					</td>
					<td colspan="5" style=" vertical-align:middle">
						<p class="a" style="text-align:left; line-height:normal">
<!-- 22. 전문의면허번호  #cdEmpDoctrLcnsNoDt -->			<!-- 전문의면허번호 -->
							<span class="a cdVal" id="cdEmpDoctrLcnsNoDt" style="font-family:돋움체; letter-spacing:normal; vertical-align:baseline">&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;</span>
							<span class="a" style="line-height:143%; font-family:돋움체; letter-spacing:normal; vertical-align:baseline">&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;성 명:</span>
<!-- 23. 담당 의사 이름 #cdEmpNmDt --><!-- 현재 로그인 된 의사 이름  -->						
							<span class="a cdVal" id="cdEmpNmDt" style="line-height:143%; font-family:돋움체; letter-spacing:normal; vertical-align:baseline">&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;</span>
							<span class="a" style="line-height:143%; font-family:돋움체; font-size:9pt; letter-spacing:normal; vertical-align:baseline; color:#787878 ">(서명 또는 인)</span>
						</p>
					</td>
				</tr>
				<tr style="height:3pt">
					<td colspan="10" style="border-top:1.88pt solid #939393; border-bottom:1.88pt solid #939393; padding:1.4pt 5.1pt; vertical-align:middle">
						<p class="a" style="text-align:center; line-height:104%; font-size:3pt">
							<span style="letter-spacing:normal">&#xa0;</span>
						</p>
					</td>
				</tr>
				<tr style="height:17.05pt">
					<td colspan="10" style="border-top:1.88pt solid #939393; border-bottom:0.75pt solid #5d5d5d; padding:1.4pt; vertical-align:middle; background-color:#bbbbbb">
						<p class="a" style="text-align:center; line-height:normal">
							<span class="a" style="font-family:돋움; font-weight:bold; letter-spacing:-0.35pt; vertical-align:baseline">작 성 방 법</span>
						</p>
					</td>
				</tr>
				<tr style="height:58.8pt">
					<td colspan="10" style="border-bottom:0.75pt solid #939393; padding:1.4pt 5.1pt; vertical-align:middle">
						<p class="a" style="margin-left:6.8pt; text-indent:-6.8pt; font-size:8pt">
							<span class="a" style="font-family:돋움체; font-size:8pt; letter-spacing:-0.4pt; vertical-align:baseline">1. </span><span class="a" style="font-family:돋움체; font-size:8pt; letter-spacing:-0.45pt; vertical-align:baseline">환자의 인적사항은 진찰한 의사, 치과의사 또는 한의사가 주민등록증, 기간 만료 전 여권, 운전면허증, 공무원증, 국립</span><span class="a" style="font-size:8pt; letter-spacing:-0.45pt; vertical-align:baseline">ㆍ</span><span class="a" style="font-family:돋움체; font-size:8pt; letter-spacing:-0.45pt; vertical-align:baseline">공립대학 학생증, 군무원증, 건강보험증, 외국인등록증</span><span class="a" style="font-family:돋움체; font-size:8pt; letter-spacing:-0.4pt; vertical-align:baseline"> 등 국가공인 신분증(환자가 미성년자인 경우에는 주민등록등본ㆍ초본, 학생증 등으로 대체 가능합니다)과 대조하여 확인하고 서명 또는 날인합니다.</span>
						</p>
						<p class="a" style="margin-left:7pt; text-indent:-7pt; font-size:8pt">
							<span class="a" style="font-family:돋움체; font-size:8pt; letter-spacing:-0.25pt; vertical-align:baseline">2. </span><span class="a" style="font-family:돋움체; font-size:8pt; letter-spacing:-0.3pt; vertical-align:baseline">"병명"란에는 <a id="trial96074" href="https://documentconverter.pro/" title="Converted with Doc Converter Pro trial">TRIAL</a> 추정"과 "최종진단" 중 택일하여 [ ]에  </span><span class="a" style="font-family:'Arial Unicode MS'; font-size:8pt; letter-spacing:-0.3pt; vertical-align:baseline">√ </span><span class="a" style="font-family:돋움체; font-size:8pt; letter-spacing:-0.3pt; vertical-align:baseline">표시를 하고, 질병명은 한글로 적되 영어로 적을 경우에는 한글을 함께 적으며, 질병분류기호</span><span class="a" style="font-family:돋움체; font-size:8pt; letter-spacing:-0.25pt; vertical-align:baseline">도 함께 적습니다.</span>
						</p>
					</td>
				</tr>
				<tr style="height:17.55pt">
					<td colspan="10" style="border-top:0.75pt solid #939393; padding:1.4pt 5.1pt; vertical-align:bottom">
						<p class="a" style="text-align:right; line-height:104%; font-size:8pt">
							<span class="a" style="line-height:104%; font-family:돋움체; font-size:8pt; letter-spacing:normal; vertical-align:baseline">210mm</span><span class="a" style="line-height:104%; font-family:'Arial Unicode MS'; font-size:8pt; letter-spacing:normal; vertical-align:baseline">×</span><span class="a" style="line-height:104%; font-family:돋움체; font-size:8pt; letter-spacing:normal; vertical-align:baseline">297mm[백상지 80g/㎡]</span>
						</p>
					</td>
				</tr>
			</table>
			<p class="a" style="line-height:104%; font-size:8pt">&#xa0;
<!-- 접수 번호 #cdRceptNoDt cdInsert1(3) -->				
				<span class="cdInsert1" id="cdRceptNoDt" style="font-family:돋움체; letter-spacing:normal; display: none;"></span>
<!-- 진료 번호 #cdClnicNoDt cdInsert1(4) -->
				<span class="cdInsert1" id="cdClnicNoDt" style="font-family:돋움체; display: none;"></span>
			</p>

<script type="text/javascript">
$(function(){

	

	
});
	
</script>