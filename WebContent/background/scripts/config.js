var config = {
    // 配置api接口 
    webApiUrl: {
        
    	getprobycate:"http://localhost:8090/onlineshopping/getprobycate",
        getOrder:"http://localhost:8090/onlineshopping/getorders",//获取订单
        getOrderDetil:"https://www.juwei-tech.club/admin/public/xiaojungan/admin.myorder/getorderdetail",//获取订单详情
        sendMes:"https://www.juwei-tech.club/admin/public/xiaojungan/admin.myorder/sendmes"//商品发货
    },
    // 接口的实现 不需要理会
    webApiFun: {
        // 
        login: function (field, fun) {
            // classID_templ
            var $ = layui.jquery;
            var adminLogin = config.webApiUrl.adminLogin;
            $.ajax({
                type: "POST",
                url: adminLogin,
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(field),
                dataType: "json",
                xhrFields: { withCredentials: true },
                success: function (message) {
                    console.log(message);
                    fun(message);

                },
                error: function (message) {
                    layer.msg('登陆失败,服务器错误');
                    data.elem.disabled = false;
                    data.elem.className = "layui-btn layui-btn-fluid";
                    // 服务器错误
                }

            });

        },
        
        myquit: function (fun) {
            // classID_templ
            layui.use(['element'], function () {

                var $ = layui.jquery;

                var myquit = config.webApiUrl.myquit;


                $.ajax({
                    type: "GET",
                    url: myquit,
                    contentType: "application/json; charset=utf-8",
                    // data: JSON.stringify(data.field),
                    // dataType: "json",
                    xhrFields: { withCredentials: true },
                    success: function (message) {
                        console.log(message);
                        fun(message);
                    },
                    error: function (message) {
                        layer.msg('服务器错误');
                        // 服务器错误

                        layer.closeAll('loading');
                    }

                });
            });
        },
        getAllcate: function (fun) {
            // classID_templ
            layui.use(['element'], function () {

                var $ = layui.jquery;

                var getAllcate = config.webApiUrl.getAllcate;


                $.ajax({
                    type: "GET",
                    url: getAllcate,
                    contentType: "application/json; charset=utf-8",
                    // data: JSON.stringify(data.field),
                    // dataType: "json",
                    xhrFields: { withCredentials: true },
                    success: function (message) {
                        console.log(message);
                        fun(message);
                    },
                    error: function (message) {
                        layer.msg('服务器错误');
                        // 服务器错误

                        layer.closeAll('loading');
                    }

                });
            });
        },
        getprobycate: function (id, fun) {
            layui.use('element', function () {
                // form
                var element = layui.element;
                var $ = layui.jquery;

                var getprobycate = config.webApiUrl.getprobycate;

                $.ajax({
                    type: "POST",
                    url: getprobycate,
                    data:{
                    	status:id
                    },
                    contentType: "application/x-www-form-urlencoded",
                    // data: JSON.stringify(data.field),
                    // dataType: "json",
                    xhrFields: { withCredentials: true },
                    success: function (message) {
                        console.log(message);
                        for(let i=0;i<message.length;i++){
                        	var img=message[i].main_img;
                        	message[i].main_img='http://localhost:8090/onlineshopping/page/images/'+img;
                        };
                        fun(message);
                    },
                    error: function (message) {
                        layer.msg('服务器错误');
                        // 服务器错误

                    }

                });

            });
        },
        
        //查询订单
        getOrder:function(id,fun){
            layui.use('element', function () {
                // form
                var element = layui.element;
                var $ = layui.jquery;

                var getprobycate = config.webApiUrl.getOrder;

                $.ajax({
                    type: "POST",
                    url: getprobycate,
                    data:{
                    	status:id
                    },
                    contentType: "application/x-www-form-urlencoded",
                    // data: JSON.stringify(data.field),
                    // dataType: "json",
                    xhrFields: { withCredentials: true },
                    success: function (message) {
                        console.log(message);
                        fun(message);
                    },
                    error: function (message) {
                        layer.msg('服务器错误');
                        // 服务器错误

                    }

                });

            });
        },
        
        deleteproduct: function (id, fun) {
            var $ = layui.jquery;
            // console.log($);
            var deleteproduct = config.webApiUrl.deleteproduct
            $.ajax({
                type: "POST",
                url: deleteproduct + id,
                contentType: "application/json; charset=utf-8",
                // data: JSON.stringify({ id: id }),
                // dataType: "json",
                xhrFields: { withCredentials: true },
                success: function (message) {
                    // console.log(message);
                    fun(message);

                },
                error: function (message) {
                    layer.msg('服务器错误');
                    // 服务器错误
                }

            });

        },
        deletecate: function (id, fun) {
            var $ = layui.jquery;
            // console.log($);
            var deletecate = config.webApiUrl.deletecate
            $.ajax({
                type: "POST",
                url: deletecate + id,
                contentType: "application/json; charset=utf-8",
                // data: JSON.stringify({ id: id }),
                // dataType: "json",
                xhrFields: { withCredentials: true },
                success: function (message) {
                    // console.log(message);
                    fun(message);

                },
                error: function (message) {
                    layer.msg('服务器错误');
                    // 服务器错误
                }

            });

        },
        addproduct: function (form_data, fun) {
            var addproduct = config.webApiUrl.addproduct;
            layui.use('element', function () {
                var element = layui.element;
                var $ = layui.jquery;
                $.ajax({
                    url: addproduct,
                    type: "post",
                    data: form_data,
                    xhrFields: { withCredentials: true },
                    processData: false,
                    contentType: false,
                    success: function (data) {
                        console.log(data);
                        fun(data);

                        // console.log("over..");
                    },
                    error: function (e) {
                        alert("错误！！");

                    }
                });

            });

        },
        addcate: function (formData, fun) {
            var addcate = config.webApiUrl.addcate;
            layui.use('element', function () {

                var element = layui.element;
                var $ = layui.jquery;

                $.ajax({
                    url: addcate,
                    type: "post",
                    data: formData,
                    xhrFields: { withCredentials: true },
                    processData: false,
                    contentType: false,
                    success: function (data) {

                        console.log(data);
                        fun(data);


                        // console.log("over..");
                    },
                    error: function (e) {
                        alert("错误！！");

                    }
                });

            });

        },
        editproinfo: function (formData, fun) {
            var apiUrl = config.webApiUrl.editproinfo;
            var $ = layui.jquery;

            $.ajax({
                type: "POST",
                url: apiUrl,
                data: formData,
                dataType: "json",
                xhrFields: { withCredentials: true },
                success: function (message) {
                    console.log(message);
                    fun(message);

                },
                error: function (message) {
                    layer.msg('服务器错误');

                    // 服务器错误
                }

            });


        },
        editproimg: function (formData, fun) {
            var apiUrl = config.webApiUrl.editproimg;
            var $ = layui.jquery;

            $.ajax({
                type: "POST",
                url: apiUrl,
                data: formData,
                processData: false,
                contentType: false,
                xhrFields: { withCredentials: true },
                success: function (message) {
                    console.log(message);
                    fun(message);

                },
                error: function (message) {
                    layer.msg('服务器错误');

                    // 服务器错误
                }

            });


        },
        editcateinfo: function (formData, fun) {
            var apiUrl = config.webApiUrl.editcateinfo;
            var $ = layui.jquery;

            $.ajax({
                type: "POST",
                url: apiUrl,
                data: formData,
                dataType: "json",
                xhrFields: { withCredentials: true },
                success: function (message) {
                    console.log(message);
                    fun(message);

                },
                error: function (message) {
                    layer.msg('服务器错误');

                    // 服务器错误
                }

            });


        },
        editcateimg: function (formData, fun) {
            var apiUrl = config.webApiUrl.editcateimg;
            var $ = layui.jquery;

            $.ajax({
                type: "POST",
                url: apiUrl,
                data: formData,
                processData: false,
                contentType: false,
                xhrFields: { withCredentials: true },
                success: function (message) {
                    console.log(message);
                    fun(message);

                },
                error: function (message) {
                    layer.msg('服务器错误');

                    // 服务器错误
                }

            });


        },
        
        getOrderDetil:function(orderNo,fun){
            layui.use('element', function () {
                // form
                var element = layui.element;
                var $ = layui.jquery;

                var getOrderDetil = config.webApiUrl.getOrderDetil;

                $.ajax({
                    type: "POST",
                    url: getOrderDetil,
                    data:{
                    	order_no:orderNo
                    },
                    contentType: "application/x-www-form-urlencoded",
                    // data: JSON.stringify(data.field),
                    // dataType: "json",
                    xhrFields: { withCredentials: true },
                    success: function (message) {
                        console.log(message);
                        fun(message);
                    },
                    error: function (message) {
                        layer.msg('服务器错误');
                        // 服务器错误

                    }

                });

            });
        
        },
        
        
        sendMes:function(orderNo,fun){
        	
            layui.use('element', function () {
                // form
                var element = layui.element;
                var $ = layui.jquery;

                var sendMes = config.webApiUrl.sendMes;

                $.ajax({
                    type: "POST",
                    url: sendMes,
                    data:{
                    	order_no:orderNo
                    },
                    contentType: "application/x-www-form-urlencoded",
                    // data: JSON.stringify(data.field),
                    // dataType: "json",
                    xhrFields: { withCredentials: true },
                    success: function (message) {
                        console.log(message);
                        fun(message);
                    },
                    error: function (message) {
                        layer.msg('服务器错误');
                        // 服务器错误

                    }

                });

            });
        
        
        },
        
        




    },
    PageContext: {
        allType: []
    }

}