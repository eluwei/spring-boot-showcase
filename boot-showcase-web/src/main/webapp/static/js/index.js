define(["jquery","bootstrap","bootbox"],
    function ($,bootstrap,bootbox) {
        $(function () {
            $(".TBD").on("click", function () {
                bootbox.alert("板块正在开发中，先浏览其他页面吧");
                return false;
            })
        })
});

