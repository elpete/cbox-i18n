<cfcomponent output="false" hint="My App Configuration">
<cfscript>
	// Configure ColdBox Application
	function configure(){

		// coldbox directives
		coldbox = {
			//Application Setup
			appName 				= "Development Shell",

			//Development Settings
			reinitPassword			= "",
			handlersIndexAutoReload = true,

			//Implicit Events
			defaultEvent			= "main.index",
			requestStartHandler		= "",
			requestEndHandler		= "",
			applicationStartHandler = "main.onAppInit",
			applicationEndHandler	= "",
			sessionStartHandler 	= "",
			sessionEndHandler		= "",
			missingTemplateHandler	= "",

			//Extension Points
			ApplicationHelper 				= "",
			coldboxExtensionsLocation 	= "",
			modulesExternalLocation		= [],
			pluginsExternalLocation 	= "",
			viewsExternalLocation		= "",
			layoutsExternalLocation 	= "",
			handlersExternalLocation  	= "",
			requestContextDecorator 	= "",

			//Error/Exception Handling
			exceptionHandler		= "",
			onInvalidEvent			= "",
			customErrorTemplate		= "/coldbox/system/includes/BugReport.cfm",

			//Application Aspects
			handlerCaching 			= false,
			eventCaching			= false,
			proxyReturnCollection 	= false
		};

		// custom settings
		settings = {
		};

		// Module Directives
		modules = {
			//Turn to false in production, on for dev
			autoReload = false
		};

		//i18n & Localization
		i18n = {
			defaultResourceBundle = "includes/i18n/main",
			resourceBundles = {
				"support" = "includes/i18n/support"
			},
			defaultLocale = "en_US",
			localeStorage = "cookie",
			unknownTranslation = "**NOT FOUND**",
			logUnknownTranslation = true,
			customResourceService = "#len( appMapping ) ? appMapping & "." : ''#models.CustomResourceService"
		};


		//LogBox DSL
		logBox = {
			// Define Appenders
			appenders = {
				files={class="coldbox.system.logging.appenders.RollingFileAppender",
					properties = {
						filename = coldbox.appName, filePath="/#appMapping#/logs"
					}
				}
			},
			// Root Logger
			root = { levelmax="ERROR", appenders="*" },
			// Implicit Level Categories
			info = [ "coldbox.system" ]
		};

		//Register interceptors as an array, we need order
		interceptors = [
			//SES
			{class="coldbox.system.interceptors.SES",
			 properties={}
			}
		];

	}
</cfscript>
</cfcomponent>