import jenkins.model.Jenkins

def env = System.getenv()

def jenkins = Jenkins.getInstance()

// Executors
jenkins.setNumExecutors(0)

// JNLP4
Set<String> agentProtocolsList = ['JNLP4-connect', 'Ping']
jenkins.setAgentProtocols(agentProtocolsList)

// CSRF
jenkins.setCrumbIssuer(new hudson.security.csrf.DefaultCrumbIssuer(true))

// Private Realm
jenkins.setSecurityRealm(new hudson.security.HudsonPrivateSecurityRealm(false))

// Logged In User Access
def strategy = new hudson.security.FullControlOnceLoggedInAuthorizationStrategy()
strategy.setAllowAnonymousRead(false)
jenkins.setAuthorizationStrategy(strategy)

// Create User
def user = jenkins.getSecurityRealm().createAccount(env.JENKINS_USER, env.JENKINS_PASS)
user.save()

// Admin
jenkins.getAuthorizationStrategy().add(Jenkins.ADMINISTER, env.JENKINS_USER)

jenkins.save()
