<!doctype html>

<html lang="en">
% include('head.tpl')
<body class="home-body" style="background: url({{bg_url}}); background-size: cover; background-repeat: no-repeat; background-position: center center;">
	<div class="header-container">
		<div class="header">
			<!--TODO Handle case of no picture available -->
			%if logged_in:
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

	<div class="home-container">
		<div class="main-logo">
			<img id = "logo" onclick="playAnim()" src="images/banora.png" />
		</div>

		<div class="search-wrapper home-page-search-wrapper">
			<form id= "mySearch" class="search-form" action="search" method="get">
			   	<div id="searchbox" class="searchbox">
			   		<input id= "myInput" placeholder="Search" type="text" class="search-field search-query search-query" name="q" value="" autocomplete="off">	        	
					<button type=button onclick="startDictation()" class="search-voice material-icons"></button>
					<input type="submit" value="search" class="search-enter material-icons">
			    </div>
		    </form>
		</div>

		%if logged_in:
		<div class="search-history-home-container">
			%import database as db
			%keywords = db.get_top_keywords(id)
			%for word in keywords:
			<!-- Button Chip -->
			<button type="button" class="mdl-chip">
			    <span class="mdl-chip__text">{{word[0]}}</span>
			</button>
			%end			
		</div>
		%end
	</div>

	<div class="img-credits">{{bg_copywright}}</div>

	% include('footer.tpl')
</body>
</html>
