<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>HTML to Image</title>
  <style>
    table { background-color: #ccddff; }
    td { padding: 2px 6px; }
    table input { 
      width: 100px; padding: 2px 6px; 
      color: blue; border: 1px solid gray; 
    }
    fieldset { width: 200px; height: 120px; margin-top: 6px; }
  </style>
</head>
<body>
  <table>
    <tr><td>姓名</td><td><input value="Darkthread"></td></tr>
    <tr><td>積分</td><td><input value="9999"></td></tr>
  </table>
  <hr />
  <input type="button" value="轉為圖檔" />
  <a></a>
  <fieldset>
    <legend>圖檔</legend>
    <div>
    </div>
  </fieldset>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.9.1.js "></script>
<script src="http://ajax.aspnetcdn.com/ajax/knockout/knockout-3.0.0.js "></script>
<script src="http://html2canvas.hertzen.com/build/html2canvas.js"></script>
  <script>
    $(":button").click(function() {
      html2canvas($("table")[0], {
        onrendered: function(canvas) {
          var $div = $("fieldset div");
          $div.empty();
          $("<img />", { src: canvas.toDataURL("image/png") }).appendTo($div);
          console.log(canvas.toDataURL("image/png"));
        }
      });
    });
  </script>
</body>
</html>