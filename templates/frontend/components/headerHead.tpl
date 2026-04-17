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
		{if isset($publication) && $publication}
			{$publication->getLocalizedFullTitle()|strip_tags|escape}
		{elseif isset($article) && $article}
			{$article->getLocalizedTitle()|strip_tags|escape}
		{elseif isset($submission) && $submission}
			{$submission->getLocalizedTitle()|strip_tags|escape}
		{elseif isset($pageTitleTranslated) && $pageTitleTranslated}
			{$pageTitleTranslated|strip_tags|escape}
		{elseif isset($pageTitle) && $pageTitle}
			{translate|strip_tags|escape key=$pageTitle}
		{/if}
		{if isset($requestedPage) && $requestedPage != 'index' && isset($currentContext) && $currentContext}
			| {$currentContext->getLocalizedName()|escape}
		{/if}
	</title>

	{load_header context="frontend"}
	{load_stylesheet context="frontend"}
	
	{* Канонічне посилання з мовним сегментом для уникнення помилок редиректу *}
	{assign var="currentCanonical" value="https://`$smarty.server.SERVER_NAME``$smarty.server.REQUEST_URI`"}
	<link rel="canonical" href="{$currentCanonical|escape}">
</head>
