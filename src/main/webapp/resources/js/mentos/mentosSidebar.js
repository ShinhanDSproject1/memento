$(document).ready(function () {
    const cpath = $("#cpath").val() || "";
    const mentoId = new URLSearchParams(window.location.search).get("mentoId");

    // mentoId가 없으면 sidebar 요청 자체를 하지 않음
    if (!mentoId) {
        alert("mentoId 파라미터가 필요합니다.");
        return;
    }

    $.ajax({
        url: cpath + "/mentodetail/sidebar",
        method: "GET",
        data: { mentoId: mentoId },
        dataType: "json",
        success: function (data) {
            // BaseResponse 구조에 맞게 result에서 꺼냄
            if (data.code === 1000 || data.status === 200) {
                var info = data.result;
                $("#mentoName").text(info.mentoName);
                $("#userType").text(info.userType);
                $("#studentCount").text(info.studentCount);
                $("#reviewCount").text(info.reviewCount);
                $("#avgScore").text(info.avgScore);
                if (info.profileImageUrl) {
                    $("#profileImage").attr("src", info.profileImageUrl);
                } else {
                    $("#profileImage").attr("src", cpath + "/resources/images/sidebar/avatar-default0.svg");
                }
            } else {
                alert(data.message || "sidebar 데이터 불러오기 실패");
            }
        },
        error: function (xhr, status, error) {
            alert("sidebar 데이터 불러오기 실패: " + status);
        }
    });

    // 페이지 이동 버튼 처리
    $('.dynamic-link').on('click', function () {
        const baseUrl = $(this).data('url-template');
        if (mentoId) {
            location.href = baseUrl + mentoId;
        } else {
            alert("mentoId 없음");
        }
    });

    $('.page-link:not(.dynamic-link)').on('click', function () {
        const url = $(this).data('url');
        if (url) location.href = url;
    });
});
