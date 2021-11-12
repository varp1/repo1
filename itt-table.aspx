<!DOCTYPE html>
<%@ Page language="C#" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<html lang=en xmlns:mso=urn:schemas-microsoft-com:office:office xmlns:msdt=uuid:C2F41010-65B3-11d1-A29F-00AA00C14882>
	<head>
<meta name="WebPartPageExpansion" content="full" />
<meta charset=utf-8>
		<meta name=viewport content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>CTM</title>
		<script type=text/javascript src=https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js></script>
		<script type=text/javascript src=//ajax.aspnetcdn.com/ajax/4.0/1/MicrosoftAjax.js></script>
		<script type=text/javascript src=_layouts/15/sp.runtime.js></script>
		<script type=text/javascript src=_layouts/15/sp.js></script>
		<script type=text/javascript src=https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.js></script>
		<script type=text/javascript src=https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@0.7.0></script>
		<script type=text/javascript src=https://cdn.jsdelivr.net/npm/chartjs-plugin-style@0.5.0></script>
      	<script type="text/javascript" src="/SitePages/customer-transaction-monitoring/js/side_nav.js"></script>
		<script type="text/javascript" src="/SitePages/customer-transaction-monitoring/js/footer.js"></script>
		<!-- <script type=text/javascript src=/SiteAssets/customer.monitoring.js></script> -->
		<script type=text/javascript src=/SitePages/customer-transaction-monitoring/pages/tables/itt_worker.js></script>
		<link rel=stylesheet href=../../vendors/ti-icons/css/themify-icons.css>
		<link rel=stylesheet href=../../vendors/base/vendor.bundle.base.css>
		<link rel=stylesheet href=../../css/style.css>
		<link rel="stylesheet" href="/SitePages/customer-transaction-monitoring/css/id_image.css">
      	<link rel="stylesheet" href="/SitePages/customer-transaction-monitoring/css/modal_styles.css">
		<link rel=icon type=image/png href=https://www.bsp.com.pg/content/favicons/bsp/favicon-196x196.png sizes=196x196>
		<!--[if gte mso 9]>
		<SharePoint:CTFieldRefs runat=server Prefix=mso: FieldList=FileLeafRef,WikiField,_dlc_DocId,_dlc_DocIdUrl,_dlc_DocIdPersistId>
			<xml>
				<mso:CustomDocumentProperties>
					<mso:_dlc_DocId msdt:dt=string>72YHECWJYS3C-384571580-709</mso:_dlc_DocId>
					<mso:_dlc_DocIdItemGuid msdt:dt=string>b4f5756c-e7f8-4371-9dd6-23041b230d51</mso:_dlc_DocIdItemGuid>
					<mso:_dlc_DocIdUrl msdt:dt=string>http://digital.bsp.pg.internal/_layouts/15/DocIdRedir.aspx?ID=72YHECWJYS3C-384571580-709, 72YHECWJYS3C-384571580-709</mso:_dlc_DocIdUrl>
				</mso:CustomDocumentProperties>
			</xml>
		</SharePoint:CTFieldRefs>
		<![endif]-->
		</head>
	<body>
	  <div id="imageModal" class="imageModal">
		  <span class="imgClose">&times;</span>
		  <img class="imageModal-content" id="img01">
		  <div id="imgCaption"></div>
	  </div>
      <div id=msie class=container-scroller>
         <h1 style=left:50%;top:40%;transform:translate(-50%,-50%)>This Site is not responsive to Internet Explorer. Please open in another Browser!</h1>
      </div>
      <div class=modal>
         <h1 id=result style=position:absolute;left:50%;top:65%;transform:translate(-50%,-50%)></h1>
         <h1 style=position:absolute;left:50%;top:30%;transform:translate(-50%,-50%)>International Money Transfer</h1>
         <h3 style=position:absolute;left:50%;top:40%;transform:translate(-50%,-50%)></h3>
         <label style=position:absolute;left:50%;top:50%;transform:translate(-50%,-50%)>Please wait...</label>
         <progress id=progress max=100 style=display:none;position:absolute;left:50%;top:55%;transform:translate(-50%,-50%)> 32% </progress>
      </div>
		<div id=chrome class=container-scroller style=display:none>
		<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
			<div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
				<a class="navbar-brand brand-logo mr-5" href=../../index.aspx data-pjax-state><img src=../../images/2021-07-15_094415.png class=mr-2 alt="BSP Logo"></a>
				<a class="navbar-brand brand-logo-mini" href=../../index.aspx><img src=../../images/2021-07-15_094415.png alt="logo"/></a>
			</div>
			<div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
				<button class="navbar-toggler navbar-toggler align-self-center" type=button data-toggle=minimize>
				<span class=ti-view-list></span>
				</button>
				<ul class="navbar-nav mr-lg-2">
					<li class="nav-item nav-search d-none d-lg-block">
						<div class=input-group>
							<div class="input-group-prepend hover-cursor" id=navbar-search-icon>
								<span class=input-group-text id=search>
								<i class=ti-search></i>
								<input type=text class=form-control id=navbar-search-input placeholder=Search aria-label=search aria-describedby=search>
								</span>
							</div>
						</div>
					</li>
				</ul>
				<ul class="navbar-nav navbar-nav-right">					
					<li class="nav-item nav-profile dropdown">
						<a class="nav-link dropdown-toggle" href=#>
							<h2></h2>
						</a>
					</li>
				</ul>
				<button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type=button data-toggle=offcanvas>
				<span class=ti-view-list></span>
				</button>
			</div>
		</nav>
		<div class="container-fluid page-body-wrapper">
            <script type="text/javascript">
				writeHTMLSideNavasJS();
			</script>
			<div class=main-panel>
			<div class=content-wrapper>
				<form id=form1 runat=server>
					<asp:ScriptManager runat=server id=ScriptManager></asp:ScriptManager>
						<div class=maps style=display:none>
						<asp:SqlDataSource runat=server ConnectionString="Data Source=PMSP13SQL0101;User ID=ORMUser;Password=ORMUser2018;Initial Catalog=ORMPROD;" ProviderName=System.Data.SqlClient SelectCommand="
									SELECT 
									[MessageQueueId],[MessageFlow],[MessageType],[TRN],[DealDate],[ValueDate],[SwiftCurrency],[Amount],[LocalAmount],[MarketRate],[BookingNumber],[StatusName],[CreatedOn],[ModifiedOn]
									,[BankCurrency],[FeeRate],[FeeAmount],[OrganisationName],[InstitutionIdentity],[ModifiedBy],[CounterParty],[CustomerAccountNumber],[CustomerName],[OURRef],[Remitter],[BeneficiaryName],[NetAmount]
									,[RemittanceInformation70],[BranchCode] 
									FROM [MAPS_TXT] 
									where [CustomerAccountNumber] = @name 
									AND MessageFlow = 'IN'
									AND NetAmount IS NOT NULL
									AND StatusName = 'Transaction Complete'
									order by PK desc" ID=SqlDataSource1 __designer:customcommand=true>
						<SelectParameters>
							<asp:controlparameter Name=name ControlID=CustomerId DefaultValue />
						</SelectParameters>
						</asp:SqlDataSource>
						<asp:GridView id=grd_2 DataSourceID=SqlDataSource1 runat=server></asp:GridView>
					</div>
					<div style=display:none>
						<asp:TextBox ID=CustomerId Text runat=server></asp:TextBox>
						<asp:Button ID=SearchId Text=Search runat=server></asp:Button>
					</div>	
					<div style=display:none>
						<asp:SqlDataSource 
							runat=server 
							ConnectionString="Data Source=PMSP13SQL0101;User ID=ORMUser;Password=ORMUser2018;Initial Catalog=ORMPROD;" 
							ProviderName=System.Data.SqlClient 
							SelectCommand="
									SELECT 
									DISTINCT 
									C.MessageQueueId, C.MessageFlow, C.MessageType, C.TRN, C.DealDate, C.ValueDate, C.SwiftCurrency, C.Amount, C.LocalAmount, c.MarketRate, C.BookingNumber,
									C.StatusName, C.CreatedOn, C.ModifiedOn, C.BankCurrency, C.FeeRate, C.FeeAmount, C.OrganisationName, C.InstitutionIdentity, C.ModifiedBy, C.CounterParty, 
									C.CustomerAccountNumber, C.CustomerName, C.OURRef, C.Remitter, C.BeneficiaryName, C.NetAmount, C.RemittanceInformation70, C.BranchCode
									FROM RetailCIFAccount A
									inner join MAPS_TXT C on C.CustomerAccountNumber = A.AccountNbr_T
									where A.CIFNbr = @name
									AND C.MessageFlow = 'IN'
									AND C.NetAmount IS NOT NULL
									AND C.StatusName = 'Transaction Complete'
									order by C.MessageQueueId desc" ID=SqlDataSource8 __designer:customcommand=true>
								<SelectParameters>
								<asp:controlparameter Name=name ControlID=CustomerId DefaultValue />
								</SelectParameters>
							</asp:SqlDataSource>
							<asp:GridView id=grd_8 DataSourceID=SqlDataSource8 runat=server></asp:GridView>
						</div>
					</form>
					<div class=row>
						<div class="col-md-12 grid-margin">
							<div class="d-flex justify-content-between align-items-center">
								<div>
									<h4 class="mb-0 text-primary">Inward</h4>
								</div>
								<div>
									<button type=button id=refBtn class="btn btn-primary btn-icon-text btn-rounded">
									<i class="ti-reload btn-icon-prepend"></i>Reload
									</button>
								</div>
							</div>
						</div>
					</div>
					<div class=row>
						<div class="col-lg-12 grid-margin stretch-card">
							<div class=card>
								<div class=card-body>
									<h4 class=card-title>2021</h4>
									<div class=table-responsive>
										<table class=table id=maps-table21>
											<thead>
												<tr>
													<th>MQ</th>
													<th>TRN</th>
													<th>DATE</th>
													<th>CUR</th>
													<th>VAL</th>
													<th>PGK</th>
													<th>STATUS</th>
													<th>FEE</th>
													<th>INST</th>
													<th>CPTY</th>
													<th>ACC</th>
													<th>REMITTER</th>
													<!-- <th>BEN</th> -->
													<th>NET</th>
													<th>F70</th>
													<th>BRC</th>
												</tr>
											</thead>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 grid-margin stretch-card">
							<div class=card>
								<div class=card-body>
									<h4 class=card-title>2020</h4>
									<div class=table-responsive>
										<table class=table id=maps-table>
											<thead>
												<tr>
													<th>MQ</th>
													<th>TRN</th>
													<th>DATE</th>
													<th>CUR</th>
													<th>VAL</th>
													<th>PGK</th>
													<th>STATUS</th>
													<th>FEE</th>
													<th>INST</th>
													<th>CPTY</th>
													<th>ACC</th>
													<th>REMITTER</th>
													<!-- <th>BEN</th> -->
													<th>NET</th>
													<th>F70</th>
													<th>BRC</th>
												</tr>
											</thead>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 grid-margin stretch-card">
							<div class=card>
								<div class=card-body>
									<h4 class=card-title>2019</h4>
									<div class=table-responsive>
										<table class=table id=maps-table19>
											<thead>
												<tr>
													<th>MQ</th>
													<th>TRN</th>
													<th>DATE</th>
													<th>CUR</th>
													<th>VAL</th>
													<th>PGK</th>
													<th>STATUS</th>
													<th>FEE</th>
													<th>INST</th>
													<th>CPTY</th>
													<th>ACC</th>
													<th>REMITTER</th>
													<!-- <th>BEN</th> -->
													<th>NET</th>
													<th>F70</th>
													<th>BRC</th>
												</tr>
											</thead>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 grid-margin stretch-card">
							<div class=card>
								<div class=card-body>
									<h4 class=card-title>2018</h4>
									<div class=table-responsive>
										<table class=table id=maps-table18>
											<thead>
												<tr>
													<th>MQ</th>
													<th>TRN</th>
													<th>DATE</th>
													<th>CUR</th>
													<th>VAL</th>
													<th>PGK</th>
													<th>STATUS</th>
													<th>FEE</th>
													<th>INST</th>
													<th>CPTY</th>
													<th>ACC</th>
													<th>REMITTER</th>
													<!-- <th>BEN</th> -->
													<th>NET</th>
													<th>F70</th>
													<th>BRC</th>
												</tr>
											</thead>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<script type="text/javascript">
					writeHTMLFooterasJS();
				</script>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="/SitePages/customer-transaction-monitoring/js/id_modal.js"></script>
	<script type="text/javascript"  src=../../vendors/base/vendor.bundle.base.js></script>
	<script type="text/javascript"  src=../../js/off-canvas.js></script>
	<script type="text/javascript"  src=../../js/hoverable-collapse.js></script>
	<script type="text/javascript"  src=../../js/template.js></script>
	<script type="text/javascript"  src=../../js/todolist.js></script>
	<script type=text/javascript>
		if (navigator.userAgent.match(/msie/i) || navigator.userAgent.match(/trident/i)) {
		    var x = document.getElementById("msie");
		    x.style.display = "block"
		} else {
		    var x = document.getElementById("chrome");
		    unfade(x)
		}
		
		function unfade(a) {
		    var c = 0.1;
		    a.style.display = "block";
		    var b = setInterval(function() {
		        if (c >= 1) {
		            clearInterval(b)
		        }
		        a.style.opacity = c;
		        a.style.filter = "alpha(opacity=" + c * 500 + ")";
		        c += c * 0.1
		    }, 50)
		}
		var w;
		
		function checkWorker() {
		    if (typeof(w) != "undefined") {
		        stopWorker()
		    }
		}
		
		function startWorker() {
		    if (typeof(Worker) !== "undefined") {
		        if (typeof(w) == "undefined") {
		            w = new Worker("itt_worker.js")
		        }
		        w.onmessage = function(a) {
		            if (a.data <= 100) {
		                document.getElementById("result").innerHTML = a.data + "%";
		                document.getElementById("progress").value = a.data
		            }
		        }
		    } else {
		        document.getElementById("result").innerHTML = "Sorry, your browser does not support Web Workers..."
		    }
		}
		
		function stopWorker() {
		    w.terminate();
		    w = undefined;
		    console.log("worker stopped")
		}
		if (typeof(Worker) !== "undefined") {} else {}
		
		function checkFileExist(a) {
		    var b = new XMLHttpRequest();
		    b.open("HEAD", a, false);
		    b.send();
		    if (b.status == "404") {
		        return false
		    } else {
		        return true
		    }
		}

		$(document).ready(function() {			
			        
			$("#tt").addClass("text-primary");
			$("#itt").addClass("text-danger");
			//$("#ott").addClass("text-primary");
			$("#tt").trigger("click");


			
		    (function() {
		        var a = "f634e2fe7467146eb";
		        var c = document.createElement("script");
		        c.type = "text/javascript";
		        c.async = true;
		        c.src = (document.location.protocol == "https:" ? "https:" : "http:") + "//cse.google.com/cse.js?cx=" + a;
		        var b = document.getElementsByTagName("script")[0];
		        b.parentNode.insertBefore(c, b)
		    })();
		    $("#web_results").click(function() {
		        $(".gsc-search-button").trigger("click")
		    });
		    setTimeout(function() {
		        var a = document.getElementById("gsc-i-id1");
		        $("#gsc-i-id1").val(sessionStorage.getItem('cif_name').replace("&amp;", "&"));
		        $("#gsc-i-id2").val("amp updates")
		    }, 1000);		
			
	        $("h2").text(sessionStorage.getItem("account"));
			
		    if (checkFileExist("http://digital.bsp.pg.internal/images/" + sessionStorage.getItem("account") + ".jpg")) {
		        $("#idImg").attr("src", "http://digital.bsp.pg.internal/images/" + sessionStorage.getItem("account") + ".jpg")
		    }

		    function a() {
		        if (sessionStorage.getItem("cif_acc") != "cif") {
		            $(".modal h3").text("Account # " + sessionStorage.getItem("account"));
		            $(".modal label").text("Fetching Inward Telegraphic Transfers...")
		        } else {
		            $(".modal h3").text("CIF # " + sessionStorage.getItem("account"));
		            $(".modal label").text("Fetching Inward Telegraphic Transfers...")
		        }
		    }
		    if (!sessionStorage.getItem("account")) {
		        checkWorker();
		        startWorker();
		        $("#CustomerId").val("7011921033");
		        sessionStorage.setItem("account", "7011921033");
	        	$("h2").text(sessionStorage.getItem("account"));
		        sessionStorage.removeItem("redirect");
		        //setTimeout(function() {
		            $("#form1").submit()
		        //}, 1500);
		        a();
		        $(".modal").show();
		        return false
		    }
		    var b = "";
		    var d;
		    if (sessionStorage.getItem("cif_acc") == "acc" || sessionStorage.getItem("cif_acc") == null) {
		        d = "grd_2"
		    } else {
		        if (sessionStorage.getItem("cif_acc") == "cif") {
		            d = "grd_8"
		        }
		    }
		    $("#" + d + " tr:not(:first-child)").each(function() {
		        var f = $(this).find("td").eq(5).text();
		        var e = f.split("/");
		        if ($(this).find("td").eq(1).html() == "IN" && e[2] == "2021") {
		            $("#maps-table21").append(this)
		        }
		        if ($(this).find("td").eq(1).html() == "IN" && e[2] == "2020") {
		            $("#maps-table").append(this)
		        } else {
		            if ($(this).find("td").eq(1).html() == "IN" && e[2] == "2019") {
		                $("#maps-table19").append(this)
		            } else {
		                if ($(this).find("td").eq(1).html() == "IN" && e[2] == "2018") {
		                    $("#maps-table18").append(this)
		                }
		            }
		        }
		    });
		    $("td:nth-child(2)").hide();
		    $("td:nth-child(3)").hide();
		    $("td:nth-child(5)").hide();
		    $("td:nth-child(10)").hide();
		    $("td:nth-child(11)").hide();
		    $("td:nth-child(14)").hide();
		    $("td:nth-child(13)").hide();
		    $("td:nth-child(15)").hide();
		    $("td:nth-child(16)").hide();
		    $("td:nth-child(18)").hide();
		    $("td:nth-child(21)").hide();
		    $("td:nth-child(25)").hide();
		    $("td:nth-child(23)").hide();
		    $("td:nth-child(24)").hide();
		    if (sessionStorage.getItem("redirect")) {
		        checkWorker();
		        startWorker();
		        if ($.isNumeric(sessionStorage.getItem("account"))) {
		            $("#CustomerId").val(sessionStorage.getItem("account"));
	        		$("h2").text(sessionStorage.getItem("account"));
		            sessionStorage.removeItem("redirect");
		            //setTimeout(function() {
		                $("#form1").submit()
		            //}, 1500);
		            a();
		            $(".modal").show();
		            return false
		        } else {
		            sessionStorage.setItem("cif_acc", "string");
		            sessionStorage.setItem("redirect", 1);
		            window.location.href = "http://digital.bsp.pg.internal/SitePages/customer-transaction-monitoring/index.aspx"
		        }
		    }
		    var b = "";
		    var d;
		    if (sessionStorage.getItem("cif_acc") == "acc" || sessionStorage.getItem("cif_acc") == null) {
		        d = "grd_2"
		    } else {
		        if (sessionStorage.getItem("cif_acc") == "cif") {
		            d = "grd_8"
		        }
		    }
		    var c;
		    $("#navbar-search-input").keypress(function(f) {
		        c = $(this).val();
		        if (f.which == 13) {
		            checkWorker();
		            startWorker();
		            if ($.isNumeric($(this).val()) && $(this).val() != "") {
		                if ($(this).val().length > 7) {
		                    sessionStorage.setItem("cif_acc", "acc");
		                    $("#CustomerId").val($(this).val());
		                    sessionStorage.setItem("account", $(this).val());
		                    sessionStorage.setItem("redirect", 1);
		                    window.location.href = "http://digital.bsp.pg.internal/SitePages/customer-transaction-monitoring/index.aspx"
		                } else {
		                    if ($(this).val().length < 8) {
		                        sessionStorage.setItem("cif_acc", "cif");
		                        $("#CustomerId").val($(this).val());
		                        sessionStorage.setItem("account", $(this).val());
		                        sessionStorage.setItem("redirect", 1);
		                        window.location.href = "http://digital.bsp.pg.internal/SitePages/customer-transaction-monitoring/index.aspx"
		                    }
		                }
	        			$("h2").text(sessionStorage.getItem("account"));
		            } else {
		                if (!$.isNumeric($(this).val()) && $(this).val() != "") {
		                    sessionStorage.setItem("cif_acc", "string");
		                    $("#CustomerId").val(c);
		                    sessionStorage.setItem("account", c);
	        				$("h2").text(sessionStorage.getItem("account"));
		                    sessionStorage.setItem("redirect", 1);
		                    window.location.href = "http://digital.bsp.pg.internal/SitePages/customer-transaction-monitoring/pages/forms/name-src.aspx"
		                }
		            }
		        }
		    });
		    $("#offshore").click(function() {
		        sessionStorage.setItem("redirect", 1);
		        window.location.href = "http://digital.bsp.pg.internal/SitePages/customer-transaction-monitoring/index.aspx"
		    });
		    $("#ott").click(function() {
		        sessionStorage.setItem("redirect", 1);
		        window.location.href = "http://digital.bsp.pg.internal/SitePages/customer-transaction-monitoring/pages/tables/ott-table.aspx"
		    });
		    $("#purchase").click(function() {
		        sessionStorage.setItem("redirect", 1);
		        window.location.href = "http://digital.bsp.pg.internal/SitePages/customer-transaction-monitoring/pages/tables/purchase-table.aspx"
		    });
		    $("#cash").click(function() {
		        sessionStorage.setItem("redirect", 1);
		        window.location.href = "http://digital.bsp.pg.internal/SitePages/customer-transaction-monitoring/pages/tables/cash-table.aspx"
		    });
		    $("#refBtn").click(function() {
		        sessionStorage.setItem("redirect", 1);
		        window.location.href = "http://digital.bsp.pg.internal/SitePages/customer-transaction-monitoring/pages/tables/itt-table.aspx"
		    });
		    $("#insights").click(function() {
		        sessionStorage.setItem("redirect", 1);
		        window.location.href = "http://digital.bsp.pg.internal/SitePages/customer-transaction-monitoring/pages/charts/insights.aspx"
		    });
		    $("#insights_imt").click(function() {
		        sessionStorage.setItem("redirect", 1);
		        window.location.href = "http://digital.bsp.pg.internal/SitePages/customer-transaction-monitoring/pages/charts/insights_imt.aspx"
		    });
		    $("#imtTotals21").click(function() {
		        sessionStorage.setItem("redirect", 1);
		        window.location.href = "http://digital.bsp.pg.internal/SitePages/customer-transaction-monitoring/pages/tables/imt-totals-21.aspx"
		    });
		    $("#imtTaxHavens").click(function() {
		        logUser();
		        sessionStorage.setItem("redirect", 1);
		        window.location.href = "http://digital.bsp.pg.internal/SitePages/customer-transaction-monitoring/pages/tables/imt-th-s.aspx"
		    });
		    $("#tccBal").click(function() {
		        sessionStorage.setItem("redirect", 1);
		        window.location.href = "http://digital.bsp.pg.internal/SitePages/customer-transaction-monitoring/pages/tables/tcc.aspx"
		    });
		    $("#chart").click(function() {
		        sessionStorage.setItem("redirect", 1);
		        window.location.href = "http://digital.bsp.pg.internal/SitePages/customer-transaction-monitoring/pages/charts/insights.aspx"
		    });
		    $("#admin").click(function() {
		        sessionStorage.setItem("redirect", 1);
		        window.location.href = "http://digital.bsp.pg.internal/SitePages/customer-transaction-monitoring/pages/forms/admin.aspx"
		    })
		});
	</script>
	</body>
</html
