<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<script>
	function fn_goMailWriteView(){
		location.href = "/workfit/mail/mailWrite";
	}
	
</script>

<button type="button" class="btn btn-primary" onclick="fn_goMailWriteView()">메일작성</button>

<!-- <button type="button" class="btn btn-danger btn-block" data-toggle="modal" data-target="#compose-modal">Compose</button> -->


<!-- <div id="compose-modal" class="modal fade" tabindex="-1" aria-labelledby="compose-header-modalLabel" style="display: none;" aria-hidden="true"> -->
<!-- 	<div class="modal-dialog"> -->
<!-- 		<div class="modal-content"> -->
<!-- 			<div class="modal-header modal-colored-header bg-primary"> -->
<!-- 				<h4 class="modal-title" id="compose-header-modalLabel">New Message</h4> -->
<!-- 				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button> -->
<!-- 			</div> -->
<!-- 			<div class="modal-body p-3"> -->
<!-- 				<form class="p-1"> -->
<!-- 					<div class="form-group mb-2"> -->
<!-- 						<label for="msgto">To</label> <input type="text" id="msgto" class="form-control" placeholder="example@email.com"> -->
<!-- 					</div> -->
<!-- 					<div class="form-group mb-2"> -->
<!-- 						<label for="mailsubject">Subject</label> <input type="text" id="mailsubject" class="form-control" placeholder="your subject"> -->
<!-- 					</div> -->
<!-- 					<div class="form-group write-mdg-box mb-3"> -->
<!-- 						<label>Message</label> -->
<!-- 						<textarea id="simplemde1" style="display: none;"></textarea> -->
						
						
<!-- 						<div class="editor-toolbar"> -->
<!-- 							<a title="Bold (Ctrl-B)" tabindex="-1" class="fa fa-bold"></a><a title="Italic (Ctrl-I)" tabindex="-1" class="fa fa-italic"></a><a title="Heading (Ctrl-H)" tabindex="-1" class="fa fa-header"></a><i class="separator">|</i><a title="Quote (Ctrl-')" tabindex="-1" class="fa fa-quote-left"></a><a title="Generic List (Ctrl-L)" tabindex="-1" class="fa fa-list-ul"></a><a title="Numbered List (Ctrl-Alt-L)" tabindex="-1" class="fa fa-list-ol"></a><i class="separator">|</i><a title="Create Link (Ctrl-K)" tabindex="-1" class="fa fa-link"></a><a title="Insert Image (Ctrl-Alt-I)" tabindex="-1" class="fa fa-picture-o"></a><i class="separator">|</i><a title="Toggle Preview (Ctrl-P)" tabindex="-1" class="fa fa-eye no-disable"></a><a title="Toggle Side by Side (F9)" tabindex="-1" class="fa fa-columns no-disable no-mobile"></a><a title="Toggle Fullscreen (F11)" tabindex="-1" class="fa fa-arrows-alt no-disable no-mobile"></a><i class="separator">|</i><a title="Markdown Guide" tabindex="-1" -->
<!-- 								class="fa fa-question-circle" href="https://simplemde.com/markdown-guide" target="_blank"></a> -->
<!-- 						</div> -->
						
						
<!-- 						<div class="CodeMirror cm-s-paper CodeMirror-wrap CodeMirror-empty"> -->
<!-- 							<div style="overflow: hidden; position: relative; width: 3px; height: 0px; top: 15px; left: 15px;"> -->
<!-- 								<textarea autocorrect="off" autocapitalize="off" spellcheck="false" tabindex="0" style="position: absolute; padding: 0px; width: 1000px; height: 1em; outline: none;"></textarea> -->
<!-- 							</div> -->
<!-- 							<div class="CodeMirror-vscrollbar" cm-not-content="true"> -->
<!-- 								<div style="min-width: 1px; height: 0px;"></div> -->
<!-- 							</div> -->
<!-- 							<div class="CodeMirror-hscrollbar" cm-not-content="true"> -->
<!-- 								<div style="height: 100%; min-height: 1px; width: 0px;"></div> -->
<!-- 							</div> -->
<!-- 							<div class="CodeMirror-scrollbar-filler" cm-not-content="true"></div> -->
<!-- 							<div class="CodeMirror-gutter-filler" cm-not-content="true"></div> -->
<!-- 							<div class="CodeMirror-scroll" tabindex="-1"> -->
<!-- 								<div class="CodeMirror-sizer" style="margin-left: 0px; margin-bottom: -17px; border-right-width: 13px; min-height: 30px; padding-right: 0px; padding-bottom: 0px;"> -->
<!-- 									<div style="position: relative; top: 0px;"> -->
<!-- 										<div class="CodeMirror-lines"> -->
<!-- 											<div style="position: relative; outline: none;"> -->
<!-- 												<pre class="CodeMirror-placeholder" style="height: 0px; overflow: visible;">Write something..</pre> -->
<!-- 												<div class="CodeMirror-measure"> -->
<!-- 													<pre>x</pre> -->
<!-- 												</div> -->
<!-- 												<div class="CodeMirror-measure"></div> -->
<!-- 												<div style="position: relative; z-index: 1;"></div> -->
<!-- 												<div class="CodeMirror-cursors" style=""> -->
<!-- 													<div class="CodeMirror-cursor" style="left: 4px; top: 0px; height: 21.6094px;">&nbsp;</div> -->
<!-- 												</div> -->
<!-- 												<div class="CodeMirror-code"> -->
<!-- 													<pre class=" CodeMirror-line "> -->
<!-- 														<span style="padding-right: 0.1px;"><span cm-text="">​</span></span> -->
<!-- 													</pre> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								<div style="position: absolute; height: 13px; width: 1px; border-bottom: 0px solid transparent; top: 30px;"></div> -->
<!-- 								<div class="CodeMirror-gutters" style="display: none; height: 43px;"></div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="editor-preview-side"></div> -->
<!-- 					</div> -->

