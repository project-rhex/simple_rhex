Simple RHEx Web Application
---------------------------

This is a basic web application that shows how OpenID Connect can be applied to the healthcare domain. It will allow for the upload and viewing of clinical documents.

Requirements
------------

This application relies on the [OpenID Connect Gateway](https://github.com/project-rhex/openid_connect_gateway) for restricting access. The gateway will authenticate users before they
can access the web application. Once the user is authenticated, they will be passed along to this application with the user information available in the HTTP_X_AUTH HTTP header.

License
=======

Copyright 2012 The MITRE Corporation

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.