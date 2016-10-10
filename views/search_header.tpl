<div class="header-container search-header-container">
	<div class="header mdl-grid">
		<div class="mdl-cell--1-col">
			<div class="search-logo">
				<a href="/"><img src="images/banora_small.png" /></a>
			</div>
		</div>
		<div class="mdl-cell--6-col">
			<form class="devsite-search-form" action="search" method="get">
			   	<div id="searchbox" class="devsite-searchbox">
			   		<input placeholder="Search" value="{{query}}" type="text" class="devsite-search-field devsite-search-query search-query" name="q" value="" autocomplete="off">
		        	<input type="submit" value="search" class="devsite-search-enter material-icons">
			    </div>
		    </form>
	    </div>
	    %if defined('picture'):
			<img src="{{picture}}" class="profile-icon" id="profile-icon" onclick="toggle_visibility('account-box');toggle_visibility('account-box-arrow');"/>
			<div class="account-box" id="account-box">
				<a class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored logout-button" href="/logout">Logout</a>
				<div class="name">{{name}}</div>
				<div class="email">{{email}}</div>
			</div>
			<div class="account-box-arrow" id="account-box-arrow"></div>
		%else:
			<a class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored login-button" href="/login">Login</a>
		%end
	</div>
</div>