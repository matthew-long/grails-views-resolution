import grails.core.*
import grails.util.*
import grails.plugins.*
import org.grails.core.artefact.*

model {
	GrailsApplication grailsApplication	
	GrailsPluginManager pluginManager
}

xmlDeclaration()
application {
	message "Welcome to Grails!"
    environment Environment.current.name
    appversion grailsApplication.metadata.getApplicationVersion()
    grailsversion GrailsUtil.grailsVersion
    appprofile grailsApplication.config.getProperty('grails.profile')
    groovyversion GroovySystem.getVersion()
    jvmversion System.getProperty('java.version')
    reloadingagentenabled Environment.reloadingAgentEnabled
    artefacts (
        controllers: grailsApplication.getArtefactInfo(ControllerArtefactHandler.TYPE).classesByName.size(),
        domains: grailsApplication.getArtefactInfo(DomainClassArtefactHandler.TYPE).classesByName.size(),
        services: grailsApplication.getArtefactInfo(ServiceArtefactHandler.TYPE).classesByName.size()
    )
}
