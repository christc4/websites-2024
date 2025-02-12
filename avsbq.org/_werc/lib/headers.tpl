<!DOCTYPE HTML>
<html>
<head>

    <title>%($pageTitle%)</title>

    <link rel="stylesheet" href="/pub/style/style.css" type="text/css" media="screen, handheld" title="default">
    <link rel="shortcut icon" href="/favicon.ico" type="image/vnd.microsoft.icon">
    <link rel="stylesheet" href="https://avsbq.org/_werc/pub/style.css" type="text/css" media="screen" title="default">

    <meta charset="UTF-8">
% # Legacy charset declaration for backards compatibility with non-html5 browsers.
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 

% if(! ~ $#meta_description 0)
%   echo '    <meta name="description" content="'$"meta_description'">'
% if(! ~ $#meta_keywords 0)
%   echo '    <meta name="keywords" content="'$"meta_keywords'">'

% h = `{get_lib_file headers.inc}
% if(: ~ $#h 0)
%   cat $h

    %($"extraHeaders%)

</head>


<a href="../" class="up-button"><span style='font-size:14px;'>&#8617;</span><i>%($req_path%)</i></a>
<body>

