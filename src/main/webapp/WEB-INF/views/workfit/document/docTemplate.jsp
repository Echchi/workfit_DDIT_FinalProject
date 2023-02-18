<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<style>
button {
  border: 0;
  background: none;
  cursor: pointer;
}

.main_popup {
  position: fixed;
  z-index: 1005;
  -webkit-box-shadow: 0px 13px 40px -6px #061626;
  box-shadow: 0px 13px 30px -25px #061626;
  top: 100px;
  left: 100px;
  width : 500px;
  height : 710px;
  display: none;
}
.main_popup.on {
  display: block;
  background-color: #fff;
}
.main_popup .img_wrap {
  width: 500px;
  height: 600px;
  display: flex;
  justify-content: center;
  align-items: center;
  margin-top: -10px;
}
.main_popup .btn_close {
  width: 32px;
  height: 32px;
  position: absolute;
  top: 17px;
  right: 17px;
  font-size: 0;
  border: 0;
  z-index : 11;
  background: none;
}
.main_popup .btn_close::before {
  content: "";
  width: 2px;
  height: 14px;
  background-color: #998f8f;
  position: absolute;
  top: 0;
  left: 14px;
  transform: rotate(45deg);
}
.main_popup .btn_close::after {
  content: "";
  width: 14px;
  height: 2px;
  background-color: #998f8f;
  position: absolute;
  top: 6px;
  left: 8px;
  transform: rotate(45deg);
}
.main_popup .btn_today_close {
  width: 100%;
  height: 50px;
  background-color: #fff;
  text-align: center;
  color: #e00;
  font-size: 14px;
  display: block;
}
.main_popup .btn_today_close span {
  display: block;
  line-height: 10px;
  vertical-align: bottom;
  opacity: 0.8;
}
.table tr:hover{
  	background-color: #e7ecf1;
}  
/* 
	팝업 CSS 별도로 뺴놓음.. 백업용.
 */

</style>


<div class="modal-header">
    <h5 class="modal-title" id="historyModalLabel">IDDDD - Modal</h5>
    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">×</span>
    </button>
