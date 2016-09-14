# PUPPET-SUBSCRIPTION_MANAGER
[![Build Status](https://travis-ci.org/cristifalcas/puppet-subscription_manager.png?branch=master)](https://travis-ci.org/cristifalcas/puppet-subscription_manager)

This module is a fork from https://github.com/jlaska/puppet-subscription_manager. It adds package management and config file management.

## License

Read Licence file for more information.

## Requirements

## Authors
* Gaël Chamoulaud (gchamoul at redhat dot com)
* James Laska (jlaska at redhat dot com)
* Cristian Falcas (cristi.falcas at gmail dot com)

## Usage:

    include ::subscription_manager

### Parameters
- **$version**:                       subscription-manager package version, it's passed to ensure parameter of package resource
                                      can be set to specific version number, 'latest', 'present' etc.
- **install_firstboot**:              boolean; controls whether firstboot is installed or not. Defaults to false
- **install_gui**:                    boolean; controls whether gui is installed or not. Defaults to false
- **hostname**:                       Server hostname
- **port**:                           Server port
- **baseurl**:                        Content base URL
- **manage_repos**:                   Manage generation of yum repositories for subscribed content
- **insecure**:                       Set to 1 to disable certificate validation
- **full_refresh_on_yum**:            Refresh repo files with server overrides on every yum command
- **report_package_profile**:         If set to zero, the client will not report the package profile to
                                      the subscription management service.

## Types and Providers

The module adds the following new types:

* `rhsm_register` for managing Red Hat Subscriptions
* `rhsm_repo`     for managing Red Hat Repository Subscriptions

### rhsm_register Parameters

- **activationkeys**: The activation key to use when registering the system (cannot be used with username and password)
- **ensure**: Valid values are `present`, `absent`. Default value is `present`.
- **force**: Should the registration be forced. Use this option with caution, setting it true will cause the system to be unregistered before running 'subscription-manager register'. Default value `false`.
- **hardware**: Whether or not the hardware information should be probed. Default value is `true`.
- **password**: The password to use when registering the system
- **server_hostname**: Specify a url to use as a server
- **username**: The username to use when registering the system
- **pool**: A specific license pool to attach the system to

### rhsm_register Examples

Register clients to Red Hat Subscription Management using an activation key:

<pre>
rhsm_register { 'satelite.example.com':
  server_hostname => 'my-satelite.example.com',
  activationkeys => '1-myactivationkey',
}
</pre>

Register clients to Red Hat Subscription management using a username and password:

<pre>
rhsm_register { 'subscription.rhn.example.com':
  username        => 'myusername',
  password        => 'mypassword',
  autosubscribe   => true,
  force           => true,
}
</pre>

Register clients to Red Hat Subscription management and attach to a specific license pool:

<pre>
rhsm_register { 'subscription.rhn.example.com':
  username        => 'myusername',
  password        => 'mypassword',
  pool		  => 'mypoolid',
}
</pre>

### rhsm_repo Parameters

- **ensure**: Valid values are `present`, `absent`. Default value is `present`.
- **name**: The name of the repo registration to add

### rhsm_repo Examples

Add a repo:

<pre>
rhsm_repo { 'rhel-7-server-optional-rpms': }
</pre>

Remove a repo:

<pre>
rhsm_repo { 'rhel-7-server-optional-rpms': 
  ensure	  => 'absent',
}
</pre>

## Installing

In your puppet modules directory:

    git clone https://github.com/strider/puppet-subscription_manager.git

Ensure the module is present in your puppetmaster's own environment (it doesn't
have to use it) and that the master has pluginsync enabled.  Run the agent on
the puppetmaster to cause the custom types to be synced to its local libdir
(`puppet master --configprint libdir`) and then restart the puppetmaster so it
loads them.

## Issues

Please file any issues or suggestions on [on GitHub](https://github.com/jlaska/puppet-subscription_manager/issues)

