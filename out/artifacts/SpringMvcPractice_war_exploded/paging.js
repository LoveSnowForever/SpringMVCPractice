var totalPage;// =document.getElementById("spanTotalPage");//总页数
var cur_pageNum ;//=document.getElementById("spanCurPageNum");//当前页
var totalListNum  ;//=document.getElementById("spanTotalListNum");//数据总数
var go_pageNum;//=document.getElementById("goPageText")//当前页文本框
var spanPre ;//=document.getElementById("spanPre");//上一页
var spanNext;//=document.getElementById("spanNext");//下一页
var spanFirst;//=document.getElementById("spanFirst");//第一页
var spanLast;//=document.getElementById("spanLast");//最后一页
var pageSize=2;
var theTable;;//表格
var numberRowsInTable;//theTable.rows.length-1;//表格最大行数
var page=1;
//下一页
function next() {

}

//总页数
function pageCount() {
    var count=0;
    if(numberRowsInTable%pageSize!=0)count=1;
    return Math.floor(numberRowsInTable/pageSize)+count;
}

//显示链接link方法将相应的文字变成可点击的，nolink方法将文字变成不可点击
function preLink() {
    spanPre.innerHTML="<a href='javascript:pre();' style='color: #b92c28'>上一页</a>";
}
function preNoLink() {
    spanPre.innerHTML="上一页";
}
function nextLink() {
    spanNext.innerHTML="<a href='javascript:next();'  style='background-color: #1E0FBE'>下一页</a>";
}
function nextNoLink() {
    spanNext.innerHTML="下一页";
}
function firstLink() {
    spanFirst.innerHTML="<a href='javascript:first();'  style='background-color: #1E0FBE'>首页</a>";
}
function firstNoLink() {
    spanFirst.innerHTML="首页";
}

function lastLink() {
    spanLast.innerHTML="<a href='javascript:last();' style='color: #b92c28'>尾页</a>";
}
function lastNoLink() {
    spanLast.innerHTML="尾页";
}

//初始化总记录数
function initForCount() {
    totalListNum.innerHTML=numberRowsInTable;
}

//设置当前页数
function showPage() {
    cur_pageNum.innerHTML=page;
}

//隐藏表格内容
function hideTable() {
    for(var i=1;i<numberRowsInTable+1;i++){
        theTable.rows[i].style.display='none';
    }
    theTable.rows[0].style.display='';
}



function next() {
    if(pageCount()<=1){
    }
    else{
        hideTable();
        var currentRow=pageSize*page+1;//下一页的第一行
        var maxRow=currentRow+pageSize;//下一页的最后一行+1
        if(maxRow>numberRowsInTable)maxRow=numberRowsInTable+1;
        for(var i=currentRow;i<maxRow;i++){
            theTable.rows[i].style.display='';
        }
        page++;
        go_pageNum.value=page
        //如果下一页的最后一行是表格的最后一行
        if(maxRow==numberRowsInTable){
            nextNoLink();
            lastNoLink();
        }
        showPage();
        //如果当前页是尾页
        if(page==pageCount()){
            nextNoLink();
            lastNoLink();
        }
        preLink();
        firstLink();
    }
}
function pre() {
    if (pageCount()<=1){

    }
    else{
        hideTable();
        page--;
        go_pageNum.value=page;
        var currentRow=pageSize*page+1;//下一页的第一行
        var maxRow=currentRow-pageSize;
        if(currentRow>numberRowsInTable)currentRow=numberRowsInTable;
        for(var i=maxRow;i<currentRow;i++){
            theTable.rows[i].style.display='';
        }
        if(maxRow==0){
            preNoLink();
            firstNoLink();
        }
        showPage();
        if(page==1){
            firstNoLink();
            preNoLink();
        }
        nextLink();
        lastLink();

    }
}
function first() {
    if(pageCount()<=1){

    }
    else{
        hideTable();
        page=1;
        go_pageNum.value=page;
        for(var i=1;i<pageSize+1;i++){
            theTable.rows[i].style.display='';
        }
        showPage();
        firstNoLink();
        preNoLink();
        nextLink();
        lastLink();
    }
}
function last() {
    if(pageCount()<=1){

    }
    else{
        hideTable();
        page=pageCount();
        //设置文本框中的值
        go_pageNum.value=page;
        var currentRow=pageSize*(page-1)+1//最后一页的第一行
        for(var i=currentRow;i<numberRowsInTable+1;i++){
            theTable.rows[i].style.display='';
        }
        showPage();
        firstLink();
        preLink();
        lastNoLink();
        nextNoLink();

    }
}
function hide() {
    initTable();
    for(var i=pageSize+1;i<numberRowsInTable+1;i++){
        theTable.rows[i].style.display='none';
    }
    initForCount();
    totalPage.innerHTML=pageCount();
    go_pageNum.value=page;
    showPage();
    if(pageCount()>1){
        nextLink();
        lastLink();
    }
}

function test(){
    alert(page);

}

function initTable() {
     totalPage =document.getElementById("spanTotalPage");//总页数
     cur_pageNum =document.getElementById("spanCurPageNum");//当前页
     totalListNum  =document.getElementById("spanTotalListNum");//数据总数
     go_pageNum=document.getElementById("goPageText")//当前页文本框
     spanPre =document.getElementById("spanPre");//上一页
     spanNext=document.getElementById("spanNext");//下一页
     spanFirst=document.getElementById("spanFirst");//第一页
     spanLast=document.getElementById("spanLast");//最后一页
    theTable=document.getElementById("t_customer");
    numberRowsInTable=theTable.rows.length-1;
}

