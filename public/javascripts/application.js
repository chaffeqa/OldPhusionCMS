// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function show_menu(menu_id) {
    document.getElementById(menu_id).style.maxHeight="1000px";
    document.getElementById(menu_id).style.visibility="visible";
}
function hide_menu(menu_id) {
    document.getElementById(menu_id).style.maxHeight="0px";
    document.getElementById(menu_id).style.visibility="hidden";
}
