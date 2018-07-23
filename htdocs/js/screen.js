$(function() {
    var pageName = getParam("p");
    if (!!!pageName) {
        pageName = "main";
    }
    includePage($("#menu-area"), "menu");
    showPage(pageName);
});

function showPage(pageName) {
    $("#main-area").load("/pages/" + pageName + ".html");
}

function includePage($area, pageName) {
    $area.load("/include/" + pageName + ".html");
}

function renderTemplate(targetTmpl, apiName, callBack) {
    //var urlPrefix = "http://funabashiksc.php.xdomain.jp/api/index.php";
    var urlPrefix = "http://localhost:8082/api";
    // JsRenderテンプレート読み込み
    var $tmpl = $("#" + targetTmpl);
    // JSONを読み込み
    $.getJSON(urlPrefix+ apiName, function(jsonData) {
        console.log(jsonData);
        // 読みこんだJSONをテンプレートへ反映し出力
        $("#render_area").append($tmpl.render(jsonData));
        // callBack 実行
        $(callBack);
    })
    .fail(function(jqXHR, textStatus, errorThrown) {
        console.log("エラー：" + textStatus);
        console.log("テキスト：" + jqXHR.responseText);
    });
}