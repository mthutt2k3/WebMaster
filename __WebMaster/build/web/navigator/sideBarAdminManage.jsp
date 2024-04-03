<button class="btn btn-dark" 
            style="position: fixed; transform: translate(0,63px)"
            type="button" 
            data-bs-toggle="offcanvas" 
            data-bs-target="#offcanvasExample" 
            aria-controls="offcanvasExample"
    >
        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-justify-left" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M2 12.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5z"/>
        </svg>
    </button>

<div class="offcanvas offcanvas-start"
     style="background-color: #e7f1ff"
     tabindex="-1" id="offcanvasExample" 
     aria-labelledby="offcanvasExampleLabel"
>
    <div class="offcanvas-header">
      <h3 class="offcanvas-title font-monospace fw-bold" 
          id="offcanvasExampleLabel"
          style="color: #fd7e14"
        >
          ADMIN MANAGER
      </h3>
      <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body ">
        <ul class="">
            <li onmouseover="this.style.color='blue'" onmouseout="this.style.color='black'">
                <form action="/_WebMaster/control">
                    <input type="hidden" name="requestAction" value="Manage Users">
                    <button type="submit" 
                            class="btn btn-lg btn-info dropdown-item d-flex align-items-center"
                    >
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-database-fill me-2" viewBox="0 0 16 16">
                            <path d="M3.904 1.777C4.978 1.289 6.427 1 8 1s3.022.289 4.096.777C13.125 2.245 14 2.993 14 4s-.875 1.755-1.904 2.223C11.022 6.711 9.573 7 8 7s-3.022-.289-4.096-.777C2.875 5.755 2 5.007 2 4s.875-1.755 1.904-2.223Z"/>
                            <path d="M2 6.161V7c0 1.007.875 1.755 1.904 2.223C4.978 9.71 6.427 10 8 10s3.022-.289 4.096-.777C13.125 8.755 14 8.007 14 7v-.839c-.457.432-1.004.751-1.49.972C11.278 7.693 9.682 8 8 8s-3.278-.307-4.51-.867c-.486-.22-1.033-.54-1.49-.972Z"/>
                            <path d="M2 9.161V10c0 1.007.875 1.755 1.904 2.223C4.978 12.711 6.427 13 8 13s3.022-.289 4.096-.777C13.125 11.755 14 11.007 14 10v-.839c-.457.432-1.004.751-1.49.972-1.232.56-2.828.867-4.51.867s-3.278-.307-4.51-.867c-.486-.22-1.033-.54-1.49-.972Z"/>
                            <path d="M2 12.161V13c0 1.007.875 1.755 1.904 2.223C4.978 15.711 6.427 16 8 16s3.022-.289 4.096-.777C13.125 14.755 14 14.007 14 13v-.839c-.457.432-1.004.751-1.49.972-1.232.56-2.828.867-4.51.867s-3.278-.307-4.51-.867c-.486-.22-1.033-.54-1.49-.972Z"/>
                        </svg>
                        Manage User
                    </button>
                </form>
            </li>
            <li onmouseover="this.style.color='blue'" onmouseout="this.style.color='black'">
                <form action="/_WebMaster/control">
                    <input type="hidden" name="action" value="ProductManage">
                    <input type="hidden" name="requestAction" value="Manage Product">
                    <button type="submit" 
                            class="btn btn-lg btn-info dropdown-item d-flex align-items-center"
                    >
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-database-fill me-2" viewBox="0 0 16 16">
                            <path d="M3.904 1.777C4.978 1.289 6.427 1 8 1s3.022.289 4.096.777C13.125 2.245 14 2.993 14 4s-.875 1.755-1.904 2.223C11.022 6.711 9.573 7 8 7s-3.022-.289-4.096-.777C2.875 5.755 2 5.007 2 4s.875-1.755 1.904-2.223Z"/>
                            <path d="M2 6.161V7c0 1.007.875 1.755 1.904 2.223C4.978 9.71 6.427 10 8 10s3.022-.289 4.096-.777C13.125 8.755 14 8.007 14 7v-.839c-.457.432-1.004.751-1.49.972C11.278 7.693 9.682 8 8 8s-3.278-.307-4.51-.867c-.486-.22-1.033-.54-1.49-.972Z"/>
                            <path d="M2 9.161V10c0 1.007.875 1.755 1.904 2.223C4.978 12.711 6.427 13 8 13s3.022-.289 4.096-.777C13.125 11.755 14 11.007 14 10v-.839c-.457.432-1.004.751-1.49.972-1.232.56-2.828.867-4.51.867s-3.278-.307-4.51-.867c-.486-.22-1.033-.54-1.49-.972Z"/>
                            <path d="M2 12.161V13c0 1.007.875 1.755 1.904 2.223C4.978 15.711 6.427 16 8 16s3.022-.289 4.096-.777C13.125 14.755 14 14.007 14 13v-.839c-.457.432-1.004.751-1.49.972-1.232.56-2.828.867-4.51.867s-3.278-.307-4.51-.867c-.486-.22-1.033-.54-1.49-.972Z"/>
                        </svg>
                        Manage Product
                    </button>
                </form>
                <li class="ms-4"
                    onmouseover="this.style.color='blue'" 
                    onmouseout="this.style.color='black'"
                >
                    <form action="/_WebMaster/client/Product/AddProduct.jsp">
                        <button type="submit" 
                                class="btn btn-sm btn-info text-opacity-25 dropdown-item d-flex align-items-center"
                        >
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cloud-arrow-up-fill" viewBox="0 0 16 16">
                              <path d="M8 2a5.53 5.53 0 0 0-3.594 1.342c-.766.66-1.321 1.52-1.464 2.383C1.266 6.095 0 7.555 0 9.318 0 11.366 1.708 13 3.781 13h8.906C14.502 13 16 11.57 16 9.773c0-1.636-1.242-2.969-2.834-3.194C12.923 3.999 10.69 2 8 2zm2.354 5.146a.5.5 0 0 1-.708.708L8.5 6.707V10.5a.5.5 0 0 1-1 0V6.707L6.354 7.854a.5.5 0 1 1-.708-.708l2-2a.5.5 0 0 1 .708 0l2 2z"/>
                            </svg>
                            <span class="ms-2">
                                Add Product
                            </span>
                        </button>
                    </form>
                </li>
            </li>
        </ul>
    </div>
</div>