{**
 * templates/frontend/components/headerHead.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2000-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Common site header <head> tag and contents.
 *}
<head>
	<meta charset="{$defaultCharset|escape}">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>
		{$pageTitleTranslated|strip_tags}
		{* Add the journal name to the end of page titles *}
		{if $requestedPage|escape|default:"index" != 'index' && $currentContext && $currentContext->getLocalizedName()}
			| {$currentContext->getLocalizedName()}
		{/if}
	</title>

	{load_header context="frontend"}
	{load_stylesheet context="frontend"}
	
	{* Канонічне посилання з мовним сегментом для уникнення помилок редиректу *}
    {assign var="currentCanonical" value="https://`$smarty.server.SERVER_NAME``$smarty.server.REQUEST_URI`"}
    <link rel="canonical" href="{$currentCanonical|escape}">
    
    {* Google Analytics G-########## з обгорткою literal для Smarty *}
    {literal}
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-##########"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());
      gtag('config', 'G-##########');
    </script>
    {/literal}
</head>
