<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="data" class="java.util.Date" />
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="shortcut icon" type="image/x-icon" href="${contextPath}/resources/images/favicon.ico">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		var data = google.visualization.arrayToDataTable([
				[ 'Mes', 'Qtd. planejado', 'Qtd. realizado' ],
				[ 'FEV', 5000, 4500 ],
				[ 'MARC', 6000, 6100 ], [ 'ABR', 7000, 540 ] ]);

		var options = {
			title : 'Total de planejado x realizado',
			curveType : 'function',
			legend : {
				position : 'bottom'
			}
		};

		var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

		chart.draw(data, options);
	}
</script>
</head>
<body>
	<!-- para start do loading com imagem -->
	<div id="id01" class="loading-modal" style="display: none;"></div>
	<div class="content-wrapper" style="min-height: 844.875px;">
		<div class="page-container flex h-full md:min-h-screen flex-col bg-page ">
			<div class="min-h-screen md:h-screen flex flex-row">
				<jsp:include page="menu.jsp" />
				<div class="flex-1 bg-background flex flex-col overflow-x-hidden overflow-y-auto">
					<div class="flex flex-row py-3 px-8 md:p-8 items-center">
						<div class="flex-1 flex flex-col text-sm pl-10 md:pl-0">
							<b class="text-lg text-font-primary">Dashboard</b><span
								class="text-gray-600">See the main indicators</span>
						</div>
				<jsp:include page="exit.jsp" />		
					</div>
					<div class="px-8 mt-8 h-full pb-14 md:pb-0">
						<div class="mb-5 md:mb-5">
							<div class="mt-5 grid md:grid-cols-3 grid-cols-1 md:gap-5">
								<div class=" grid grid-cols-1 col-span-2">
									<div class="mt-5">
										<div
											class="bg-white rounded-lg p-6 shadow-lg h-96 md:h-full relative">
											<div class="recharts-responsive-container" width="1012"
												height="373.046875" style="width: 100%; height: 90%;"
												id="curve_chart"></div>
										</div>
									</div>
								</div>
									<div class="grid md:grid-cols-2 grid-cols-1 gap-5 mt-5 md:mt-0">
										<div class="cursor-pointer flex flex-col items-center justify-center rounded-lg bg-blue-light p-5 relative">
											<div class="flex flex-row items-center gap-2">
												<svg stroke="currentColor" fill="none" stroke-width="2"
													viewBox="0 0 24 24" stroke-linecap="round"
													stroke-linejoin="round" class="text-lg text-white"
													height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
													<polyline points="13 17 18 12 13 7"></polyline>
													<polyline points="6 17 11 12 6 7"></polyline>
												</svg>
												<label class="text-white text-lg font-bold">Total products</label>
											</div>
											<span class="text-white font-bold text-lg">${qtdProduct}</span>
										</div>
										<div class="cursor-pointer flex flex-col items-center justify-center rounded-lg bg-blue-light p-5 relative">
											<div class="flex flex-row items-center gap-2">
												<svg stroke="currentColor" fill="none" stroke-width="2"
													viewBox="0 0 24 24" stroke-linecap="round"
													stroke-linejoin="round" class="text-lg text-white"
													height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
													<polyline points="13 17 18 12 13 7"></polyline>
													<polyline points="6 17 11 12 6 7"></polyline>
												</svg>
												<label class="text-white text-lg font-bold">Total categories</label>
											</div>
											<span class="text-white font-bold text-lg">${qtdCategory}</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>
