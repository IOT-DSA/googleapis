// This is a generated file (see the discoveryapis_generator project).

library googleapis_beta.cloudresourcemanager.v1beta1;

import 'dart:core' as core;
import 'dart:async' as async;
import 'dart:convert' as convert;

import 'package:_discoveryapis_commons/_discoveryapis_commons.dart' as commons;
import 'package:crypto/crypto.dart' as crypto;
import 'package:http/http.dart' as http;

export 'package:_discoveryapis_commons/_discoveryapis_commons.dart' show
    ApiRequestError, DetailedApiRequestError;

const core.String USER_AGENT = 'dart-api-client cloudresourcemanager/v1beta1';

/**
 * The Google Cloud Resource Manager API provides methods for creating, reading,
 * and updating of project metadata.
 */
class CloudresourcemanagerApi {
  /** View and manage your data across Google Cloud Platform services */
  static const CloudPlatformScope = "https://www.googleapis.com/auth/cloud-platform";


  final commons.ApiRequester _requester;

  ProjectsResourceApi get projects => new ProjectsResourceApi(_requester);

  CloudresourcemanagerApi(http.Client client, {core.String rootUrl: "https://cloudresourcemanager.googleapis.com/", core.String servicePath: ""}) :
      _requester = new commons.ApiRequester(client, rootUrl, servicePath, USER_AGENT);
}


class ProjectsResourceApi {
  final commons.ApiRequester _requester;

  ProjectsResourceApi(commons.ApiRequester client) : 
      _requester = client;

