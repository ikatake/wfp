//ページ読み込み時の処理を行う。
httpObj = new XMLHttpRequest();
//httpObj.open("get","./wfp.json")
//httpObj.onlodad = function(){
//  var json_data = JSON.parse(this.responseText)
//  var txt = "";
//  for(var i = 0; i < json_data.item.length; i++){
//    txt += (json_data.item[i].title + " " + json_data.item[i].pic_uri)
//    txt += "<br>"
//  }
//  document.getElementById("enjoy").innerHTML = txt;
//}
window.onload = function(){
  httpObj.onreadystatechange = function(){
    if(httpObj.readyState == 4 && httpObj.status == 200){
      var json_data = JSON.parse(this.responseText)
      var txt = "";
      for(var i = 0; i < json_data.length; i++){
        txt += "<a href=" + json_data[i].uri + ">";
        txt += "<img src=" + json_data[i].pic_uri + " "
        txt += 'width="160px" height="180px"' 
        txt += "alt=" + json_data[i].title + ">" + "</ br>"
        txt +=  json_data[i].title + "<hr>"
      }
      document.getElementById("enjoy").innerHTML = txt;
    }
  }
  httpObj.open("GET", "wfp.json");
  httpObj.send();
}
function createXMLHttpRequest() {
  if (window.XMLHttpRequest) {return new XMLHttpRequest() }
  return false;
}
