function pint_initial() {
    var shell = new ActiveXObject("WScript.Shell");
    // delete page header and page footer while print
    shell.RegWrite("HKEY_CURRENT_USER\\Software\\Microsoft\\Internet Explorer\\PageSetup\\header","");
    shell.RegWrite("HKEY_CURRENT_USER\\Software\\Microsoft\\Internet Explorer\\PageSetup\\footer","");
}

function printsetup() {
    wb.execwb(8, 1);
}

function printpreview() {
    wb.execwb(7, 1);
}

function printit() {
    wb.execwb(6, 6);
    // window.print();
}
