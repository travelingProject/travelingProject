$(document).ready(function () {
	
	// 모달 닫기 취소 버튼
	$("#payment-cancel").click(function() {
		if (confirm("결제를 취소하시겠습니까?")) {
			$("#toss-modal-wrap").hide();
			$("body").css("overflow", "auto");
		}
	});
	
});

function payModal() {
	// 모달 열기
    $("#toss-modal-wrap").show();
    $("body").css("overflow", "hidden");
    
    payToToss();
}

function payToToss() {
	const clientKey = 'test_ck_EP59LybZ8BddpojElBbV6GYo7pRe' // 테스트용 클라이언트 키
	const secretKey = 'test_sk_GjLJoQ1aVZJJpdPjyR1Vw6KYe2RN'
	const customerKey = 's8_DRjcuO1whKV7ZHOFRr' // 내 상점에서 고객을 구분하기 위해 발급한 고객의 고유 ID
	const button = document.getElementById("payment-btn")
				
	// 2. 결제위젯 SDK 초기화
	const paymentWidget = PaymentWidget(clientKey, customerKey) // 회원 결제
	// const paymentWidget = PaymentWidget(clientKey, PaymentWidget.ANONYMOUS) // 비회원 결제
				
	const paymentMethodsWidget = paymentWidget.renderPaymentMethods(
			'#toss-window', {
				value : 10000,
				currency : 'KRW',
				country : 'KR',
			}, {
				variantKey : 'DEFAULT'
			})
	button.addEventListener("click", function () {
		paymentWidget.requestPayment({
			orderId: "tQvcKm5xLxW-5lDblburh",            
			orderName: "토스 티셔츠 외 2건",                 
			successUrl: window.location.origin + "/success",  
			failUrl: window.location.origin + "/fail",        
			customerEmail: "customer123@gmail.com",
			customerName: "김토스",
			customerMobilePhone: "01012341234"
		})
	})	
}