<!-- 					<button type="button" class="btn btn-primary" data-dismiss="modal"> -->
<!-- 						<i class="mdi mdi-send mr-1"></i> Send Message -->
<!-- 					</button> -->
<!-- 					<button type="button" class="btn btn-light" data-dismiss="modal">Cancel</button> -->
<!-- 				</form> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<!-- /.modal-content --> -->
<!-- 	</div> -->
<!-- 	<!-- /.modal-dialog --> -->
<!-- </div> -->

<div class=" mt-3">
                                                <ul class="email-list">
                                                    <li class="unread">
                                                        <div class="email-sender-info">
                                                            <div class="checkbox-wrapper-mail">
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" id="mail1">
                                                                    <label class="custom-control-label" for="mail1"></label>
                                                                </div>
                                                            </div>
                                                            <span class="star-toggle mdi mdi-star-outline text-warning"></span>
                                                            <a href="javascript: void(0);" class="email-title">Lucas Kriebel (via Twitter)</a>
                                                        </div>
                                                        <div class="email-content">
                                                            <a href="javascript: void(0);" class="email-subject">Lucas Kriebel (@LucasKriebel) has sent
                                                                you a direct message on Twitter! &nbsp;–&nbsp;
                                                                <span>@LucasKriebel - Very cool :) Nicklas, You have a new direct message.</span>
                                                            </a>
                                                            <div class="email-date">11:49 am</div>
                                                        </div>
                                                        <div class="email-action-icons">
                                                            <ul class="list-inline">
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-archive email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-delete email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-email-open email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-clock email-action-icons-item"></i></a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </li>

                                                    <li>
                                                        <div class="email-sender-info">
                                                            <div class="checkbox-wrapper-mail">
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" id="mail2">
                                                                    <label class="custom-control-label" for="mail2"></label>
                                                                </div>
                                                            </div>
                                                            <span class="star-toggle mdi mdi-star-outline"></span>
                                                            <a href="javascript: void(0);" class="email-title">Randy, me (5)</a>
                                                        </div>
                                                        <div class="email-content">
                                                            <a href="javascript: void(0);" class="email-subject">Last pic over my village &nbsp;–&nbsp;
                                                                <span>Yeah i'd like that! Do you remember the video you showed me of your train ride between Colombo and Kandy? The one with the mountain view? I would love to see that one again!</span>
                                                            </a>
                                                            <div class="email-date">5:01 am</div>
                                                        </div>
                                                        <div class="email-action-icons">
                                                            <ul class="list-inline">
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-archive email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-delete email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-email-mark-as-unread email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-clock email-action-icons-item"></i></a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="email-sender-info">
                                                            <div class="checkbox-wrapper-mail">
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" id="mail3">
                                                                    <label class="custom-control-label" for="mail3"></label>
                                                                </div>
                                                            </div>
                                                            <span class="star-toggle mdi mdi-star-outline text-warning"></span>
                                                            <a href="javascript: void(0);" class="email-title">Andrew Zimmer</a>
                                                        </div>
                                                        <div class="email-content">
                                                            <a href="javascript: void(0);" class="email-subject">Mochila Beta: Subscription Confirmed
                                                                &nbsp;–&nbsp; <span>You've been confirmed! Welcome to the ruling class of the inbox. For your records, here is a copy of the information you submitted to us...</span>
                                                            </a>
                                                            <div class="email-date">Mar 8</div>
                                                        </div>
                                                        <div class="email-action-icons">
                                                            <ul class="list-inline">
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-archive email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-delete email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-email-mark-as-unread email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-clock email-action-icons-item"></i></a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </li>
                                                    <li class="unread">
                                                        <div class="email-sender-info">
                                                            <div class="checkbox-wrapper-mail">
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" id="mail4">
                                                                    <label class="custom-control-label" for="mail4"></label>
                                                                </div>
                                                            </div>
                                                            <span class="star-toggle mdi mdi-star-outline"></span>
                                                            <a href="javascript: void(0);" class="email-title">Infinity HR</a>
                                                        </div>
                                                        <div class="email-content">
                                                            <a href="javascript: void(0);" class="email-subject">Sveriges Hetaste sommarjobb &nbsp;–&nbsp;
                                                                <span>Hej Nicklas Sandell! Vi vill bjuda in dig till "First tour 2014", ett rekryteringsevent som erbjuder jobb på 16 semesterorter iSverige.</span>
                                                            </a>
                                                            <div class="email-date">Mar 8</div>
                                                        </div>
                                                        <div class="email-action-icons">
                                                            <ul class="list-inline">
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-archive email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-delete email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-email-open email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-clock email-action-icons-item"></i></a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="email-sender-info">
                                                            <div class="checkbox-wrapper-mail">
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" id="mail5">
                                                                    <label class="custom-control-label" for="mail5"></label>
                                                                </div>
                                                            </div>
                                                            <span class="star-toggle mdi mdi-star-outline"></span>
                                                            <a href="javascript: void(0);" class="email-title">Web Support Dennis</a>
                                                        </div>
                                                        <div class="email-content">
                                                            <a href="javascript: void(0);" class="email-subject">Re: New mail settings &nbsp;–&nbsp;
                                                                <span>Will you answer him asap?</span>
                                                            </a>
                                                            <div class="email-date">Mar 7</div>
                                                        </div>
                                                        <div class="email-action-icons">
                                                            <ul class="list-inline">
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-archive email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-delete email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-email-mark-as-unread email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-clock email-action-icons-item"></i></a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="email-sender-info">
                                                            <div class="checkbox-wrapper-mail">
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" id="mail6">
                                                                    <label class="custom-control-label" for="mail6"></label>
                                                                </div>
                                                            </div>
                                                            <span class="star-toggle mdi mdi-star-outline text-warning"></span>
                                                            <a href="javascript: void(0);" class="email-title">me, Peter (2)</a>
                                                        </div>
                                                        <div class="email-content">
                                                            <a href="javascript: void(0);" class="email-subject">Off on Thursday &nbsp;–&nbsp;
                                                                <span>Eff that place, you might as well stay here with us instead! Sent from my iPhone 4 &gt; 4 mar 2014 at 5:55 pm</span>
                                                            </a>
                                                            <div class="email-date">Mar 4</div>
                                                        </div>
                                                        <div class="email-action-icons">
                                                            <ul class="list-inline">
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-archive email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-delete email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-email-mark-as-unread email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-clock email-action-icons-item"></i></a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="email-sender-info">
                                                            <div class="checkbox-wrapper-mail">
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" id="mail7">
                                                                    <label class="custom-control-label" for="mail7"></label>
                                                                </div>
                                                            </div>
                                                            <span class="star-toggle mdi mdi-star-outline"></span>
                                                            <a href="javascript: void(0);" class="email-title">Medium</a>
                                                        </div>
                                                        <div class="email-content">
                                                            <a href="javascript: void(0);" class="email-subject">This Week's Top Stories &nbsp;–&nbsp;
                                                                <span>Our top pick for you on Medium this week The Man Who Destroyed America’s Ego</span>
                                                            </a>
                                                            <div class="email-date">Feb 28</div>
                                                        </div>
                                                        <div class="email-action-icons">
                                                            <ul class="list-inline">
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-archive email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-delete email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-email-mark-as-unread email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-clock email-action-icons-item"></i></a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="email-sender-info">
                                                            <div class="checkbox-wrapper-mail">
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" id="mail8">
                                                                    <label class="custom-control-label" for="mail8"></label>
                                                                </div>
                                                            </div>
                                                            <span class="star-toggle mdi mdi-star-outline text-warning"></span>
                                                            <a href="javascript: void(0);" class="email-title">Death to Stock</a>
                                                        </div>
                                                        <div class="email-content">
                                                            <a href="javascript: void(0);" class="email-subject">Montly High-Res Photos &nbsp;–&nbsp;
                                                                <span>To create this month's pack, we hosted a party with local musician Jared Mahone here in Columbus, Ohio.</span>
                                                            </a>
                                                            <div class="email-date">Feb 28</div>
                                                        </div>
                                                        <div class="email-action-icons">
                                                            <ul class="list-inline">
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-archive email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-delete email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-email-mark-as-unread email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-clock email-action-icons-item"></i></a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="email-sender-info">
                                                            <div class="checkbox-wrapper-mail">
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" id="mail9">
                                                                    <label class="custom-control-label" for="mail9"></label>
                                                                </div>
                                                            </div>
                                                            <span class="star-toggle mdi mdi-star-outline"></span>
                                                            <a href="javascript: void(0);" class="email-title">Revibe</a>
                                                        </div>
                                                        <div class="email-content">
                                                            <a href="javascript: void(0);" class="email-subject">Weekend on Revibe &nbsp;–&nbsp;
                                                                <span>Today's Friday and we thought maybe you want some music inspiration for the weekend. Here are some trending tracks and playlists we think you should give a listen!</span>
                                                            </a>
                                                            <div class="email-date">Feb 27</div>
                                                        </div>
                                                        <div class="email-action-icons">
                                                            <ul class="list-inline">
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-archive email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-delete email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-email-mark-as-unread email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-clock email-action-icons-item"></i></a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="email-sender-info">
                                                            <div class="checkbox-wrapper-mail">
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" id="mail10">
                                                                    <label class="custom-control-label" for="mail10"></label>
                                                                </div>
                                                            </div>
                                                            <span class="star-toggle mdi mdi-star-outline"></span>
                                                            <a href="javascript: void(0);" class="email-title">Erik, me (5)</a>
                                                        </div>
                                                        <div class="email-content">
                                                            <a href="javascript: void(0);" class="email-subject">Regarding our meeting &nbsp;–&nbsp;
                                                                <span>That's great, see you on Thursday!</span>
                                                            </a>
                                                            <div class="email-date">Feb 24</div>
                                                        </div>
                                                        <div class="email-action-icons">
                                                            <ul class="list-inline">
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-archive email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-delete email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-email-mark-as-unread email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-clock email-action-icons-item"></i></a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="email-sender-info">
                                                            <div class="checkbox-wrapper-mail">
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" id="mail11">
                                                                    <label class="custom-control-label" for="mail11"></label>
                                                                </div>
                                                            </div>
                                                            <span class="star-toggle mdi mdi-star-outline text-warning"></span>
                                                            <a href="javascript: void(0);" class="email-title">KanbanFlow</a>
                                                        </div>
                                                        <div class="email-content">
                                                            <a href="javascript: void(0);" class="email-subject">Task assigned: Clone ARP's website
                                                                &nbsp;–&nbsp; <span>You have been assigned a task by Alex@Work on the board Web.</span>
                                                            </a>
                                                            <div class="email-date">Feb 24</div>
                                                        </div>
                                                        <div class="email-action-icons">
                                                            <ul class="list-inline">
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-archive email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-delete email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-email-mark-as-unread email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-clock email-action-icons-item"></i></a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="email-sender-info">
                                                            <div class="checkbox-wrapper-mail">
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" id="mail12">
                                                                    <label class="custom-control-label" for="mail12"></label>
                                                                </div>
                                                            </div>
                                                            <span class="star-toggle mdi mdi-star-outline"></span>
                                                            <a href="javascript: void(0);" class="email-title">Tobias Berggren</a>
                                                        </div>
                                                        <div class="email-content">
                                                            <a href="javascript: void(0);" class="email-subject">Let's go fishing! &nbsp;–&nbsp;
                                                                <span>Hey, You wanna join me and Fred at the lake tomorrow? It'll be awesome.</span>
                                                            </a>
                                                            <div class="email-date">Feb 23</div>
                                                        </div>
                                                        <div class="email-action-icons">
                                                            <ul class="list-inline">
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-archive email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-delete email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-email-mark-as-unread email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-clock email-action-icons-item"></i></a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="email-sender-info">
                                                            <div class="checkbox-wrapper-mail">
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" id="mail13">
                                                                    <label class="custom-control-label" for="mail13"></label>
                                                                </div>
                                                            </div>
                                                            <span class="star-toggle mdi mdi-star-outline text-warning"></span>
                                                            <a href="javascript: void(0);" class="email-title">Charukaw, me (7)</a>
                                                        </div>
                                                        <div class="email-content">
                                                            <a href="javascript: void(0);" class="email-subject">Hey man &nbsp;–&nbsp; <span>Nah man sorry i don't. Should i get it?</span>
                                                            </a>
                                                            <div class="email-date">Feb 23</div>
                                                        </div>
                                                        <div class="email-action-icons">
                                                            <ul class="list-inline">
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-archive email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-delete email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-email-mark-as-unread email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-clock email-action-icons-item"></i></a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </li>
                                                    <li class="unread">
                                                        <div class="email-sender-info">
                                                            <div class="checkbox-wrapper-mail">
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" id="mail14">
                                                                    <label class="custom-control-label" for="mail14"></label>
                                                                </div>
                                                            </div>
                                                            <span class="star-toggle mdi mdi-star-outline text-warning"></span>
                                                            <a href="javascript: void(0);" class="email-title">me, Peter (5)</a>
                                                        </div>
                                                        <div class="email-content">
                                                            <a href="javascript: void(0);" class="email-subject">Home again! &nbsp;–&nbsp; <span>That's just perfect! See you tomorrow.</span>
                                                            </a>
                                                            <div class="email-date">Feb 21</div>
                                                        </div>
                                                        <div class="email-action-icons">
                                                            <ul class="list-inline">
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-archive email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-delete email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-email-open email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-clock email-action-icons-item"></i></a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="email-sender-info">
                                                            <div class="checkbox-wrapper-mail">
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" id="mail15">
                                                                    <label class="custom-control-label" for="mail15"></label>
                                                                </div>
                                                            </div>
                                                            <span class="star-toggle mdi mdi-star-outline"></span>
                                                            <a href="javascript: void(0);" class="email-title">Stack Exchange</a>
                                                        </div>
                                                        <div class="email-content">
                                                            <a href="javascript: void(0);" class="email-subject">1 new items in your Stackexchange inbox
                                                                &nbsp;–&nbsp; <span>The following items were added to your Stack Exchange global inbox since you last checked it.</span>
                                                            </a>
                                                            <div class="email-date">Feb 21</div>
                                                        </div>
                                                        <div class="email-action-icons">
                                                            <ul class="list-inline">
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-archive email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-delete email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-email-mark-as-unread email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-clock email-action-icons-item"></i></a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="email-sender-info">
                                                            <div class="checkbox-wrapper-mail">
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" id="mail16">
                                                                    <label class="custom-control-label" for="mail16"></label>
                                                                </div>
                                                            </div>
                                                            <span class="star-toggle mdi mdi-star-outline text-warning"></span>
                                                            <a href="javascript: void(0);" class="email-title">Google Drive Team</a>
                                                        </div>
                                                        <div class="email-content">
                                                            <a href="javascript: void(0);" class="email-subject">You can now use your storage in Google
                                                                Drive &nbsp;–&nbsp; <span>Hey Nicklas Sandell! Thank you for purchasing extra storage space in Google Drive.</span>
                                                            </a>
                                                            <div class="email-date">Feb 20</div>
                                                        </div>
                                                        <div class="email-action-icons">
                                                            <ul class="list-inline">
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-archive email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-delete email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-email-mark-as-unread email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-clock email-action-icons-item"></i></a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </li>
                                                    <li class="unread">
                                                        <div class="email-sender-info">
                                                            <div class="checkbox-wrapper-mail">
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" id="mail17">
                                                                    <label class="custom-control-label" for="mail17"></label>
                                                                </div>
                                                            </div>
                                                            <span class="star-toggle mdi mdi-star-outline"></span>
                                                            <a href="javascript: void(0);" class="email-title">me, Susanna (11)</a>
                                                        </div>
                                                        <div class="email-content">
                                                            <a href="javascript: void(0);" class="email-subject">Train/Bus &nbsp;–&nbsp; <span>Yes ok, great! I'm not stuck in Stockholm anymore, we're making progress.</span>
                                                            </a>
                                                            <div class="email-date">Feb 19</div>
                                                        </div>
                                                        <div class="email-action-icons">
                                                            <ul class="list-inline">
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-archive email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-delete email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-email-open email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-clock email-action-icons-item"></i></a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="email-sender-info">
                                                            <div class="checkbox-wrapper-mail">
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" id="mail18">
                                                                    <label class="custom-control-label" for="mail18"></label>
                                                                </div>
                                                            </div>
                                                            <span class="star-toggle mdi mdi-star-outline"></span>
                                                            <a href="javascript: void(0);" class="email-title">Peter, me (3)</a>
                                                        </div>
                                                        <div class="email-content">
                                                            <a href="javascript: void(0);" class="email-subject">Hello &nbsp;–&nbsp; <span>Trip home from Colombo has been arranged, then Jenna will come get me from Stockholm. :)</span>
                                                            </a>
                                                            <div class="email-date">Jan 28</div>
                                                        </div>
                                                        <div class="email-action-icons">
                                                            <ul class="list-inline">
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-archive email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-delete email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-email-mark-as-unread email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-clock email-action-icons-item"></i></a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="email-sender-info">
                                                            <div class="checkbox-wrapper-mail">
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" id="mail19">
                                                                    <label class="custom-control-label" for="mail19"></label>
                                                                </div>
                                                            </div>
                                                            <span class="star-toggle mdi mdi-star-outline"></span>
                                                            <a href="javascript: void(0);" class="email-title">me, Susanna (7)</a>
                                                        </div>
                                                        <div class="email-content">
                                                            <a href="javascript: void(0);" class="email-subject">Since you asked... and i'm
                                                                inconceivably bored at the train station &nbsp;–&nbsp;
                                                                <span>Alright thanks. I'll have to re-book that somehow, i'll get back to you.</span>
                                                            </a>
                                                            <div class="email-date">Jan 25</div>
                                                        </div>
                                                        <div class="email-action-icons">
                                                            <ul class="list-inline">
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-archive email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-delete email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-email-mark-as-unread email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-clock email-action-icons-item"></i></a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </li>

                                                    <li>
                                                        <div class="email-sender-info">
                                                            <div class="checkbox-wrapper-mail">
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" id="mail20">
                                                                    <label class="custom-control-label" for="mail20"></label>
                                                                </div>
                                                            </div>
                                                            <span class="star-toggle mdi mdi-star-outline"></span>
                                                            <a href="javascript: void(0);" class="email-title">Randy, me (5)</a>
                                                        </div>
                                                        <div class="email-content">
                                                            <a href="javascript: void(0);" class="email-subject">Last pic over my village &nbsp;–&nbsp;
                                                                <span>Yeah i'd like that! Do you remember the video you showed me of your train ride between Colombo and Kandy? The one with the mountain view? I would love to see that one again!</span>
                                                            </a>
                                                            <div class="email-date">Jan 22</div>
                                                        </div>
                                                        <div class="email-action-icons">
                                                            <ul class="list-inline">
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-archive email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-delete email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-email-mark-as-unread email-action-icons-item"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript: void(0);"><i class="mdi mdi-clock email-action-icons-item"></i></a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>



