import store from "./store";

class TheServer {
  fetch_path(path, callback) {
    $.ajax(path, {
      method: "get",
      dataType: "json",
      contentType: "application/json; charset=UTF-8",
      data: "",
      success: callback
    });
  }

  fetch_users() {
    this.fetch_path("/api/v1/users", resp => {
      store.dispatch({
        type: "USER_LIST",
        data: resp.data
      });
    });
  }

  get_username(id) {
    this.fetch_path("/api/v1/users/" + id, resp => {
      return resp.data.name;
    });
  }

  create_user() {
    let name = $("#registerName").val();
    let email = $("#registerEmail").val();
    let pass = $("#registerPassword").val();
    let newuser = { name: name, email: email, password_hash: pass };

    $.ajax("/api/v1/users", {
      method: "post",
      dataType: "json",
      contentType: "application/json; charset=UTF-8",
      data: JSON.stringify({ user: newuser }),
      success: resp => {
        this.create_session_register(email, pass);
        console.log(resp.data);
        window.location = "../";
      }
    });
  }


  create_session() {
    let name = $("#loginName").val();
    let email = $("#loginEmail").val();
    let password = $("#loginPassword").val();

    $.ajax("/api/v1/sessions", {
      method: "post",
      dataType: "json",
      contentType: "application/json; charset=UTF-8",
      data: JSON.stringify({ email, password }),
      success: resp => {
        store.dispatch({
          type: "NEW_SESSION",
          data: resp.data
        });
        localStorage.setItem("token", resp.data.token);
        localStorage.setItem("user_id", resp.data.user_id);
        localStorage.setItem("user_name", resp.data.user_name);
        location.reload();
      }
    });
  }

  create_session_register(email, password) {
    $.ajax("/api/v1/sessions", {
      method: "post",
      dataType: "json",
      contentType: "application/json; charset=UTF-8",
      data: JSON.stringify({ email, password }),
      success: resp => {
        store.dispatch({
          type: "NEW_SESSION",
          data: resp.data
        });
        localStorage.setItem("token", resp.data.token);
        localStorage.setItem("user_id", resp.data.user_id);
        localStorage.setItem("user_name", resp.data.user_name);
        window.location = "../";
      }
    });
  }

  logout_user() {
    store.dispatch({
      type: "LOGOUT_OF_SESSION",
      data: null
    });
    localStorage.removeItem("token");
    localStorage.removeItem("user_id");
    localStorage.removeItem("user_name");

    window.location = "../";
  }

}