<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
* [Global.asax](./CS/WebSite/Global.asax) (VB: [Global.asax](./VB/WebSite/Global.asax))
* [Site.master.cs](./CS/WebSite/Site.master.cs) (VB: [Site.master.vb](./VB/WebSite/Site.master.vb))
<!-- default file list end -->
# How to drag and drop items from/to ASPxListBox with jQuery when item ImageUrl is used


<p>This solution is based on the E3417 example (<a href="http://www.devexpress.com/Support/Center/Example/Details/E3417"><u>How to drag and drop items from/to ASPxListBox using jQuery UI</u></a>). </p><p>In the E3417 example, the <td> element is a draggable and droppable element. Thus, it is possible to grag-and-drop items by an image only, not by text. As a solution, move items by the <tr>, not <td> element.</p>

<br/>