</div>
<link href="<%=request.getContextPath()%>/resources/assets/scss/custom/components/_dropdown.css" rel="stylesheet" type="text/css">
<div class="modal-body">
     <div class="wrapper">

            <!-- ============================================================== -->
            <!-- Start Page Content here -->
            <!-- ============================================================== -->

            <div class="content-page">
                <div class="content">
				@@include('./partials/horizontal-nav.html')
				
				<!-- 				
				<div id="my_file_upload" class="dropzone">
					<div class="fallback">
						<input name="file" type="file" multiple />
					</div>
				</div> 
				-->


				<div>
					<form class="dropzone" id="dropzone-file" enctype="multipart/form-data" method="POST">
						<div class="dz-message needsclick">
							Drop files here or click to upload <span class="note needsclick">(클릭
								또는 드래그&드랍으로 업로드할 수 있습니다.)</span>
						</div>
						<div class="fallback">
							<input name="file" type="file" multiple>
						</div>
					</form>
				</div>

				<!-- Start Content-->
                    <div class="container-fluid">

                        <!-- start page title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box">
                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">Hyper</a></li>
                                            <li class="breadcrumb-item active">File Manager</li>
                                        </ol>
                                    </div>
                                    <h4 class="page-title">File Manager</h4>
                                </div>
                            </div>
                        </div>     
                        <!-- end page title --> 


                        <div class="row">

                            <!-- Right Sidebar -->
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <!-- Left sidebar -->
                                        <div class="page-aside-left">

                                            <div class="btn-group d-block mb-2">
                                                <button type="button" class="btn btn-success btn-block dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="mdi mdi-plus"></i> Create New </button>
                                                <div class="dropdown-menu">
                                                    <a class="dropdown-item" href="#"><i class="mdi mdi-folder-plus-outline mr-1"></i> Folder</a>
                                                    <a class="dropdown-item" href="#"><i class="mdi mdi-file-plus-outline mr-1"></i> File</a>
                                                    <a class="dropdown-item" href="#"><i class="mdi mdi-file-document mr-1"></i> Document</a>
                                                    <a class="dropdown-item" href="#"><i class="mdi mdi-upload mr-1"></i> Choose File</a>
                                                </div>
                                            </div>
                                            <div class="email-menu-list mt-3">
                                                <a href="#" class="list-group-item border-0"><i class="mdi mdi-folder-outline font-18 align-middle mr-2"></i>My Files</a>
                                                <a href="#" class="list-group-item border-0"><i class="mdi mdi-google-drive font-18 align-middle mr-2"></i>Google Drive</a>
                                                <a href="#" class="list-group-item border-0"><i class="mdi mdi-dropbox font-18 align-middle mr-2"></i>Dropbox</a>
                                                <a href="#" class="list-group-item border-0"><i class="mdi mdi-share-variant font-18 align-middle mr-2"></i>Share with me</a>
                                                <a href="#" class="list-group-item border-0"><i class="mdi mdi-clock-outline font-18 align-middle mr-2"></i>Recent</a>
                                                <a href="#" class="list-group-item border-0"><i class="mdi mdi-star-outline font-18 align-middle mr-2"></i>Starred</a>
                                                <a href="#" class="list-group-item border-0"><i class="mdi mdi-delete font-18 align-middle mr-2"></i>Deleted Files</a>
                                            </div>
    
                                            <div class="mt-5">
                                                <h4><span class="badge badge-pill p-1 px-2 badge-secondary-lighten">FREE</span></h4>
                                                <h6 class="text-uppercase mt-3">Storage</h6>
                                                <div class="progress my-2 progress-sm">
                                                    <div class="progress-bar progress-lg bg-success" role="progressbar" style="width: 46%" aria-valuenow="46" aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                                <p class="text-muted font-12 mb-0">7.02 GB (46%) of 15 GB used</p>
                                            </div>

                                        </div>
                                        <!-- End Left sidebar -->

                                        <div class="page-aside-right">

                                            <div class="d-flex justify-content-between align-items-center">
                                                <div class="app-search">
                                                    <form>
                                                        <div class="form-group position-relative">
                                                            <input type="text" class="form-control" placeholder="Search files...">
                                                            <span class="mdi mdi-magnify search-icon"></span>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div>
                                                    <button type="submit" class="btn btn-sm btn-light"><i class="mdi mdi-format-list-bulleted"></i></button>
                                                    <button type="submit" class="btn btn-sm"><i class="mdi mdi-view-grid"></i></button>
                                                    <button type="submit" class="btn btn-sm"><i class="mdi mdi-information-outline"></i></button>
                                                </div>
                                            </div>
    
                                            <div class="mt-3">
                                                <h5 class="mb-2">Quick Access</h5>
    
                                                <div class="row mx-n1 no-gutters">
                                                    <div class="col-xl-3 col-lg-6">
                                                        <div class="card m-1 shadow-none border">
                                                            <div class="p-2">
                                                                <div class="row align-items-center">
                                                                    <div class="col-auto">
                                                                        <div class="avatar-sm">
                                                                            <span class="avatar-title bg-light text-secondary rounded">
                                                                                <i class="mdi mdi-folder-zip font-16"></i>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col pl-0">
                                                                        <a href="javascript:void(0);" class="text-muted font-weight-bold">Hyper-sketch.zip</a>
                                                                        <p class="mb-0 font-13">2.3 MB</p>
                                                                    </div>
                                                                </div> <!-- end row -->
                                                            </div> <!-- end .p-2-->
                                                        </div> <!-- end col -->
                                                    </div> <!-- end col-->
    
                                                    <div class="col-xl-3 col-lg-6">
                                                        <div class="card m-1 shadow-none border">
                                                            <div class="p-2">
                                                                <div class="row align-items-center">
                                                                    <div class="col-auto">
                                                                        <div class="avatar-sm">
                                                                            <span class="avatar-title bg-light text-secondary rounded">
                                                                                <i class="mdi mdi-folder font-16"></i>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col pl-0">
                                                                        <a href="javascript:void(0);" class="text-muted font-weight-bold">Compile Version</a>
                                                                        <p class="mb-0 font-13">87.2 MB</p>
                                                                    </div>
                                                                </div> <!-- end row -->
                                                            </div> <!-- end .p-2-->
                                                        </div> <!-- end col -->
                                                    </div> <!-- end col-->
    
                                                    <div class="col-xl-3 col-lg-6">
                                                        <div class="card m-1 shadow-none border">
                                                            <div class="p-2">
                                                                <div class="row align-items-center">
                                                                    <div class="col-auto">
                                                                        <div class="avatar-sm">
                                                                            <span class="avatar-title bg-primary-lighten text-primary rounded">
                                                                                <i class="mdi mdi-folder-zip-outline font-16"></i>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col pl-0">
                                                                        <a href="javascript:void(0);" class="text-muted font-weight-bold">admin.zip</a>
                                                                        <p class="mb-0 font-13">45.1 MB</p>
                                                                    </div>
                                                                </div> <!-- end row -->
                                                            </div> <!-- end .p-2-->
                                                        </div> <!-- end col -->
                                                    </div> <!-- end col-->
    
                                                    <div class="col-xl-3 col-lg-6">
                                                        <div class="card m-1 shadow-none border">
                                                            <div class="p-2">
                                                                <div class="row align-items-center">
                                                                    <div class="col-auto">
                                                                        <div class="avatar-sm">
                                                                            <span class="avatar-title bg-light text-secondary rounded">
                                                                                <i class="mdi mdi-file-pdf-outline font-16"></i>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col pl-0">
                                                                        <a href="javascript:void(0);" class="text-muted font-weight-bold">Docs.pdf</a>
                                                                        <p class="mb-0 font-13">7.5 MB</p>
                                                                    </div>
                                                                </div> <!-- end row -->
                                                            </div> <!-- end .p-2-->
                                                        </div> <!-- end col -->
                                                    </div> <!-- end col-->
    
                                                    <div class="col-xl-3 col-lg-6">
                                                        <div class="card m-1 shadow-none border">
                                                            <div class="p-2">
                                                                <div class="row align-items-center">
                                                                    <div class="col-auto">
                                                                        <div class="avatar-sm">
                                                                            <span class="avatar-title bg-light text-secondary rounded">
                                                                                <i class="mdi mdi-file-pdf-outline font-18"></i>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col pl-0">
                                                                        <a href="javascript:void(0);" class="text-muted font-weight-bold">License-details.pdf</a>
                                                                        <p class="mb-0 font-13">784 KB</p>
                                                                    </div>
                                                                </div> <!-- end row -->
                                                            </div> <!-- end .p-2-->
                                                        </div> <!-- end col -->
                                                    </div> <!-- end col-->
    
                                                    <div class="col-xl-3 col-lg-6">
                                                        <div class="card m-1 shadow-none border">
                                                            <div class="p-2">
                                                                <div class="row align-items-center">
                                                                    <div class="col-auto">
                                                                        <div class="avatar-sm">
                                                                            <span class="avatar-title bg-light text-secondary rounded">
                                                                                <i class="mdi mdi-folder-account font-18"></i>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col pl-0">
                                                                        <a href="javascript:void(0);" class="text-muted font-weight-bold">Purchase Verification</a>
                                                                        <p class="mb-0 font-13">2.2 MB</p>
                                                                    </div>
                                                                </div> <!-- end row -->
                                                            </div> <!-- end .p-2-->
                                                        </div> <!-- end col -->
                                                    </div> <!-- end col-->
    
                                                    <div class="col-xl-3 col-lg-6">
                                                        <div class="card m-1 shadow-none border">
                                                            <div class="p-2">
                                                                <div class="row align-items-center">
                                                                    <div class="col-auto">
                                                                        <div class="avatar-sm">
                                                                            <span class="avatar-title bg-light text-secondary rounded">
                                                                                <i class="mdi mdi-folder-account font-18"></i>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col pl-0">
                                                                        <a href="javascript:void(0);" class="text-muted font-weight-bold">Hyper Integrations</a>
                                                                        <p class="mb-0 font-13">874 MB</p>
                                                                    </div>
                                                                </div> <!-- end row -->
                                                            </div> <!-- end .p-2-->
                                                        </div> <!-- end col -->
                                                    </div> <!-- end col-->
                                                </div> <!-- end row-->
                                            </div> <!-- end .mt-3-->
    
    
                                            <div class="mt-3">
                                                <h5 class="mb-3">Recent</h5>
    
                                                <div class="table-responsive">
                                                    <table class="table table-centered table-nowrap mb-0">
                                                        <thead class="thead-light">
                                                            <tr>
                                                                <th class="border-0">Name</th>
                                                                <th class="border-0">Last Modified</th>
                                                                <th class="border-0">Size</th>
                                                                <th class="border-0">Owner</th>
                                                                <th class="border-0">Members</th>
                                                                <th class="border-0" style="width: 80px;">Action</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td class="border-0">
                                                                    <span class="ml-2 font-weight-semibold"><a href="javascript: void(0);" class="text-reset">App Design & Development</a></span>
                                                                </td>
                                                                <td class="border-0">
                                                                    <p class="mb-0">Jan 03, 2020</p>
                                                                    <span class="font-12">by Andrew</span>
                                                                </td>
                                                                <td class="border-0">128 MB</td>
                                                                <td class="border-0">
                                                                    Danielle Thompson
                                                                </td>
                                                                <td class="border-0">
                                                                    <div class="avatar-group">
                                                                        <a href="javascript: void(0);" class="avatar-group-item mb-0" data-toggle="tooltip" data-placement="top" title="" data-original-title="Mat Helme">
                                                                            <img src="assets/images/users/avatar-1.jpg" class="rounded-circle avatar-xs" alt="friend">
                                                                        </a>
                                
                                                                        <a href="javascript: void(0);" class="avatar-group-item mb-0" data-toggle="tooltip" data-placement="top" title="" data-original-title="Michael Zenaty">
                                                                            <img src="<%=request.getContextPath() %>/resources/assets/images/users/avatar-2.jpg" class="rounded-circle avatar-xs" alt="friend">
                                                                        </a>
                                
                                                                        <a href="javascript: void(0);" class="avatar-group-item mb-0" data-toggle="tooltip" data-placement="top" title="" data-original-title="James Anderson">
                                                                            <img src="assets/images/users/avatar-3.jpg" class="rounded-circle avatar-xs" alt="friend">
                                                                        </a>
                                
                                                                        <a href="javascript: void(0);" class="avatar-group-item mb-0" data-toggle="tooltip" data-placement="top" title="" data-original-title="Username">
                                                                            <img src="assets/images/users/avatar-5.jpg" class="rounded-circle avatar-xs" alt="friend">
                                                                        </a>
                                                                    </div>
                                                                </td>
                                                                <td class="border-0">
                                                                    <div class="btn-group dropdown">
                                                                        <a href="javascript: void(0);" class="table-action-btn dropdown-toggle arrow-none btn btn-light btn-xs" data-toggle="dropdown" aria-expanded="false"><i class="mdi mdi-dots-horizontal"></i></a>
                                                                        <div class="dropdown-menu dropdown-menu-right">
                                                                            <a class="dropdown-item" href="#"><i class="mdi mdi-share-variant mr-2 text-muted vertical-middle"></i>Share</a>
                                                                            <a class="dropdown-item" href="#"><i class="mdi mdi-link mr-2 text-muted vertical-middle"></i>Get Sharable Link</a>
                                                                            <a class="dropdown-item" href="#"><i class="mdi mdi-pencil mr-2 text-muted vertical-middle"></i>Rename</a>
                                                                            <a class="dropdown-item" href="#"><i class="mdi mdi-download mr-2 text-muted vertical-middle"></i>Download</a>
                                                                            <a class="dropdown-item" href="#"><i class="mdi mdi-delete mr-2 text-muted vertical-middle"></i>Remove</a>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            
                                                            <tr>
                                                                <td>
                                                                    <span class="ml-2 font-weight-semibold"><a href="javascript: void(0);" class="text-reset">Hyper-sketch-design.zip</a></span>
                                                                </td>
                                                                <td>
                                                                    <p class="mb-0">Feb 13, 2020</p>
                                                                    <span class="font-12">by Coderthemes</span>
                                                                </td>
                                                                <td>521 MB</td>
                                                                <td>
                                                                    Coder Themes
                                                                </td>
                                                                <td>
                                                                    <div class="avatar-group">
                                                                        <a href="javascript: void(0);" class="avatar-group-item mb-0" data-toggle="tooltip" data-placement="top" title="" data-original-title="Mat Helme">
                                                                            <img src="assets/images/users/avatar-4.jpg" class="rounded-circle avatar-xs" alt="friend">
                                                                        </a>
                                
                                                                        <a href="javascript: void(0);" class="avatar-group-item mb-0" data-toggle="tooltip" data-placement="top" title="" data-original-title="Michael Zenaty">
                                                                            <img src="assets/images/users/avatar-1.jpg" class="rounded-circle avatar-xs" alt="friend">
                                                                        </a>
                                
                                                                        <a href="javascript: void(0);" class="avatar-group-item mb-0" data-toggle="tooltip" data-placement="top" title="" data-original-title="James Anderson">
                                                                            <img src="assets/images/users/avatar-6.jpg" class="rounded-circle avatar-xs" alt="friend">
                                                                        </a>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="btn-group dropdown">
                                                                        <a href="javascript: void(0);" class="table-action-btn dropdown-toggle arrow-none btn btn-light btn-xs" data-toggle="dropdown" aria-expanded="false"><i class="mdi mdi-dots-horizontal"></i></a>
                                                                        <div class="dropdown-menu dropdown-menu-right">
                                                                            <a class="dropdown-item" href="#"><i class="mdi mdi-share-variant mr-2 text-muted vertical-middle"></i>Share</a>
                                                                            <a class="dropdown-item" href="#"><i class="mdi mdi-link mr-2 text-muted vertical-middle"></i>Get Sharable Link</a>
                                                                            <a class="dropdown-item" href="#"><i class="mdi mdi-pencil mr-2 text-muted vertical-middle"></i>Rename</a>
                                                                            <a class="dropdown-item" href="#"><i class="mdi mdi-download mr-2 text-muted vertical-middle"></i>Download</a>
                                                                            <a class="dropdown-item" href="#"><i class="mdi mdi-delete mr-2 text-muted vertical-middle"></i>Remove</a>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
    
                                                            <tr>
                                                                <td>
                                                                    <span class="ml-2 font-weight-semibold"><a href="javascript: void(0);" class="text-reset">Annualreport.pdf</a></span>
                                                                </td>
                                                                <td>
                                                                    <p class="mb-0">Dec 18, 2019</p>
                                                                    <span class="font-12">by Alejandro</span>
                                                                </td>
                                                                <td>7.2 MB</td>
                                                                <td>
                                                                    Gary Coley
                                                                </td>
                                                                <td>
                                                                    <div class="avatar-group">
                                                                        <a href="javascript: void(0);" class="avatar-group-item mb-0" data-toggle="tooltip" data-placement="top" title="" data-original-title="Mat Helme">
                                                                            <img src="assets/images/users/avatar-9.jpg" class="rounded-circle avatar-xs" alt="friend">
                                                                        </a>
                                
                                                                        <a href="javascript: void(0);" class="avatar-group-item mb-0" data-toggle="tooltip" data-placement="top" title="" data-original-title="Michael Zenaty">
                                                                            <img src="assets/images/users/avatar-7.jpg" class="rounded-circle avatar-xs" alt="friend">
                                                                        </a>
                                
                                                                        <a href="javascript: void(0);" class="avatar-group-item mb-0" data-toggle="tooltip" data-placement="top" title="" data-original-title="James Anderson">
                                                                            <img src="assets/images/users/avatar-3.jpg" class="rounded-circle avatar-xs" alt="friend">
                                                                        </a>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="btn-group dropdown">
                                                                        <a href="javascript: void(0);" class="table-action-btn dropdown-toggle arrow-none btn btn-light btn-xs" data-toggle="dropdown" aria-expanded="false"><i class="mdi mdi-dots-horizontal"></i></a>
                                                                        <div class="dropdown-menu dropdown-menu-right">
                                                                            <a class="dropdown-item" href="#"><i class="mdi mdi-share-variant mr-2 text-muted vertical-middle"></i>Share</a>
                                                                            <a class="dropdown-item" href="#"><i class="mdi mdi-link mr-2 text-muted vertical-middle"></i>Get Sharable Link</a>
                                                                            <a class="dropdown-item" href="#"><i class="mdi mdi-pencil mr-2 text-muted vertical-middle"></i>Rename</a>
                                                                            <a class="dropdown-item" href="#"><i class="mdi mdi-download mr-2 text-muted vertical-middle"></i>Download</a>
                                                                            <a class="dropdown-item" href="#"><i class="mdi mdi-delete mr-2 text-muted vertical-middle"></i>Remove</a>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
    
                                                            <tr>
                                                                <td>
                                                                    <span class="ml-2 font-weight-semibold"><a href="javascript: void(0);" class="text-reset">Wireframes</a></span>
                                                                </td>
                                                                <td>
                                                                    <p class="mb-0">Nov 25, 2019</p>
                                                                    <span class="font-12">by Dunkle</span>
                                                                </td>
                                                                <td>54.2 MB</td>
                                                                <td>
                                                                    Jasper Rigg
                                                                </td>
                                                                <td>
                                                                    <div class="avatar-group">
                                                                        <a href="javascript: void(0);" class="avatar-group-item mb-0" data-toggle="tooltip" data-placement="top" title="" data-original-title="Mat Helme">
                                                                            <img src="assets/images/users/avatar-1.jpg" class="rounded-circle avatar-xs" alt="friend">
                                                                        </a>
                                
                                                                        <a href="javascript: void(0);" class="avatar-group-item mb-0" data-toggle="tooltip" data-placement="top" title="" data-original-title="Michael Zenaty">
                                                                            <img src="assets/images/users/avatar-8.jpg" class="rounded-circle avatar-xs" alt="friend">
                                                                        </a>
                                
                                                                        <a href="javascript: void(0);" class="avatar-group-item mb-0" data-toggle="tooltip" data-placement="top" title="" data-original-title="James Anderson">
                                                                            <img src="assets/images/users/avatar-2.jpg" class="rounded-circle avatar-xs" alt="friend">
                                                                        </a>
                                
                                                                        <a href="javascript: void(0);" class="avatar-group-item mb-0" data-toggle="tooltip" data-placement="top" title="" data-original-title="Username">
                                                                            <img src="assets/images/users/avatar-5.jpg" class="rounded-circle avatar-xs" alt="friend">
                                                                        </a>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="btn-group dropdown">
                                                                        <a href="javascript: void(0);" class="table-action-btn dropdown-toggle arrow-none btn btn-light btn-xs" data-toggle="dropdown" aria-expanded="false"><i class="mdi mdi-dots-horizontal"></i></a>
                                                                        <div class="dropdown-menu dropdown-menu-right">
                                                                            <a class="dropdown-item" href="#"><i class="mdi mdi-share-variant mr-2 text-muted vertical-middle"></i>Share</a>
                                                                            <a class="dropdown-item" href="#"><i class="mdi mdi-link mr-2 text-muted vertical-middle"></i>Get Sharable Link</a>
                                                                            <a class="dropdown-item" href="#"><i class="mdi mdi-pencil mr-2 text-muted vertical-middle"></i>Rename</a>
                                                                            <a class="dropdown-item" href="#"><i class="mdi mdi-download mr-2 text-muted vertical-middle"></i>Download</a>
                                                                            <a class="dropdown-item" href="#"><i class="mdi mdi-delete mr-2 text-muted vertical-middle"></i>Remove</a>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
    
                                                            <tr>
                                                                <td>
                                                                    <span class="ml-2 font-weight-semibold"><a href="javascript: void(0);" class="text-reset">Documentation.docs</a></span>
                                                                </td>
                                                                <td>
                                                                    <p class="mb-0">Feb 9, 2020</p>
                                                                    <span class="font-12">by Justin</span>
                                                                </td>
                                                                <td>8.3 MB</td>
                                                                <td>
                                                                    Cooper Sharwood
                                                                </td>
                                                                <td>
                                                                    <div class="avatar-group">
                                                                        <a href="javascript: void(0);" class="avatar-group-item mb-0" data-toggle="tooltip" data-placement="top" title="" data-original-title="Mat Helme">
                                                                            <img src="assets/images/users/avatar-3.jpg" class="rounded-circle avatar-xs" alt="friend">
                                                                        </a>
                                
                                                                        <a href="javascript: void(0);" class="avatar-group-item mb-0" data-toggle="tooltip" data-placement="top" title="" data-original-title="Michael Zenaty">
                                                                            <img src="assets/images/users/avatar-10.jpg" class="rounded-circle avatar-xs" alt="friend">
                                                                        </a>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="btn-group dropdown">
                                                                        <a href="javascript: void(0);" class="table-action-btn dropdown-toggle arrow-none btn btn-light btn-xs" data-toggle="dropdown" aria-expanded="false"><i class="mdi mdi-dots-horizontal"></i></a>
                                                                        <div class="dropdown-menu dropdown-menu-right">
                                                                            <a class="dropdown-item" href="#"><i class="mdi mdi-share-variant mr-2 text-muted vertical-middle"></i>Share</a>
                                                                            <a class="dropdown-item" href="#"><i class="mdi mdi-link mr-2 text-muted vertical-middle"></i>Get Sharable Link</a>
                                                                            <a class="dropdown-item" href="#"><i class="mdi mdi-pencil mr-2 text-muted vertical-middle"></i>Rename</a>
                                                                            <a class="dropdown-item" href="#"><i class="mdi mdi-download mr-2 text-muted vertical-middle"></i>Download</a>
                                                                            <a class="dropdown-item" href="#"><i class="mdi mdi-delete mr-2 text-muted vertical-middle"></i>Remove</a>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
    
                                                        </tbody>
                                                    </table>
                                                </div>
    
                                            </div> <!-- end .mt-3-->

                                        </div> 
                                        <!-- end inbox-rightbar-->
                                    </div>
                                    <!-- end card-body -->
                                    <div class="clearfix"></div>
                                </div> <!-- end card-box -->

                            </div> <!-- end Col -->
                        </div><!-- End row -->

                    </div>
                    <!-- container -->

                </div>
                <!-- content -->

                @@include('./partials/footer.html')

            </div>