  /**
   * Creates a project resource. Initially, the project resource is owned by its
   * creator exclusively. The creator can later grant permission to others to
   * read or update the project. Several APIs are activated automatically for
   * the project, including Google Cloud Storage.
   *
   * [request] - The metadata request object.
   *
   * Request parameters:
   *
   * Completes with a [Project].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method will complete with the same error.
   */
  async.Future<Project> create(Project request) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }

    _url = 'v1beta1/projects';

    var _response = _requester.request(_url,
                                       "POST",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new Project.fromJson(data));
  }

  /**
   * Marks the project identified by the specified `project_id` (for example,
   * `my-project-123`) for deletion. This method will only affect the project if
   * the following criteria are met: + The project does not have a billing
   * account associated with it. + The project has a lifecycle state of
   * [ACTIVE][google.cloudresourcemanager.projects.v1beta1.LifecycleState.ACTIVE].
   * This method changes the project's lifecycle state from
   * [ACTIVE][google.cloudresourcemanager.projects.v1beta1.LifecycleState.ACTIVE]
   * to [DELETE_REQUESTED]
   * [google.cloudresourcemanager.projects.v1beta1.LifecycleState.DELETE_REQUESTED].
   * The deletion starts at an unspecified time, at which point the lifecycle
   * state changes to [DELETE_IN_PROGRESS]
   * [google.cloudresourcemanager.projects.v1beta1.LifecycleState.DELETE_IN_PROGRESS].
   * Until the deletion completes, you can check the lifecycle state checked by
   * retrieving the project with [GetProject]
   * [google.cloudresourcemanager.projects.v1beta1.DeveloperProjects.GetProject],
   * and the project remains visible to [ListProjects]
   * [google.cloudresourcemanager.projects.v1beta1.DeveloperProjects.ListProjects].
   * However, you cannot update the project. After the deletion completes, the
   * project is not retrievable by the [GetProject]
   * [google.cloudresourcemanager.projects.v1beta1.DeveloperProjects.GetProject]
   * and [ListProjects]
   * [google.cloudresourcemanager.projects.v1beta1.DeveloperProjects.ListProjects]
   * methods. The caller must have modify permissions for this project.
   *
   * Request parameters:
   *
   * [projectId] - The project ID (for example, `foo-bar-123`). Required.
   *
   * Completes with a [Empty].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method will complete with the same error.
   */
  async.Future<Empty> delete(core.String projectId) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (projectId == null) {
      throw new core.ArgumentError("Parameter projectId is required.");
    }

    _url = 'v1beta1/projects/' + commons.Escaper.ecapeVariable('$projectId');

    var _response = _requester.request(_url,
                                       "DELETE",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new Empty.fromJson(data));
  }

  /**
   * Retrieves the project identified by the specified `project_id` (for
   * example, `my-project-123`). The caller must have read permissions for this
   * project.
   *
   * Request parameters:
   *
   * [projectId] - The project ID (for example, `my-project-123`). Required.
   *
   * Completes with a [Project].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method will complete with the same error.
   */
  async.Future<Project> get(core.String projectId) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (projectId == null) {
      throw new core.ArgumentError("Parameter projectId is required.");
    }

    _url = 'v1beta1/projects/' + commons.Escaper.ecapeVariable('$projectId');

    var _response = _requester.request(_url,
                                       "GET",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new Project.fromJson(data));
  }

  /**
   * Returns the IAM access control policy for specified project.
   *
   * [request] - The metadata request object.
   *
   * Request parameters:
   *
   * [resource] - REQUIRED: The resource for which policy is being requested.
   * Resource is usually specified as a path, such as, projects/{project}.
   *
   * Completes with a [Policy].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method will complete with the same error.
   */
  async.Future<Policy> getIamPolicy(GetIamPolicyRequest request, core.String resource) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }
    if (resource == null) {
      throw new core.ArgumentError("Parameter resource is required.");
    }

    _url = 'v1beta1/projects/' + commons.Escaper.ecapeVariable('$resource') + ':getIamPolicy';

    var _response = _requester.request(_url,
                                       "POST",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new Policy.fromJson(data));
  }

  /**
   * Lists projects that are visible to the user and satisfy the specified
   * filter. This method returns projects in an unspecified order. New projects
   * do not necessarily appear at the end of the list.
   *
   * Request parameters:
   *
   * [pageToken] - A pagination token returned from a previous call to
   * ListProject that indicates from where listing should continue. Note:
   * pagination is not yet supported; the server ignores this field. Optional.
   *
   * [pageSize] - The maximum number of Projects to return in the response. The
   * server can return fewer projects than requested. If unspecified, server
   * picks an appropriate default. Note: pagination is not yet supported; the
   * server ignores this field. Optional.
   *
   * [filter] - An expression for filtering the results of the request. Filter
   * rules are case insensitive. The fields eligible for filtering are: + `name`
   * + `id` + labels.key where *key* is the name of a label Some examples of
   * using labels as filters: |Filter|Description| |------|-----------|
   * |name:*|The project has a name.| |name:Howl|The project's name is `Howl` or
   * `howl`.| |name:HOWL|Equivalent to above.| |NAME:howl|Equivalent to above.|
   * |labels.color:*|The project has the label `color`.| |labels.color:red|The
   * project's label `color` has the value `red`.|
   * |labels.color:red label.size:big|The project's label `color` has the value
   * `red` and its label `size` has the value `big`. Optional.
   *
   * Completes with a [ListProjectsResponse].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method will complete with the same error.
   */
  async.Future<ListProjectsResponse> list({core.String pageToken, core.int pageSize, core.String filter}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (pageToken != null) {
      _queryParams["pageToken"] = [pageToken];
    }
    if (pageSize != null) {
      _queryParams["pageSize"] = ["${pageSize}"];
    }
    if (filter != null) {
      _queryParams["filter"] = [filter];
    }

    _url = 'v1beta1/projects';

    var _response = _requester.request(_url,
                                       "GET",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new ListProjectsResponse.fromJson(data));
  }

  /**
   * Sets the IAM access control policy for the specified project. We do not
   * currently support 'domain:' prefixed members in a Binding of a Policy.
   * Calling this method requires enabling the App Engine Admin API.
   *
   * [request] - The metadata request object.
   *
   * Request parameters:
   *
   * [resource] - REQUIRED: The resource for which policy is being specified.
   * Resource is usually specified as a path, such as,
   * projects/{project}/zones/{zone}/disks/{disk}.
   *
   * Completes with a [Policy].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method will complete with the same error.
   */
  async.Future<Policy> setIamPolicy(SetIamPolicyRequest request, core.String resource) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }
    if (resource == null) {
      throw new core.ArgumentError("Parameter resource is required.");
    }

    _url = 'v1beta1/projects/' + commons.Escaper.ecapeVariable('$resource') + ':setIamPolicy';

    var _response = _requester.request(_url,
                                       "POST",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new Policy.fromJson(data));
  }

  /**
   * Tests the specified permissions against the IAM access control policy for
   * the specified project.
   *
   * [request] - The metadata request object.
   *
   * Request parameters:
   *
   * [resource] - REQUIRED: The resource for which policy detail is being
   * requested. Resource is usually specified as a path, such as,
   * projects/{project}.
   *
   * Completes with a [TestIamPermissionsResponse].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method will complete with the same error.
   */
  async.Future<TestIamPermissionsResponse> testIamPermissions(TestIamPermissionsRequest request, core.String resource) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }
    if (resource == null) {
      throw new core.ArgumentError("Parameter resource is required.");
    }

    _url = 'v1beta1/projects/' + commons.Escaper.ecapeVariable('$resource') + ':testIamPermissions';

    var _response = _requester.request(_url,
                                       "POST",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new TestIamPermissionsResponse.fromJson(data));
  }

  /**
   * Restores the project identified by the specified `project_id` (for example,
   * `my-project-123`). You can only use this method for a project that has a
   * lifecycle state of [DELETE_REQUESTED]
   * [google.cloudresourcemanager.projects.v1beta1.LifecycleState.DELETE_REQUESTED].
   * After deletion starts, as indicated by a lifecycle state of
   * [DELETE_IN_PROGRESS]
   * [google.cloudresourcemanager.projects.v1beta1.LifecycleState.DELETE_IN_PROGRESS],
   * the project cannot be restored. The caller must have modify permissions for
   * this project.
   *
   * Request parameters:
   *
   * [projectId] - The project ID (for example, `foo-bar-123`). Required.
   *
   * Completes with a [Empty].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method will complete with the same error.
   */
  async.Future<Empty> undelete(core.String projectId) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (projectId == null) {
      throw new core.ArgumentError("Parameter projectId is required.");
    }

    _url = 'v1beta1/projects/' + commons.Escaper.ecapeVariable('$projectId') + ':undelete';

    var _response = _requester.request(_url,
                                       "POST",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new Empty.fromJson(data));
  }

  /**
   * Updates the attributes of the project identified by the specified
   * `project_id` (for example, `my-project-123`). The caller must have modify
   * permissions for this project.
   *
   * [request] - The metadata request object.
   *
   * Request parameters:
   *
   * [projectId] - The project ID (for example, `my-project-123`). Required.
   *
   * Completes with a [Project].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method will complete with the same error.
   */
  async.Future<Project> update(Project request, core.String projectId) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }
    if (projectId == null) {
      throw new core.ArgumentError("Parameter projectId is required.");
    }

    _url = 'v1beta1/projects/' + commons.Escaper.ecapeVariable('$projectId');

    var _response = _requester.request(_url,
                                       "PUT",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new Project.fromJson(data));
  }

}



