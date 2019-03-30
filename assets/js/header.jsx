
import React from 'react';
import { Link } from 'react-router-dom';
import $ from 'jquery';
import api from './api';
import { connect } from 'react-redux';

function Header(props) {
    let { session } = props;
    let session_view;
    if (!session) {
        session_view = <nav class="navbar navbar-expand-sm navbar-light bg-primary"><div className="form-inline my-2">
            <input id="login-email" type="email" placeholder="email" />
            <input id="login-pass" type="password" placeholder="password" />
            <button className="btn btn-secondary" onClick={() => { api.create_session($('#login-email').val(), $('#login-pass').val()) }}>Login</button>
        </div></nav>;
    } else {
        session_view = <nav class="navbar navbar-expand-sm navbar-light bg-primary"><div className="form-inline my-2">
            <h5> <div className="my-3"> {session.data.user_email} </div></h5>
            <div className="col-1"><button className="btn btn-secondary" onClick={() => { api.endSession() }}>Logout</button></div>
        </div></nav>;
    }

    return <nav class="navbar navbar-expand-sm navbar-light bg-primary">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <h3><Link to={"/"} className="nav-link">Task Tracker</Link></h3>
            </li>
            <li class="nav-item nav-link">
                <Link to={"/explore"} onClick={() => {api.fetch_restaurants()}} className="nav-link">Explore</Link>
            </li>
            <li class="nav-item nav-link">
                <p><Link to={"/user"} onClick={api.fetch_users()} className="nav-link">Profile</Link></p>
            </li>
            <li class="nav-item nav-link">
                <p><Link to={"/chat"} onClick={api.fetch_friends()} className="nav-link">Chat</Link></p>
            </li>
          </ul>
        <div className="col-6 float-right">
            {session_view}
        </div>
    </nav>
    
}

export default connect((state) => { return { session: state.session }; })(Header);