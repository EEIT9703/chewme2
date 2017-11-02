$(document).ready(function() {

        $('#summernote').summernote();
        
        $(".form1").vmodel("--preview", true, function (){
        	 
            var vs = this;
     
            // 自動讀取的方法
            this.autoload = ['change_file'];
     
            // 連續的圖片編碼
            this.imgcode = '';
     
            // 選取發生改變
            this.change_file = function (){
                vs.root.on("change", ".upl", function (){
                    local_show(this);
                });
            }
     
            // 批次圖片，先清空後再插入
            var local_show = function (input){
                if (input.files && input.files[0]) {
                    local_clean();
                    local_each_img(input.files);
                }
            }
     
            // 批次讀取，最後再一次寫入
            var local_each_img = function (files){
     
                $.each(files, function (index, file){
                    console.log(file); //檔案資訊可以在這裡看到
                    var src = URL.createObjectURL(file);
                    local_create_imgcode(src);
                });
     
                // 放置預覽元素後重設
                vs.root.find(".preview").html(vs.imgcode);
                local_reset();
            }
     
            // 建立圖片
            var local_create_imgcode = function(src){
                vs.imgcode += '<img class="img" src="' + src + '">';
            }
     
            // 清空預覽區域
            var local_clean = function (){
                vs.root.find(".preview").empty();
            }
     
            // 還原 input[type=file]
            var local_reset = function (){
                vs.imgcode = '';
                vs.root.find(".upl").val(null);
            }
     
        });

    });