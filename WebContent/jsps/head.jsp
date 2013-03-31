
<head>

<title>Software Management System</title>

<link rel="stylesheet" href="css/sms.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/layout4_setup.css" />
<link rel="stylesheet" type="text/css" href="../css/layout4_text.css" />
<link rel="icon" type="image/x-icon" href="img/favicon.ico1" />
<link rel="stylesheet" type="text/css" href="../css/sms.css" />
<link rel="stylesheet" type="text/css" href="../css/tcal.css" />

<script type="text/javascript"  src="../js/tcal.js"></script>
<script type="text/javascript" src="../js/anylinkvertical.js"></script>


<script type="text/javascript">
    function getItem(id)
    {
        var itm = false;
        if(document.getElementById)
            itm = document.getElementById(id);
        else if(document.all)
            itm = document.all[id];
        else if(document.layers)
            itm = document.layers[id];

        return itm;
    }

    function toggleItem(id)
    {
        itm = getItem(id);

        if(!itm)
            return false;

        if(itm.style.display == 'none')
            itm.style.display = '';
        else
            itm.style.display = 'none';

        return false;
    }
    </script>

</head>