</div>

<!--  From docmain.jsp  -->
<div class="row mt-1">
		<div class="col-12">
			<div class="card">
<!-- 				<div class="card-body"> -->
					<div class="card-title">
						<h3 class="apple4 page-title text-dark "
							style="font-size: 26px; letter-spacing: 2px;">Document</h3>
					</div>
					<div class="row mb-2">
						<div class="col-sm-4"></div>
						<div class="col-sm-8">
							<div class="text-sm-right">
								<!-- 							<button type="button" class="btn btn-light mb-2 mr-1">Import</button> -->
								<button type="button" class="btn btn-light mb-2">Export</button>
							</div>
						</div>
						<!-- end col-->
					</div>
					<div class="row">
						<!-- 테이블을 넣어보자 -->
					</div>
					<table class="alternative-page-datatable table mb-0">
						<thead>
							<tr>
								<th class="apple4" scope="col">#</th>
								<th class="apple2" scope="col">북마크</th>
								<th class="apple2" scope="col">문서번호</</th>
								<th class="apple2" scope="col">부서번호</</th>
								<th class="apple2" scope="col">파일이름</th>
								<th class="apple2" scope="col">저장이름</th>
								<th class="apple2" scope="col">파일크기</th>
								<th class="apple2" scope="col">저장경로</th>
								<th class="apple2" scope="col">파일종류</th>
								<th class="apple2" scope="col">작성일</th>
								<th class="apple2" scope="col">작성자</th>
							</tr>
						</thead>
						<tbody>
							<%-- 						<c:forEach items="${freqDocList }" var="doc"> --%>
							<c:forEach items="${mydoclist }" var="doc" varStatus="status">
								<!-- 						MY_DOC_CODE, a.DOC_CODE, a.MY_DOC_NAME, a.MY_DOC_NEWNAME,   a.MY_DOC_PATH, a.MY_DOC_TYPE, a.MY_DOC_DATE,b.MEM_ID,b.DEPT_CODE -->
								<tr>
									<th class="apple4 text-dark" scope="row">${status.index }</th>
									<td class="apple4 text-dark">#</td>
									<td class="apple4 text-dark">${doc.docCode }</td>
									<td class="apple4 text-dark">${doc.docVO.deptCode }</td>
									<td class="apple4 text-dark">${doc.myDocName }</td>
									<td class="apple4 text-dark">${doc.myDocNewname }</td>
									<td class="apple4 text-dark">${doc.myDocSize }</td>
									<td class="apple4 text-dark">${doc.myDocPath }</td>
									<td class="apple4 text-dark">${doc.myDocType }</td>
									<td class="apple4 text-dark">${doc.myDocDate }</td>
									<td class="apple4 text-dark">${doc.docVO.memId }</td>
									<!-- 								<th class="apple4 text-dark" scope="row">1</th> -->
									<%-- 								<td class="apple4 text-dark">${doc.freqDocCode }</td> --%>
									<%-- 								<td class="apple4 text-dark">${doc.docCode }</td> --%>
									<%-- 								<td class="apple4 text-dark">${doc.myDocCode }</td> --%>
									<%-- 								<td class="apple4 text-dark">${doc.deptDocCode}</td> --%>
									<%-- 								<td class="apple4 text-dark">${doc.freqDocBookmark}</td> --%>
									<td class="apple4 text-dark"></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
