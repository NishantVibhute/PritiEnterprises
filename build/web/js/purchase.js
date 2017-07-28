/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    var counter = 1;

    $("#addrow").on("click", function () {
        var $options = $("#productSelect > option").clone();
        var newRow = $("<tr>");
        var cols = "";

        cols += '<td><select id="productSelect' + counter + '" name="purchaseProducts[' + counter + '].productId" class="form-control" onchange="getCompanyInfo()"></select></td>';
        cols += '<td><input type="text" class="form-control" name="purchaseProducts[' + counter + '].qty" id="qty' + counter + '"/></td>';
        cols += '<td><input type="text" class="form-control" name="purchaseProducts[' + counter + '].price" id="price' + counter + '" onblur="calculateRowGSTTotal(' + counter + ')"/></td>';
        cols += '<td><input type="text" class="form-control" name="purchaseProducts[' + counter + '].amount" id="amount' + counter + '" /></td>';
        cols += '<td><input type="text" class="form-control" name="purchaseProducts[' + counter + '].cgstPerc" id="cgstPerc' + counter + '" onblur="calculateRowGSTTotal(' + counter + ')" value="9"/></td>';
        cols += '<td><input type="text" class="form-control" name="purchaseProducts[' + counter + '].cgstAmount" id="cgstAmt' + counter + '"/></td>';
        cols += '<td><input type="text" class="form-control" name="purchaseProducts[' + counter + '].sgstPerc" id="sgstPerc' + counter + '" onblur="calculateRowGSTTotal(' + counter + ')"  value="9"/></td>';
        cols += '<td><input type="text" class="form-control" name="purchaseProducts[' + counter + '].sgstAmount"  id="sgstAmt' + counter + '" /></td>';
        cols += '<td><input type="text" class="form-control" name="purchaseProducts[' + counter + '].igstPerc" id="igstPerc' + counter + '" onblur="calculateRowGSTTotal(' + counter + ')" value="18"/></td>';
        cols += '<td><input type="text" class="form-control" name="purchaseProducts[' + counter + '].igstAmount" id="igstAmt' + counter + '" /></td>';
        cols += '<td><input type="text" class="form-control" name="purchaseProducts[' + counter + '].totalAmountAfterTax" id="totalAmountAfterTax' + counter + '"/></td>';
        cols += '<td><input type="button" class="ibtnDel btn btn-md btn-danger "  value="X"></td>';
        newRow.append(cols);
        


        $("table.order-list").append(newRow);
        $('#productSelect' + counter + '').append($options);
        counter++;
    });



    $("table.order-list").on("click", ".ibtnDel", function (event) {
        $(this).closest("tr").remove();       
        counter -= 1
    });


});



function calculateTotal() {
    
    var val = parseFloat($("#totalAmount").val()).toFixed(2);
    
    var cgstPerc=$("#cgst").val();
    var cgstAmt=  parseFloat(val*(cgstPerc/100)).toFixed(2);
    $("#cgst1").val(cgstAmt);
   
    var sgstPerc=$("#sgst").val();
     var sgstAmt=parseFloat(val*(sgstPerc/100)).toFixed(2);
    $("#sgst1").val(sgstAmt);
    
    var igstPerc=$("#igst").val();
     var igstAmt=parseFloat(val*(igstPerc/100)).toFixed(2);
    $("#igst1").val(igstAmt);
    
    var totalAmountAfterTax = parseFloat( parseFloat(val)+parseFloat(cgstAmt) + parseFloat(sgstAmt)+ parseFloat(igstAmt)).toFixed(2);
    $("#totalAmountAfterTax").val(totalAmountAfterTax);
    
}


function calculateRowGSTTotal(i) {
    
    var qty= parseInt($("#qty"+i).val());
    var price = parseFloat($("#price"+i).val()).toFixed(2);
    
    var val = parseFloat( qty*parseFloat(price)).toFixed(2);
    $("#amount"+i).val(val);
    
    var cgstPerc=$("#cgstPerc"+i).val();
    var cgstAmt=  parseFloat(val*(cgstPerc/100)).toFixed(2);
    $("#cgstAmt"+i).val(cgstAmt);
   
    var sgstPerc=$("#sgstPerc"+i).val();
     var sgstAmt=parseFloat(val*(sgstPerc/100)).toFixed(2);
    $("#sgstAmt"+i).val(sgstAmt);
    
    var igstPerc=$("#igstPerc"+i).val();
     var igstAmt=parseFloat(val*(igstPerc/100)).toFixed(2);
    $("#igstAmt"+i).val(igstAmt);
    
    var totalAmountAfterTax = parseFloat( parseFloat(val)+parseFloat(cgstAmt) + parseFloat(sgstAmt)+ parseFloat(igstAmt)).toFixed(2);
    $("#totalAmountAfterTax"+i).val(totalAmountAfterTax);
    
}