/** Associates members with roles. See below for allowed formats of members. */
class Binding {
  /**
   * Format of member entries: 1. allUsers Matches any requesting principal
   * (users, service accounts or anonymous). 2. allAuthenticatedUsers Matches
   * any requesting authenticated principal (users or service accounts). 3.
   * user:{emailid} A google user account using an email address. For example
   * alice@gmail.com, joe@example.com 4. serviceAccount:{emailid} An service
   * account email. 5. group:{emailid} A google group with an email address. For
   * example auth-ti-cloud@google.com 6. domain:{domain} A Google Apps domain
   * name. For example google.com, example.com
   */
  core.List<core.String> members;
  /**
   * The name of the role to which the members should be bound. Examples:
   * "roles/viewer", "roles/editor", "roles/owner". Required
   */
  core.String role;

  Binding();

  Binding.fromJson(core.Map _json) {
    if (_json.containsKey("members")) {
      members = _json["members"];
    }
    if (_json.containsKey("role")) {
      role = _json["role"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (members != null) {
      _json["members"] = members;
    }
    if (role != null) {
      _json["role"] = role;
    }
    return _json;
  }
}

/** Write a Cloud Audit log */
class CloudAuditOptions {

  CloudAuditOptions();

  CloudAuditOptions.fromJson(core.Map _json) {
  }

  core.Map toJson() {
    var _json = new core.Map();
    return _json;
  }
}

/** A condition to be met. */
class Condition {
  /**
   * Trusted attributes supplied by the IAM system.
   * Possible string values are:
   * - "NO_ATTR" : A NO_ATTR.
   * - "AUTHORITY" : A AUTHORITY.
   * - "ATTRIBUTION" : A ATTRIBUTION.
   */
  core.String iam;
  /**
   * An operator to apply the subject with.
   * Possible string values are:
   * - "NO_OP" : A NO_OP.
   * - "EQUALS" : A EQUALS.
   * - "NOT_EQUALS" : A NOT_EQUALS.
   * - "IN" : A IN.
   * - "NOT_IN" : A NOT_IN.
   * - "DISCHARGED" : A DISCHARGED.
   */
  core.String op;
  /** Trusted attributes discharged by the service. */
  core.String svc;
  /**
   * Trusted attributes supplied by any service that owns resources and uses the
   * IAM system for access control.
   * Possible string values are:
   * - "NO_ATTR" : A NO_ATTR.
   * - "REGION" : A REGION.
   * - "SERVICE" : A SERVICE.
   * - "NAME" : A NAME.
   * - "IP" : A IP.
   */
  core.String sys;
  /** The object of the condition. Exactly one of these must be set. */
  core.String value;
  /** The objects of the condition. This is mutually exclusive with 'value'. */
  core.List<core.String> values;

  Condition();

  Condition.fromJson(core.Map _json) {
    if (_json.containsKey("iam")) {
      iam = _json["iam"];
    }
    if (_json.containsKey("op")) {
      op = _json["op"];
    }
    if (_json.containsKey("svc")) {
      svc = _json["svc"];
    }
    if (_json.containsKey("sys")) {
      sys = _json["sys"];
    }
    if (_json.containsKey("value")) {
      value = _json["value"];
    }
    if (_json.containsKey("values")) {
      values = _json["values"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (iam != null) {
      _json["iam"] = iam;
    }
    if (op != null) {
      _json["op"] = op;
    }
    if (svc != null) {
      _json["svc"] = svc;
    }
    if (sys != null) {
      _json["sys"] = sys;
    }
    if (value != null) {
      _json["value"] = value;
    }
    if (values != null) {
      _json["values"] = values;
    }
    return _json;
  }
}

/** Options for counters */
class CounterOptions {
  /** The field value to attribute. */
  core.String field;
  /** The metric to update. */
  core.String metric;

  CounterOptions();

  CounterOptions.fromJson(core.Map _json) {
    if (_json.containsKey("field")) {
      field = _json["field"];
    }
    if (_json.containsKey("metric")) {
      metric = _json["metric"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (field != null) {
      _json["field"] = field;
    }
    if (metric != null) {
      _json["metric"] = metric;
    }
    return _json;
  }
}

/** Write a Data Access (Gin) log */
class DataAccessOptions {

  DataAccessOptions();

  DataAccessOptions.fromJson(core.Map _json) {
  }

  core.Map toJson() {
    var _json = new core.Map();
    return _json;
  }
}

/**
 * A generic empty message that you can re-use to avoid defining duplicated
 * empty messages in your APIs. A typical example is to use it as the request or
 * the response type of an API method. For instance: service Foo { rpc
 * Bar(google.protobuf.Empty) returns (google.protobuf.Empty); } The JSON
 * representation for `Empty` is empty JSON object `{}`.
 */
class Empty {

  Empty();

  Empty.fromJson(core.Map _json) {
  }

  core.Map toJson() {
    var _json = new core.Map();
    return _json;
  }
}

/** Request message for `GetIamPolicy` method. */
class GetIamPolicyRequest {

  GetIamPolicyRequest();

  GetIamPolicyRequest.fromJson(core.Map _json) {
  }

  core.Map toJson() {
    var _json = new core.Map();
    return _json;
  }
}

/**
 * A page of the response received from the
 * [ListProjects][google.cloudresourcemanager.projects.v1beta1.DeveloperProjects.ListProjects]
 * method. A paginated response where more pages are available has
 * `next_page_token` set. This token can be used in a subsequent request to
 * retrieve the next request page.
 */
class ListProjectsResponse {
  /**
   * Pagination token. If the result set is too large to fit in a single
   * response, this token is returned. It encodes the position of the current
   * result cursor. Feeding this value into a new list request with the
   * `page_token` parameter gives the next page of the results. When
   * `next_page_token` is not filled in, there is no next page and the list
   * returned is the last page in the result set. Pagination tokens have a
   * limited lifetime. Note: pagination is not yet supported; the server will
   * not set this field.
   */
  core.String nextPageToken;
  /**
   * The list of projects that matched the list filter. This list can be
   * paginated.
   */
  core.List<Project> projects;

  ListProjectsResponse();

  ListProjectsResponse.fromJson(core.Map _json) {
    if (_json.containsKey("nextPageToken")) {
      nextPageToken = _json["nextPageToken"];
    }
    if (_json.containsKey("projects")) {
      projects = _json["projects"].map((value) => new Project.fromJson(value)).toList();
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (nextPageToken != null) {
      _json["nextPageToken"] = nextPageToken;
    }
    if (projects != null) {
      _json["projects"] = projects.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

/**
 * Specifies what kind of log the caller must write Increment a streamz counter
 * with the specified metric and field names. Metric names should start with a
 * '/', generally be lowercase-only, and end in "_count". Field names should not
 * contain an initial slash. The actual exported metric names will have
 * "/iam/policy" prepended. Field names correspond to IAM request parameters and
 * field values are their respective values. At present only "iam_principal",
 * corresponding to IAMContext.principal, is supported. Examples: counter {
 * metric: "/debug_access_count" field: "iam_principal" } ==> increment counter
 * /iam/policy/backend_debug_access_count {iam_principal=[value of
 * IAMContext.principal]} At this time we do not support: * multiple field names
 * (though this may be supported in the future) * decrementing the counter *
 * incrementing it by anything other than 1
 */
class LogConfig {
  /** Cloud audit options. */
  CloudAuditOptions cloudAudit;
  /** Counter options. */
  CounterOptions counter;
  /** Data access options. */
  DataAccessOptions dataAccess;

  LogConfig();

  LogConfig.fromJson(core.Map _json) {
    if (_json.containsKey("cloudAudit")) {
      cloudAudit = new CloudAuditOptions.fromJson(_json["cloudAudit"]);
    }
    if (_json.containsKey("counter")) {
      counter = new CounterOptions.fromJson(_json["counter"]);
    }
    if (_json.containsKey("dataAccess")) {
      dataAccess = new DataAccessOptions.fromJson(_json["dataAccess"]);
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (cloudAudit != null) {
      _json["cloudAudit"] = (cloudAudit).toJson();
    }
    if (counter != null) {
      _json["counter"] = (counter).toJson();
    }
    if (dataAccess != null) {
      _json["dataAccess"] = (dataAccess).toJson();
    }
    return _json;
  }
}

/**
 * # Overview The `Policy` defines an access control policy language. It is used
 * to define policies that are attached to resources like files, folders, VMs,
 * etc. # Policy structure A `Policy` consists of a list of bindings. A
 * `Binding` binds a set of members to a role, where the members include user
 * accounts, user groups, user domains, and service accounts. A 'role' is a
 * named set of permissions, defined by IAM. The definition of a role is outside
 * the policy. A permission check first determines the roles that include the
 * specified permission, and then determines if the principal specified is a
 * member of a binding to at least one of these roles. The membership check is
 * recursive when a group is bound to a role. Policy examples: ``` { "bindings":
 * [ { "role": "roles/owner", "members": [ "user:mike@example.com",
 * "group:admins@example.com", "domain:google.com",
 * "serviceAccount:frontend@example.iam.gserviceaccounts.com"] }, { "role":
 * "roles/viewer", "members": ["user:sean@example.com"] } ] } ```
 */
class Policy {
  /**
   * It is an error to specify multiple bindings for the same role. It is an
   * error to specify a binding with no members.
   */
  core.List<Binding> bindings;
  /** Can be used to perform a read-modify-write. */
  core.String etag;
  core.List<core.int> get etagAsBytes {
    return crypto.CryptoUtils.base64StringToBytes(etag);
  }

  void set etagAsBytes(core.List<core.int> _bytes) {
    etag = crypto.CryptoUtils.bytesToBase64(_bytes, urlSafe: true);
  }
  core.List<Rule> rules;
  /**
   * The policy language version. The version of the policy is represented by
   * the etag. The default version is 0.
   */
  core.int version;

  Policy();

  Policy.fromJson(core.Map _json) {
    if (_json.containsKey("bindings")) {
      bindings = _json["bindings"].map((value) => new Binding.fromJson(value)).toList();
    }
    if (_json.containsKey("etag")) {
      etag = _json["etag"];
    }
    if (_json.containsKey("rules")) {
      rules = _json["rules"].map((value) => new Rule.fromJson(value)).toList();
    }
    if (_json.containsKey("version")) {
      version = _json["version"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (bindings != null) {
      _json["bindings"] = bindings.map((value) => (value).toJson()).toList();
    }
    if (etag != null) {
      _json["etag"] = etag;
    }
    if (rules != null) {
      _json["rules"] = rules.map((value) => (value).toJson()).toList();
    }
    if (version != null) {
      _json["version"] = version;
    }
    return _json;
  }
}

/**
 * A Project is a high-level Google Cloud Platform entity. It is a container for
 * ACLs, APIs, AppEngine Apps, VMs, and other Google Cloud Platform resources.
 */
class Project {
  /** Creation time. Read-only. */
  core.String createTime;
  /**
   * The labels associated with this project. Label keys must be between 1 and
   * 63 characters long and must conform to the following regular expression:
   * \[a-z\](\[-a-z0-9\]*\[a-z0-9\])?. Label values must be between 0 and 63
   * characters long and must conform to the regular expression
   * (\[a-z\](\[-a-z0-9\]*\[a-z0-9\])?)?. No more than 256 labels can be
   * associated with a given resource. Clients should store labels in a
   * representation such as JSON that does not depend on specific characters
   * being disallowed. Example: "environment" : "dev" Read-write.
   */
  core.Map<core.String, core.String> labels;
  /**
   * The project lifecycle state. Read-only.
   * Possible string values are:
   * - "LIFECYCLE_STATE_UNSPECIFIED" : A LIFECYCLE_STATE_UNSPECIFIED.
   * - "ACTIVE" : A ACTIVE.
   * - "DELETE_REQUESTED" : A DELETE_REQUESTED.
   * - "DELETE_IN_PROGRESS" : A DELETE_IN_PROGRESS.
   */
  core.String lifecycleState;
  /**
   * The user-assigned name of the project. This field is optional and can
   * remain unset. Allowed characters are: lowercase and uppercase letters,
   * numbers, hyphen, single-quote, double-quote, space, and exclamation point.
   * Example: My Project Read-write.
   */
  core.String name;
  /**
   * The unique, user-assigned ID of the project. It must be 6 to 30 lowercase
   * letters, digits, or hyphens. It must start with a letter. Trailing hyphens
   * are prohibited. Example: tokyo-rain-123 Read-only after creation.
   */
  core.String projectId;
  /**
   * The number uniquely identifying the project. Example: 415104041262
   * Read-only.
   */
  core.String projectNumber;

  Project();

  Project.fromJson(core.Map _json) {
    if (_json.containsKey("createTime")) {
      createTime = _json["createTime"];
    }
    if (_json.containsKey("labels")) {
      labels = _json["labels"];
    }
    if (_json.containsKey("lifecycleState")) {
      lifecycleState = _json["lifecycleState"];
    }
    if (_json.containsKey("name")) {
      name = _json["name"];
    }
    if (_json.containsKey("projectId")) {
      projectId = _json["projectId"];
    }
    if (_json.containsKey("projectNumber")) {
      projectNumber = _json["projectNumber"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (createTime != null) {
      _json["createTime"] = createTime;
    }
    if (labels != null) {
      _json["labels"] = labels;
    }
    if (lifecycleState != null) {
      _json["lifecycleState"] = lifecycleState;
    }
    if (name != null) {
      _json["name"] = name;
    }
    if (projectId != null) {
      _json["projectId"] = projectId;
    }
    if (projectNumber != null) {
      _json["projectNumber"] = projectNumber;
    }
    return _json;
  }
}

/** A rule to be applied in a Policy. */
class Rule {
  /**
   * Required
   * Possible string values are:
   * - "NO_ACTION" : A NO_ACTION.
   * - "ALLOW" : A ALLOW.
   * - "ALLOW_WITH_LOG" : A ALLOW_WITH_LOG.
   * - "DENY" : A DENY.
   * - "DENY_WITH_LOG" : A DENY_WITH_LOG.
   * - "LOG" : A LOG.
   */
  core.String action;
  /** Additional restrictions that must be met */
  core.List<Condition> conditions;
  /** Human-readable description of the rule. */
  core.String description;
  /**
   * The rule matches if the PRINCIPAL/AUTHORITY_SELECTOR is in this set of
   * entries.
   */
  core.List<core.String> in_;
  /**
   * The config returned to callers of tech.iam.IAM.CheckPolicy for any entries
   * that match the LOG action.
   */
  core.List<LogConfig> logConfig;
  /**
   * The rule matches if the PRINCIPAL/AUTHORITY_SELECTOR is not in this set of
   * entries. The formation for in and not_in entries is the same as members in
   * a Binding above.
   */
  core.List<core.String> notIn;
  /**
   * A permission is a string of form '..' (e.g., 'storage.buckets.list'). A
   * value of '*' matches all permissions, and a verb part of '*' (e.g.,
   * 'storage.buckets.*') matches all verbs.
   */
  core.List<core.String> permissions;

  Rule();

  Rule.fromJson(core.Map _json) {
    if (_json.containsKey("action")) {
      action = _json["action"];
    }
    if (_json.containsKey("conditions")) {
      conditions = _json["conditions"].map((value) => new Condition.fromJson(value)).toList();
    }
    if (_json.containsKey("description")) {
      description = _json["description"];
    }
    if (_json.containsKey("in")) {
      in_ = _json["in"];
    }
    if (_json.containsKey("logConfig")) {
      logConfig = _json["logConfig"].map((value) => new LogConfig.fromJson(value)).toList();
    }
    if (_json.containsKey("notIn")) {
      notIn = _json["notIn"];
    }
    if (_json.containsKey("permissions")) {
      permissions = _json["permissions"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (action != null) {
      _json["action"] = action;
    }
    if (conditions != null) {
      _json["conditions"] = conditions.map((value) => (value).toJson()).toList();
    }
    if (description != null) {
      _json["description"] = description;
    }
    if (in_ != null) {
      _json["in"] = in_;
    }
    if (logConfig != null) {
      _json["logConfig"] = logConfig.map((value) => (value).toJson()).toList();
    }
    if (notIn != null) {
      _json["notIn"] = notIn;
    }
    if (permissions != null) {
      _json["permissions"] = permissions;
    }
    return _json;
  }
}

/** Request message for `SetIamPolicy` method. */
class SetIamPolicyRequest {
  /**
   * REQUIRED: The complete policy to be applied to the 'resource'. The size of
   * the policy is limited to a few 10s of KB. An empty policy is in general a
   * valid policy but certain services (like Projects) might reject them.
   */
  Policy policy;

  SetIamPolicyRequest();

  SetIamPolicyRequest.fromJson(core.Map _json) {
    if (_json.containsKey("policy")) {
      policy = new Policy.fromJson(_json["policy"]);
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (policy != null) {
      _json["policy"] = (policy).toJson();
    }
    return _json;
  }
}

/** Request message for `TestIamPermissions` method. */
class TestIamPermissionsRequest {
  /**
   * The set of permissions to check for the 'resource'. Permissions with
   * wildcards (such as '*' or 'storage.*') are not allowed.
   */
  core.List<core.String> permissions;

  TestIamPermissionsRequest();

  TestIamPermissionsRequest.fromJson(core.Map _json) {
    if (_json.containsKey("permissions")) {
      permissions = _json["permissions"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (permissions != null) {
      _json["permissions"] = permissions;
    }
    return _json;
  }
}

/** Response message for `TestIamPermissions` method. */
class TestIamPermissionsResponse {
  /**
   * A subset of `TestPermissionsRequest.permissions` that the caller is
   * allowed.
   */
  core.List<core.String> permissions;

  TestIamPermissionsResponse();

  TestIamPermissionsResponse.fromJson(core.Map _json) {
    if (_json.containsKey("permissions")) {
      permissions = _json["permissions"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (permissions != null) {
      _json["permissions"] = permissions;
    }
    return _json;
  }
}