<!-- 				</div> -->

				<!-- end card-body-->
			</div>
			<!-- end card-->
		</div>
		<!-- end col -->
	</div>
<div class="modal-footer">
    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
</div>

<script type="text/javascript">
var dropzoneFile=new Dropzone("#dropzone-file",{
    url:'/workfit/document/insertData',
    maxFilesize:5000000000,
    parallelUploads:5,    //한번에 올릴 파일 수
    addRemoveLinks:  true, //업로드 후 삭제 버튼 
    timeout:300000,	//커넥션 타임아웃 설정 -> 데이터가 클 경우 꼭 넉넉히 설정해주자
    maxFiles:5,       //업로드 할 최대 파일 수
    paramName:"file", //파라미터로 넘길 변수명 default는 file
    autoQueue:true,	//드래그 드랍 후 바로 서버로 전송
    createImageThumbnails:true,	//파일 업로드 썸네일 생성
    uploadMultiple:true,	//멀티파일 업로드
    dictRemoveFile:'삭제',	//삭제 버튼의 텍스트 설정
    dictDefaultMessage:'PREVIEW', //미리보기 텍스트 설정
    accept:function(file,done){
        //validation을 여기서 설정하면 된다.
        //설정이 끝나고 꼭 done()함수를 호출해야 서버로 전송한다. 
        done(); 
    },
    init:function(){
        this.on('success',function(file,responseText){
            var obj = JSON.parse(responseText);
            console.log(obj);
            //서버로 파일이 전송되면 실행되는 함수이다.
            //obj 객체를 확인해보면 서버에 전송된 후 response 값을 확인할 수 있다.
        })
    }
    				     
});
</script>