<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="user-id" content="{{ optional($user)->id ?? 'guest' }}">

    <title>{{ config('chatify.name') }}</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <style>
        body,
        html {
            font-family: 'Inter', sans-serif;
            overflow: hidden;
            position: fixed;
            width: 100%;
            height: 100%;
        }

        ::-webkit-scrollbar {
            width: 6px;
            height: 6px;
        }

        ::-webkit-scrollbar-track {
            background: transparent;
        }

        ::-webkit-scrollbar-thumb {
            background: #cbd5e1;
            border-radius: 3px;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: #94a3b8;
        }

        .animate-slide-up {
            animation: slideUp 0.3s ease-out;
        }

        @keyframes slideUp {
            from {
                transform: translateY(100%);
            }

            to {
                transform: translateY(0);
            }
        }

        .hidden {
            display: none !important;
        }

        /* FAB Animation */
        .fab-hover:hover {
            transform: scale(1.1);
        }

        .reaction-menu::before {
            content: '';
            position: absolute;
            bottom: -15px;
            /* Adjust this to match the gap size */
            left: 0;
            right: 0;
            height: 20px;
            background: transparent;
        }

        /* Ensure the menu stays visible while the mouse is over the menu itself */
        .reaction-menu:hover {
            display: flex !important;
        }

        /* Reaction Menu Animation */
        .reaction-menu {
            transform: scale(0);
            transition: transform 0.2s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            transform-origin: bottom right;
            transition: all 0.2s ease;
            pointer-events: auto;
        }

        .group:hover .reaction-menu {
            transform: scale(1);
            display: flex !important;
        }

        /* Own message reaction menu alignment */
        .justify-end .reaction-menu {
            transform-origin: bottom right;
            right: 0;
        }

        .justify-start .reaction-menu {
            transform-origin: bottom left;
            left: 0;
        }

        #reply-preview-bar {
            transition: all 0.3s ease;
        }

        .reaction-menu {
            /* Adjusted to make room for the reply button */
            min-width: 160px;
            justify-content: center;
        }

        /* Prevent bounce scrolling on iOS */


        /* Custom Scrollbar for clean look */
        #messages-area::-webkit-scrollbar {
            width: 4px;
        }

        #messages-area::-webkit-scrollbar-thumb {
            background: #e2e8f0;
            border-radius: 10px;
        }

        /* Mobile-only adjustments */
        @media (max-width: 767px) {
            #chat-pane {
                width: 100%;
            }

            /* Make message bubbles slightly larger for touch */
            .message-bubble {
                max-width: 85% !important;
                font-size: 16px !important;
                /* Prevents auto-zoom on iOS inputs */
            }
        }
    </style>
    <!-- Scripts & Styles -->

</head>

<body class="bg-gray-50 h-screen w-screen overflow-hidden flex">

    <!-- App Container -->
    <div id="app" class="w-full h-full flex bg-white relative">
        <!-- Sidebar -->
        <aside class="w-80 border-r border-gray-100 flex flex-col bg-white z-10 flex-shrink-0 relative">
            <!-- Header -->
            <div class="p-4 border-b border-gray-100 flex items-center justify-between bg-white">
                <div class="flex items-center gap-3">
                    <div class="relative">
                        <img id="user-avatar"
                            src="{{ $user->avatar ?? 'https://ui-avatars.com/api/?name=' . urlencode($user->name ?? 'User') }}"
                            alt="Me" class="w-12 h-12 rounded-full object-cover border-2 border-white shadow-sm">
                        <span
                            class="absolute bottom-0 right-0 w-3 h-3 bg-green-500 border-2 border-white rounded-full"></span>
                    </div>
                    <span class="font-bold text-gray-800 text-lg">Chatify Pro</span>
                </div>
                <div class="flex gap-2">
                    <button onclick="app.toggleSettings()"
                        class="p-2 rounded-full hover:bg-gray-100 text-gray-500 transition-colors"
                        id="settings-btn"></button>
                </div>
            </div>

            <!-- Search -->
            <div class="p-4">
                <div class="relative">
                    <input type="text" placeholder="Search chats..."
                        class="w-full pl-10 pr-4 py-2 bg-gray-50 border border-gray-200 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-transparent">
                    <div class="absolute left-3 top-2.5 w-4 h-4 text-gray-400" id="icon-search"></div>
                </div>
            </div>

            <!-- Conversation List -->
            <div id="conversation-list" class="flex-1 overflow-y-auto pb-20"></div>

            <!-- Floating Action Button (FAB) -->
            <div class="absolute bottom-6 left-1/2 transform -translate-x-1/2">
                <button onclick="app.openCompose()"
                    class="w-14 h-14 bg-indigo-600 rounded-full text-white shadow-lg flex items-center justify-center fab-hover transition-transform duration-200"
                    id="fab-compose">
                    <!-- Icon injected by JS -->
                </button>
            </div>
        </aside>

        <!-- Main Content -->
        <main class="flex-1 flex flex-col bg-[#eef2f6] relative">

            <!-- Chat View -->
            <div id="view-chat" class="flex flex-col h-full w-full">
                <!-- Empty State -->
                <div id="empty-state" class="flex-1 flex flex-col items-center justify-center text-gray-400 p-8">
                    <div class="w-48 h-48 bg-indigo-50 rounded-full flex items-center justify-center mb-6">
                        <svg class="w-24 h-24 text-indigo-300" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                            strokeWidth="1">
                            <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path>
                        </svg>
                    </div>
                    <h2 class="text-2xl font-bold text-gray-700 mb-2">Welcome, {{ $user->name ?? 'User' }}</h2>
                    <p class="text-center max-w-md">Select a conversation or start a new one.</p>
                </div>

                <!-- Active Chat Container -->
                <div id="active-chat-container" class="flex flex-col h-full hidden">
                    <!-- Chat Header -->
                    <header
                        class="h-16 bg-white border-b border-gray-100 flex items-center px-6 justify-between shadow-sm z-10">
                        <div class="flex items-center gap-4">
                            <img id="chat-header-avatar" src="" class="w-8 h-8 rounded-full object-cover">
                            <div>
                                <h2 id="chat-header-name" class="font-bold text-gray-800"></h2>
                                <p id="chat-header-status" class="text-xs text-green-500 font-medium">Online</p>
                            </div>
                        </div>
                        <div class="flex items-center gap-4 text-indigo-600">
                            <div class="cursor-pointer hover:text-indigo-800" id="icon-search-header"></div>
                        </div>
                    </header>

                    <!-- Messages Area -->
                    <div id="messages-area" class="flex-1 overflow-y-auto p-6 space-y-6"
                        style="background-image: radial-gradient(#cbd5e1 1px, transparent 1px); background-size: 20px 20px;">
                    </div>

                    <!-- Attachment Preview -->
                    <div id="attachment-preview"
                        class="absolute inset-0 bg-black/50 backdrop-blur-sm z-50 flex flex-col justify-end hidden">
                        <div class="bg-white rounded-t-2xl p-4 shadow-2xl animate-slide-up">
                            <div class="flex justify-between items-center mb-4">
                                <h3 class="font-bold text-gray-800">Preview Attachment</h3>
                                <button onclick="app.clearAttachment()" class="p-1 hover:bg-gray-100 rounded-full"
                                    id="icon-close-preview"></button>
                            </div>
                            <div class="flex flex-col items-center gap-4">
                                <div id="preview-content" class="w-full flex justify-center"></div>
                                <div class="w-full relative">
                                    <input id="caption-input" type="text" placeholder="Add a caption..."
                                        class="w-full bg-gray-50 border border-gray-200 rounded-full px-4 py-3 focus:ring-2 focus:ring-indigo-500 outline-none">
                                    <button onclick="app.sendMessage()"
                                        class="absolute right-2 top-2 p-2 bg-indigo-600 text-white rounded-full hover:bg-indigo-700 transition-colors"
                                        id="icon-send-preview"></button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Input Area -->
                    <div id="input-area" class="bg-white p-4 border-t border-gray-100 flex items-center gap-3">
                        <div class="flex gap-2 text-gray-400">
                            <button
                                class="p-2 hover:bg-gray-100 rounded-full transition-colors relative overflow-hidden"
                                id="btn-attach">
                                <input type="file" id="file-input" class="absolute inset-0 opacity-0 cursor-pointer"
                                    onchange="app.handleFileUpload(this)">
                            </button>
                            <button class="p-2 hover:bg-gray-100 rounded-full transition-colors hidden md:block"
                                id="btn-emoji"></button>
                        </div>
                        <div id="recorder-overlay"
                            class="hidden flex items-center gap-3 bg-gray-100 p-2 rounded-lg w-full">
                            <div class="animate-pulse flex items-center gap-2 text-red-500">
                                <span class="w-3 h-3 bg-red-500 rounded-full"></span>
                                <span id="recording-timer" class="text-sm font-mono">00:00</span>
                            </div>
                            <div class="flex-1 text-xs text-gray-500 font-medium uppercase tracking-wider">Recording...
                            </div>

                            <button onclick="app.pauseRecording()" id="pause-record-btn"
                                class="p-2 hover:bg-gray-200 rounded-full">⏸</button>
                            <button onclick="app.resumeRecording()" id="resume-record-btn"
                                class="hidden p-2 hover:bg-gray-200 rounded-full text-green-600">▶</button>
                            <button onclick="app.stopRecording()"
                                class="p-2 bg-red-500 text-white rounded-full">✔</button>
                            <button onclick="app.cancelRecording()" class="p-2 text-gray-400">✖</button>
                        </div>
                        <div id="reply-preview-bar" class="hidden flex-1 flex"></div>
                        <div id="input-container" class="flex-1 flex">
                            <input id="message-input" type="text" placeholder="Type a message..."
                                class="flex-1 bg-gray-50 text-gray-800 rounded-full px-5 py-3 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:bg-white transition-all border border-transparent focus:border-indigo-100"
                                onkeydown="if(event.key === 'Enter') app.sendMessage()">
                        </div>
                        <div id="action-icon">
                            <button id="action-btn" onclick="app.handleActionBtn()"
                                class="p-3 bg-gray-100 text-gray-600 rounded-full hover:bg-gray-200 transition-colors shadow-sm transform hover:scale-105 active:scale-95"></button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Settings Dashboard -->
            <div id="view-settings" class="flex-1 bg-gray-50 p-8 overflow-y-auto hidden">
                <div class="max-w-4xl mx-auto">
                    <header class="mb-8">
                        <h1 class="text-3xl font-bold text-gray-900 flex items-center gap-3">
                            <span id="icon-dashboard-title"></span>
                            Chatify Pro Dashboard
                        </h1>
                        <p class="text-gray-500 mt-2">Manage your chat package configuration.</p>
                    </header>
                    <div class="bg-white rounded-xl shadow-sm border border-gray-100 p-6 mb-6">
                        <h2 class="text-xl font-bold text-gray-800 mb-4">Pusher Configuration</h2>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-1">App ID</label>
                                <input type="text" id="pusher-app-id" placeholder="123456"
                                    class="w-full border-gray-300 rounded-lg p-2.5 bg-gray-50 border focus:ring-2 focus:ring-indigo-500 outline-none">
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-1">App Key</label>
                                <input type="text" id="pusher-key" placeholder="key_..."
                                    class="w-full border-gray-300 rounded-lg p-2.5 bg-gray-50 border focus:ring-2 focus:ring-indigo-500 outline-none">
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-1">App Secret</label>
                                <input type="password" id="pusher-secret" placeholder="secret_..."
                                    class="w-full border-gray-300 rounded-lg p-2.5 bg-gray-50 border focus:ring-2 focus:ring-indigo-500 outline-none">
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-1">Cluster</label>
                                <input type="text" id="pusher-cluster" placeholder="mt1"
                                    class="w-full border-gray-300 rounded-lg p-2.5 bg-gray-50 border focus:ring-2 focus:ring-indigo-500 outline-none">
                            </div>
                        </div>
                        <div class="mt-4 flex justify-end">
                            <button onclick="app.saveSettings()"
                                class="bg-indigo-600 text-white px-6 py-2 rounded-lg font-medium hover:bg-indigo-700 transition-colors">Save
                                Changes</button>
                        </div>
                    </div>

                    <div class="bg-white rounded-xl shadow-sm border border-gray-100 p-6">
                        <div class="flex items-center justify-between py-4 border-b border-gray-100">
                            <span class="text-gray-700 font-medium">Enable Chat System</span>
                            <div class="w-12 h-6 rounded-full bg-indigo-600 p-1 relative">
                                <div class="w-4 h-4 bg-white rounded-full absolute right-1"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <!-- Compose Modal -->
    <div id="compose-modal"
        class="fixed inset-0 bg-black/50 backdrop-blur-sm z-50 hidden flex items-center justify-center">
        <div class="bg-white w-full max-w-md rounded-2xl shadow-2xl overflow-hidden animate-slide-up m-4">
            <div class="p-4 border-b border-gray-100 flex items-center justify-between">
                <h3 class="font-bold text-lg text-gray-800">New Message</h3>
                <button onclick="app.closeCompose()" class="p-2 hover:bg-gray-100 rounded-full text-gray-500"
                    id="icon-close-modal"></button>
            </div>
            <div class="p-4">
                <div class="relative mb-4">
                    <input type="text" id="user-search-input" placeholder="Search people..."
                        class="w-full pl-10 pr-4 py-3 bg-gray-50 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-indigo-500">
                    <div class="absolute left-3 top-3.5 w-4 h-4 text-gray-400" id="icon-search-modal"></div>
                </div>
                <div id="search-results" class="max-h-80 overflow-y-auto space-y-2">
                    <p class="text-center text-gray-400 py-8 text-sm">Type to search for users</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Application Logic -->


    <script src="https://cdn.tailwindcss.com"></script>

    <script src="https://js.pusher.com/8.2.0/pusher.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/laravel-echo/1.15.3/echo.iife.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.6.2/axios.min.js"></script>

    <script>
        // Setup Axios CSRF
        axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';
        const csrfTokenMeta = document.querySelector('meta[name="csrf-token"]');
        if (csrfTokenMeta) {
            axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfTokenMeta.getAttribute('content');
        }

        const USER_ID = document.querySelector('meta[name="user-id"]').getAttribute('content');
        const API_BASE = '/{{ config('chatify.api_prefix') }}';
        let searchTimeout = null;
        let startTime;
        let timerInterval;
        // Add common emojis to the config
        const REACTION_EMOJIS = ['👍', '❤️', '😂', '😮', '😢', '🙏'];
        // Icons
        const Icons = {
            singleTick: `<svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>`,
            doubleTick: `<svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M7 12l5 5L22 7M2 12l5 5L12 10"></path></svg>`,
            check: '<svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>',
            plus: '<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg>',
            mic: '<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M12 1a3 3 0 0 0-3 3v8a3 3 0 0 0 6 0V4a3 3 0 0 0-3-3z"></path><path d="M19 10v2a7 7 0 0 1-14 0v-2"></path><line x1="12" y1="19" x2="12" y2="23"></line><line x1="8" y1="23" x2="16" y2="23"></line></svg>',
            send: '<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><line x1="22" y1="2" x2="11" y2="13"></line><polygon points="22 2 15 22 11 13 2 9 22 2"></polygon></svg>',
            smile: '<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><circle cx="12" cy="12" r="10"></circle><path d="M8 14s1.5 2 4 2 4-2 4-2"></path><line x1="9" y1="9" x2="9.01" y2="9"></line><line x1="15" y1="9" x2="15.01" y2="9"></line></svg>',
            search: '<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>',
            settings: '<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><circle cx="12" cy="12" r="3"></circle><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path></svg>',
            file: '<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M13 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"></path><polyline points="13 2 13 9 20 9"></polyline></svg>',
            dashboard: '<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><rect x="3" y="3" width="7" height="7"></rect><rect x="14" y="3" width="7" height="7"></rect><rect x="14" y="14" width="7" height="7"></rect><rect x="3" y="14" width="7" height="7"></rect></svg>',
            close: '<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>'
        };

        const state = {
            conversations: [],
            activeConversationId: null,
            messages: {},
            input: '',
            attachment: null,
            isRecording: false
        };



        const app = {
             setReply(msgId) {
                const msg = state.messages[state.activeConversationId].find(m => m.id == msgId);
                if (!msg) return;

                state.replyingTo = msg;

                const replyBar = document.getElementById('reply-preview-bar');
                replyBar.innerHTML = `
            <div class="flex items-center justify-between bg-gray-50 p-3 border-t border-indigo-200 animate-slide-up">
                <div class="border-l-4 border-indigo-500 pl-3 overflow-hidden">
                    <p class="text-xs font-bold text-indigo-600">Replying to</p>
                    <p class="text-sm text-gray-500 truncate">${msg.content || 'Attachment'}</p>
                </div>
                <button onclick="app.cancelReply()" class="text-gray-400 hover:text-red-500">
                    ${Icons.close}
                </button>
            </div> `;
                replyBar.classList.remove('hidden');
                document.getElementById('message-input').focus();
            },

            cancelReply() {
                state.replyingTo = null;
                const replyBar = document.getElementById('reply-preview-bar');
                replyBar.classList.add('hidden');
                replyBar.innerHTML = '';
            },
            async init() {
                this.renderIcons();
                this.initPusher();

                app.showSidebar = () => {
                    document.getElementById('chat-pane').classList.add('translate-x-full');
                    document.getElementById('sidebar').classList.remove('hidden');
                };


                app.openChat = (userId) => {
                    // 1. Existing logic to fetch messages...

                    // 2. Mobile UI Toggle: Slide in the chat pane
                    const chatPane = document.getElementById('chat-pane');
                    chatPane.classList.remove('translate-x-full');

                    // On small screens, we can hide the sidebar to save memory/rendering
                    if (window.innerWidth < 768) {
                        document.getElementById('sidebar').classList.add('hidden');
                    }
                    this.markAsSeen(state.activeConversationId);
                };
                app.startGlobalSync = () => {
                    // Prevent multiple intervals from running
                    if (state.syncInterval) clearInterval(state.syncInterval);

                    state.syncInterval = setInterval(async () => {
                        try {
                            // 1. Fetch latest state from server
                            const res = await axios.get(`${API_BASE}/sync-all`);
                            const {
                                conversations,
                                newMessages
                            } = res.data;

                            // 2. Update Sidebar (Always keep list fresh)
                            state.conversations = conversations;
                            this.renderSidebar();

                            // 3. If a chat is open, check for new messages belonging to it
                            if (state.activeConversationId && newMessages.length > 0) {
                                newMessages.forEach(msg => {
                                    // Only append if it's for the current chat and not already there
                                    const exists = document.getElementById(`msg-${msg.id}`);
                                    if (msg.conversation_id == state.activeConversationId &&
                                        !exists) {
                                        this.appendMessage(msg);

                                        // Mark as read immediately since chat is open
                                        axios.post(`${API_BASE}/messages/${msg.id}/read`);
                                    }
                                });
                            }
                        } catch (e) {
                            console.error("Sync failed", e);
                        }
                    }, 3000); // Polls every 3 seconds
                };

                app.initAudioMetadata = (playerId, audio) => {
                    const container = document.getElementById(playerId);

                    // Safety Check: If container doesn't exist, stop here
                    if (!container) {
                        console.warn(`Container ${playerId} not found yet.`);
                        return;
                    }

                    const durationSpan = container.querySelector('.duration-time');

                    // Safety Check: If the span doesn't exist inside the container
                    if (!durationSpan) {
                        console.warn("Could not find .duration-time span inside container.");
                        return;
                    }

                    if (audio.duration && isFinite(audio.duration)) {
                        const mins = Math.floor(audio.duration / 60);
                        const secs = Math.floor(audio.duration % 60).toString().padStart(2, '0');
                        durationSpan.innerText = `${mins}:${secs}`;
                    }
                };
                app.renderAudioPlayer = (url) => {
                    console.log(url);
                    const uniqueId = 'player-' + Date.now();
                    return `
                        <div class="voice-note-container voice-player flex items-center gap-3 p-2 bg-indigo-50 rounded-xl min-w-[200px]" id="${uniqueId}">
                            <button onclick="app.togglePlay('${uniqueId}')" class="play-btn w-10 h-10 flex items-center justify-center bg-indigo-600 text-white rounded-full">
                                ▶
                            </button>
                            <div class="flex-1">
                                <div class="h-1.5 w-full bg-indigo-200 rounded-full overflow-hidden">
                                    <div class="progress-bar h-full bg-indigo-600 w-0" style="width: 0%"></div>
                                   
                                </div>
                            </div>
                             <span class="current-time">0:00</span>
                            <span class="duration-time">--:--</span> 
                            <audio src="${url}" onloadedmetadata="app.initAudioMetadata('${uniqueId}', this)" 
                                ontimeupdate="app.updateProgress('${uniqueId}', this)">
                            </audio> 
                        </div>
                    `;
                };

                app.togglePlay = (containerId) => {
                    const container = document.getElementById(containerId);
                    const audio = container.querySelector('audio');
                    const btn = container.querySelector('.play-btn');

                    if (audio.paused) {
                        audio.play();
                        btn.innerText = '⏸';
                    } else {
                        audio.pause();
                        btn.innerText = '▶';
                    }
                };

                app.updateProgress = (containerId, audio) => {
                    const container = document.getElementById(containerId);
                    if (!container) return;

                    const progressBar = container.querySelector('.progress-bar');
                    const currentTimeSpan = container.querySelector('.current-time');

                    if (progressBar && audio.duration) {
                        const progress = (audio.currentTime / audio.duration) * 100;
                        progressBar.style.width = progress + '%';
                    }

                    if (currentTimeSpan) {
                        const mins = Math.floor(audio.currentTime / 60);
                        const secs = Math.floor(audio.currentTime % 60).toString().padStart(2, '0');
                        currentTimeSpan.innerText = `${mins}:${secs}`;
                    }
                };

                app.startTimer = () => {
                    const timerElement = document.getElementById('recording-timer');
                    startTime = Date.now();

                    // Clear any old intervals first to prevent "speeding up"
                    clearInterval(timerInterval);

                    timerInterval = setInterval(() => {
                        const elapsedTime = Date.now() - startTime;

                        // Convert milliseconds to MM:SS
                        const seconds = Math.floor((elapsedTime / 1000) % 60);
                        const minutes = Math.floor((elapsedTime / 1000 / 60) % 60);

                        const formattedTime =
                            `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;

                        if (timerElement) {
                            timerElement.innerText = formattedTime;
                        }
                    }, 1000);
                };
                app.cancelRecording = () => {
                    // 1. Stop the recorder if it's active
                    if (mediaRecorder && mediaRecorder.state !== "inactive") {
                        // Prevent the 'onstop' event from trying to send the audio
                        mediaRecorder.onstop = null;
                        mediaRecorder.stop();
                    }

                    // 2. Stop the microphone hardware to turn off the "red dot" in the browser
                    if (mediaRecorder && mediaRecorder.stream) {
                        mediaRecorder.stream.getTracks().forEach(track => track.stop());
                    }

                    // 3. Clear the collected audio data
                    audioChunks = [];

                    // 4. Clear the timer interval
                    if (typeof timerInterval !== 'undefined') {
                        clearInterval(timerInterval);
                    }

                    // 5. Reset the UI (Hide recorder overlay, show input field)
                    app.uiToggleRecording(false);

                    console.log("Recording cancelled and hardware released.");
                };

                app.startReactionSync = () => {
                    if (state.reactionInterval) clearInterval(state.reactionInterval);

                    state.reactionInterval = setInterval(async () => {
                        if (!state.activeConversationId) return;

                        try {
                            const res = await axios.get(
                                `${API_BASE}/conversations/${state.activeConversationId}/sync-reactions`
                            );

                            // Loop through the reactions from the server
                            res.data.forEach(react => {
                                app.renderReactionUI(react.message_id, react.reaction);
                            });
                        } catch (e) {
                            console.error("Reaction sync failed", e);
                        }
                    }, 3000); // Check every 3 seconds
                };


                app.renderReactionUI = (messageId, reactionEmoji) => {
                    const msgElement = document.getElementById(`msg-${messageId}`);
                    if (!msgElement) return;

                    // Check for the reaction badge
                    let reactionContainer = msgElement.querySelector('.reactions-container');

                    if (!reactionContainer) {
                        reactionContainer = document.createElement('div');
                        reactionContainer.className =
                            'reactions-container absolute -bottom-2 right-2 bg-white shadow-sm rounded-full px-1 text-[14px] border z-10';

                        // Find the actual bubble (the colored part)
                        // If you don't have .bubble-container, try finding the div that holds the text
                        const bubble = msgElement.querySelector('.bubble-content') || msgElement.querySelector(
                            'div:first-child');

                        if (bubble) {
                            // Ensure the bubble has relative positioning so the badge aligns correctly
                            bubble.classList.add('relative');
                            bubble.appendChild(reactionContainer);
                        } else {
                            // Fallback: append to the main message element
                            msgElement.classList.add('relative');
                            msgElement.appendChild(reactionContainer);
                        }
                    }

                    reactionContainer.innerText = reactionEmoji;

                    // If the emoji is empty or null, remove the badge (for un-reacting)
                    if (!reactionEmoji) {
                        reactionContainer.remove();
                    }
                };

                app.markAsSeen = (conversationId) => {
                    // 1. Find all messages from the OTHER person that are not 'seen' yet
                    const messages = document.querySelectorAll('.message-bubble[data-seen="false"]');

                    if (messages.length === 0) return;

                    // 2. Send the IDs to the backend
                    axios.post(`${API_BASE}/conversations/${conversationId}/read`)
                        .then(res => {
                            // Update UI: Turn local ticks blue or update state
                            console.log("Messages marked as seen");
                        })
                        .catch(err => console.error("Seen update failed", err));
                };


                app.pauseRecording = () => {
                    mediaRecorder.pause();
                    document.getElementById('pause-record-btn').classList.add('hidden');
                    document.getElementById('resume-record-btn').classList.remove('hidden');
                };

                app.resumeRecording = () => {
                    mediaRecorder.resume();
                    document.getElementById('resume-record-btn').classList.add('hidden');
                    document.getElementById('pause-record-btn').classList.remove('hidden');
                };

                app.stopRecording = () => {
                    mediaRecorder.stop();
                    app.uiToggleRecording(false);
                    document.getElementById('recorder-overlay').classList.add('hidden');
                    document.getElementById('message-input').classList.remove('hidden');
                    document.getElementById('action-btn').classList.remove('hidden');
                };

                app.uiToggleRecording = (isRecording) => {
                    const recorderOverlay = document.getElementById('recorder-overlay');
                    const messageInput = document.getElementById('message-input');
                    const actionBtn = document.getElementById('action-btn');
                    const micBtn = document.getElementById('mic-btn'); // If you have a separate mic button

                    if (isRecording) {
                        // Show Recorder, Hide Input
                        recorderOverlay.classList.remove('hidden');
                        messageInput.classList.add('hidden');
                        if (actionBtn) actionBtn.classList.add('hidden');
                        if (micBtn) micBtn.classList.add('hidden');
                    } else {
                        // Show Input, Hide Recorder
                        recorderOverlay.classList.add('hidden');
                        messageInput.classList.remove('hidden');
                        if (actionBtn) actionBtn.classList.remove('hidden');
                        if (micBtn) micBtn.classList.remove('hidden');

                        // Reset timer text
                        const timer = document.getElementById('recording-timer');
                        if (timer) timer.innerText = '00:00';
                    }
                };

                app.sendVoiceMessage = async (blob) => {
                    const file = new File([blob], "voice_msg.ogg", {
                        type: 'audio/ogg'
                    });
                    const formData = new FormData();

                    formData.append('file', file);
                    formData.append('type', 'VOICE');
                    formData.append('content', ''); // Audio usually has no text content

                    try {
                        const res = await axios.post(
                            `${API_BASE}/conversations/${state.activeConversationId}/messages`, formData
                        );
                        app.appendMessage(res.data);
                    } catch (e) {
                        console.error("Voice upload failed", e);
                    }
                };

                app.startRecording = async () => {
                    const stream = await navigator.mediaDevices.getUserMedia({
                        audio: true
                    });
                    mediaRecorder = new MediaRecorder(stream);
                    audioChunks = [];

                    mediaRecorder.ondataavailable = (e) => audioChunks.push(e.data);

                    mediaRecorder.onstop = () => {
                        const audioBlob = new Blob(audioChunks, {
                            type: 'audio/ogg; codecs=opus'
                        });
                        app.sendVoiceMessage(audioBlob);
                    };
                    app.startTimer();
                    mediaRecorder.start();
                    app.uiToggleRecording(true);
                };

                // Listener for the text field
                document.getElementById('message-input').addEventListener('input', function(e) {
                    const btn = document.getElementById('action-btn');
                    const iconSpan = document.getElementById('action-icon');

                    // if (e.target.value.trim().length > 0) {
                    //     // Switch to Send
                    //     iconSpan.innerHTML = Icons.send;
                    //     btn.classList.replace('text-gray-600',
                    //         'text-indigo-600'); // Change color to highlight send
                    //     state.isTyping = true;
                    // } else {
                    //     // Switch to Mic
                    //     iconSpan.innerHTML = Icons.mic;
                    //     btn.classList.replace('text-indigo-600', 'text-gray-600');
                    //     state.isTyping = false;
                    // }
                });

                app.handleActionBtn = () => {
                    const input = document.getElementById('message-input');
                    const text = input.value.trim();

                    if (text.length > 0) {
                        // 1. Logic for Sending Text
                        app.sendMessage();

                        // After sending, reset icon to Mic
                        document.getElementById('action-icon').innerHTML = Icons.mic;
                        document.getElementById('action-btn').classList.replace('text-indigo-600',
                            'text-gray-600');
                    } else {
                        // 2. Logic for Starting Voice Recording
                        app.startRecording();
                    }
                };

                // Initialize Laravel Echo safely
                const pusherKey = '{{ $pusherKey ?? '' }}';
                // if (pusherKey && pusherKey !== 'local') {
                //     window.Echo = new Echo({
                //         broadcaster: 'pusher',
                //         key: pusherKey,
                //         cluster: '{{ $pusherCluster ?? 'mt1' }}',
                //         wsHost: window.location.hostname,
                //         wsPort: 6001,
                //         forceTLS: false,
                //         disableStats: true,
                //         enabledTransports: ['ws', 'wss']
                //     });
                // }


                try {
                    const res = await axios.get(`${API_BASE}/conversations`);
                    state.conversations = res.data;
                    this.renderSidebar();
                } catch (e) {
                    console.warn("API failed. Switching to Mock Mode.", e.message);
                    this.useMockFallback();
                }

                document.getElementById('message-input').addEventListener('input', (e) => {
                    state.input = e.target.value;
                    this.updateActionBtn();
                });

                document.getElementById('user-search-input').addEventListener('input', (e) => {
                    clearTimeout(searchTimeout);
                    searchTimeout = setTimeout(() => this.searchUsers(e.target.value), 300);
                });
            },


            initPusher() {  
                const pusherKey = '{{ config('chatify.pusher.key') }}';
                const pusherCluster = '{{ config('chatify.pusher.options.cluster') }}';

                const pusher = new Pusher(pusherKey, {
                    cluster: pusherCluster,
                    forceTLS: true,
                    // CRITICAL: Private channels need authorization
                    authEndpoint: '/broadcasting/auth',
                    auth: {
                        headers: {
                            'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
                        }
                    }
                });

                // Subscribing to the private channel
                // const channel = pusher.subscribe(`private-chat.${USER_ID}`);
                const channel = pusher.subscribe(`private-chat.${USER_ID}`);
                // DEBUG: Check if connection is actually working
                channel.bind('pusher:subscription_succeeded', (data) => {
                    console.log('Successfully connected to private-chat.' + USER_ID); 
                });

                channel.bind('pusher:subscription_error', (status) => {
                    console.error('Pusher Auth Failed! Check your channels.php or credentials.', status);
                });

                channel.bind('message.sent', (data) => {
                    const msg = data.message;
                    console.log("New Message Received:", msg);
                    const convIndex = state.conversations.findIndex(c => c.id == msg.conversation_id);
                    if (convIndex !== -1) {
                        state.conversations[convIndex].lastMessage = msg;
                        // Optionally move this conversation to the top
                        const updatedConv = state.conversations.splice(convIndex, 1)[0];
                        state.conversations.unshift(updatedConv);
                    }

                    // Update sidebar to show newest message preview
                    this.renderSidebar();

                    

                    if (state.activeConversationId == msg.conversation_id) {
                        // Ensure state exists
                        if (!state.messages[msg.conversation_id]) {
                            state.messages[msg.conversation_id] = [];
                        }

                        // Prevent duplicate messages (if server sends back to sender)
                        const exists = state.messages[msg.conversation_id].find(m => m.id === msg.id);
                        if (!exists) {
                            state.messages[msg.conversation_id].push(msg);

                            // Immediately append to UI
                            this.appendMessage(msg);

                            // Auto-scroll to bottom
                            const area = document.getElementById('messages-area');
                            area.scrollTop = area.scrollHeight;
                        }

                        // Mark as read
                        axios.post(`${API_BASE}/messages/${msg.id}/read`);
                    }
                }); 
            },

            async selectChat(id) {
                state.activeConversationId = id;
                document.getElementById('view-chat').classList.remove('hidden');
                document.getElementById('empty-state').classList.add('hidden');
                document.getElementById('active-chat-container').classList.remove('hidden');

                const conv = state.conversations.find(c => c.id === id);
                if (conv) {
                    document.getElementById('chat-header-name').innerText = conv.name;
                    document.getElementById('chat-header-avatar').src = conv.avatar;
                }

                if (window.Echo && window.Echo.connector && window.Echo.connector.pusher && window.Echo.connector
                    .pusher.connection.state === 'connected') {
                    window.Echo.private(`chat.conversation.${id}`)
                        .listen('.message.sent', (e) => {
                            if (e.message.sender_id != USER_ID) {
                                this.appendMessage(e.message);
                            }
                        });
                }

                try {
                    const res = await axios.get(`${API_BASE}/conversations/${id}/messages`);
                    state.messages[id] = res.data;
                    this.renderChat();
                } catch (e) {
                    if (!state.messages[id]) state.messages[id] = [];
                    this.renderChat();
                }
            },

            renderSidebar() {
                const list = document.getElementById('conversation-list');
                list.innerHTML = '';
                state.conversations.forEach(conv => {
                    const isActive = conv.id === state.activeConversationId;
                    const el = document.createElement('div');
                    el.className =
                        `flex items-center gap-3 p-4 cursor-pointer transition-colors hover:bg-gray-50 ${isActive ? 'bg-indigo-50 border-r-4 border-indigo-600' : ''}`;
                    el.onclick = () => this.selectChat(conv.id);
                    el.innerHTML = `
                        <img src="${conv.avatar}" class="w-12 h-12 rounded-full object-cover">
                        <div class="flex-1 min-w-0">
                            <h3 class="font-semibold text-gray-900 truncate">${conv.name}</h3>
                            <p class="text-sm text-gray-500 truncate">${conv.lastMessage ? conv.lastMessage.content : 'No messages'}</p>
                        </div>
                        ${conv.unseenCount > 0 ? `<span class="bg-indigo-600 text-white text-xs px-2 py-0.5 rounded-full">${conv.unseenCount}</span>` : ''}
                    `;
                    list.appendChild(el);
                });
            },

            renderChat() {
                const msgs = state.messages[state.activeConversationId] || [];
                const area = document.getElementById('messages-area');
                area.innerHTML = '';
                msgs.forEach(msg => this.appendMessage(msg, false));
                area.scrollTop = area.scrollHeight;
            },



            appendMessage(msg, scroll = true) {
                // const area = document.getElementById('messages-area');
                const isMe = msg.sender_id == USER_ID;
                const area = document.getElementById('messages-area');
                const isAtBottom = area.scrollHeight - area.scrollTop <= area.clientHeight + 100;
                // Use the real ID if available, otherwise the temp ID
                const domId = `msg-${msg.id || 'temp-' + Date.now()}`;

                // 1. Status Ticks Logic (Inside the bubble)
                let statusHtml = '';
                if (isMe) {
                    const tickClass = "inline-block ml-1 align-middle";
                    if (msg.status == 2) {
                        statusHtml = `<span class="${tickClass} text-blue-300">${Icons.doubleTick}</span>`;
                    } else if (msg.status == 1) {
                        statusHtml = `<span class="${tickClass} text-gray-300">${Icons.doubleTick}</span>`;
                    } else {
                        statusHtml = `<span class="${tickClass} text-gray-300">${Icons.singleTick}</span>`;
                    }
                }

                // 2. Process Reactions
                const groupedReactions = {};
                const reactions = msg.reactions || [];
                reactions.forEach(r => {
                    if (!groupedReactions[r.emoji]) groupedReactions[r.emoji] = [];
                    groupedReactions[r.emoji].push(r.user_id);
                });

                let reactionsHtml = `<div class="flex flex-wrap gap-1 mt-1 ${isMe ? 'justify-end' : 'justify-start'}">`;
                for (const [emoji, userIds] of Object.entries(groupedReactions)) {
                    const iReacted = userIds.includes(parseInt(USER_ID));
                    reactionsHtml += `
            <button onclick="app.toggleReaction('${msg.id}', '${emoji}')" 
                class="text-xs px-1.5 py-0.5 rounded-full border transition-all ${iReacted ? 'bg-indigo-100 border-indigo-200' : 'bg-white border-gray-100'}">
                ${emoji} <span class="text-[10px] text-gray-500">${userIds.length}</span>
            </button>`;
                }
                reactionsHtml += '</div>';

                // 3. Handle Voice/Audio vs Text Content
                let bodyContent = '';
                if (msg.type === 'VOICE' || (msg.attachment && msg.attachment.type === 'audio')) {
                    // Construct the URL (handle both local blobs and storage paths)
                    console.log(msg.attachment);
                    const audioUrl = msg.attachment;
                    // console.log(msg.attachment);
                    bodyContent = this.renderAudioPlayer(audioUrl);
                } else {
                    bodyContent = `
            ${msg.attachment ? this.renderAttachment(msg.attachment) : ''}
            <p class="whitespace-pre-wrap leading-relaxed">${msg.content || ''}</p>
        `;
                }

                // 4. Build Quoted Reply UI
                let replyQuoteHtml = '';
                if (msg.parent) {
                    replyQuoteHtml = `
            <div class="mb-2 p-2 border-l-4 border-indigo-400 bg-black/5 rounded text-xs opacity-80 cursor-pointer hover:bg-black/10"
                 onclick="document.getElementById('msg-${msg.reply_to_id}')?.scrollIntoView({behavior:'smooth', block:'center'})">
                <p class="font-bold text-indigo-500">${msg.parent.sender_id == USER_ID ? 'You' : 'Participant'}</p>
                <p class="truncate">${msg.parent.content || (msg.parent.attachment ? 'Attachment' : '...')}</p>
            </div>`;
                }

                // 5. Hover Menu (Only if message is saved in DB)
                const pickerHtml = `
        <div class="reaction-menu absolute -top-12 ${isMe ? 'right-0' : 'left-0'} 
        bg-white shadow-lg rounded-full px-3 py-1 flex items-center gap-2 z-50 
        border border-gray-100 hidden group-hover:flex hover:flex animate-in fade-in slide-in-from-bottom-2">
        
        <div class="flex gap-1 border-r pr-2 border-gray-200">
            ${REACTION_EMOJIS.map(e => 
                `<button onclick="event.stopPropagation(); app.toggleReaction('${msg.id}', '${e}')" 
                                                 class="hover:scale-125 transition-transform p-1 text-lg">${e}</button>`
            ).join('')}
        </div>
        
        <button onclick="event.stopPropagation(); app.setReply('${msg.id}')" 
            class="p-1 text-gray-400 hover:text-indigo-600 transition-colors">
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <polyline points="9 17 4 12 9 7"></polyline>
                <path d="M20 18v-2a4 4 0 0 0-4-4H4"></path>
            </svg>
        </button>
        </div>`;

                // 6. Assembly
                const div = document.createElement('div');
                div.id = domId;
                div.className = `flex ${isMe ? 'justify-end' : 'justify-start'} group relative mb-6`;

                div.innerHTML = `
        <div class="relative max-w-[85%] md:max-w-[70%]">
            ${msg.id ? pickerHtml : ''}
            
            <div class="relative px-4 py-2 shadow-sm rounded-2xl text-sm transition-all ${isMe ? 'bg-indigo-600 text-white rounded-br-none' : 'bg-white text-gray-800 border border-gray-100 rounded-bl-none'}">
                ${replyQuoteHtml}
                ${bodyContent}
                
                <div class="flex items-center justify-end gap-1 mt-1 opacity-60 text-[10px]">
                    <span>${new Date(msg.created_at).toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' })}</span>
                    ${statusHtml}
                </div>
            </div>

            ${reactions.length > 0 ? reactionsHtml : ''}
        </div>`;
                area.appendChild(div);

                if (scroll && isAtBottom) {
                    area.scrollTop = area.scrollHeight;
                }
                area.appendChild(div);
                if (scroll) area.scrollTop = area.scrollHeight;
            },


            // --- NEW: Toggle Reaction Logic ---
            async toggleReaction(msgId, emoji) {
                if (!msgId) return; // Prevent reacting on optimistic temporary messages

                // 1. Optimistic UI Update (Optional, but makes it snappy)
                // For simplicity, we will wait for server response in this version to ensure data consistency
                // but in a Pro app, you'd update state.messages locally immediately.
                this.renderReactionUI(msgId, emoji);

                try {
                    // 2. Tell the database
                    await axios.post(`${API_BASE}/messages/${msgId}/react`, {
                        reaction: emoji
                    });
                } catch (e) {
                    console.error("Failed to save reaction");
                    // Optional: remove reaction if server fails
                }


                try {
                    const res = await axios.post(`${API_BASE}/messages/${msgId}/reaction`, {
                        emoji
                    });

                    // 2. Update Local State
                    const msgIndex = state.messages[state.activeConversationId].findIndex(m => m.id == msgId);
                    if (msgIndex > -1) {
                        // Update the message reactions in state
                        state.messages[state.activeConversationId][msgIndex].reactions = res.data.reactions;

                        // 3. Re-render just this message (or full chat for simplicity)
                        // Efficient approach: Find the DOM element and replace it
                        const domEl = document.getElementById(`msg-${msgId}`);
                        if (domEl) {
                            // We reconstruct the HTML for this specific message. 
                            // A cleaner way in vanilla JS is to just re-render the whole view or extract the HTML builder
                            this.renderChat();
                        }
                    }
                } catch (e) {
                    console.error("Reaction failed", e);
                }
            },

            renderAttachment(att) {
                if (att.type === 'image') return `<img src="${att.url}" class="max-h-60 rounded-lg mb-2">`;
                return `<div class="bg-black/10 p-2 rounded mb-2 flex items-center gap-2">${Icons.file} ${att.name}</div>`;
            },

            async sendMessage() {
                let text = state.input.trim();
                const fileInput = document.getElementById('file-input');
                const file = fileInput.files[0];

                if (!text && !file) return;

                const formData = new FormData();
                formData.append('content', text);

                if (state.replyingTo && state.replyingTo.id) {
                    formData.append('reply_to_id', state.replyingTo.id);
                }

                if (file) {
                    formData.append('file', file);
                    formData.append('type', file.type.includes('image') ? 'IMAGE' : 'FILE');
                } else {
                    formData.append('type', 'TEXT');
                }

                // --- Optimistic UI ---
                const tempId = 'temp-' + Date.now(); // Store this to reference later
                const tempMsg = {
                    id: tempId,
                    content: text,
                    sender_id: USER_ID,
                    reply_to_id: state.replyingTo ? state.replyingTo.id : null,
                    parent: state.replyingTo ? state.replyingTo : null,
                    created_at: new Date().toISOString(),
                    attachment: file ? {
                        type: file.type.includes('image') ? 'image' : 'file',
                        url: URL.createObjectURL(file),
                        name: file.name
                    } : null
                };

                this.appendMessage(tempMsg);

                // --- Clear UI State ---
                state.input = '';
                document.getElementById('message-input').value = '';
                fileInput.value = '';
                this.cancelReply();
                this.updateActionBtn();

                try {
                    const response = await axios.post(
                        `${API_BASE}/conversations/${state.activeConversationId}/messages`, formData);

                    // --- FIX: Replace Temp ID with Real ID ---
                    const realMsg = response.data; // The message object returned from Laravel

                    // 1. Update the DOM element ID so reactions/clicks work
                    const msgElement = document.getElementById(`msg-${tempId}`);
                    if (msgElement) {
                        msgElement.id = `msg-${realMsg.id}`;
                        msgElement.setAttribute('data-id', realMsg.id); // If you use data attributes

                        // 2. Update the reaction/reply buttons inside this bubble
                        // This replaces the "temp-xxx" string in any onclick functions with the real integer ID
                        const actionButtons = msgElement.querySelectorAll('[onclick]');
                        actionButtons.forEach(btn => {
                            const currentOnClick = btn.getAttribute('onclick');
                            if (currentOnClick) {
                                btn.setAttribute('onclick', currentOnClick.replace(tempId, realMsg.id));
                            }
                        });
                    }

                    // 3. Update the message in your local state array
                    const conversation = state.messages[state.activeConversationId];
                    const index = conversation.findIndex(m => m.id === tempId);
                    if (index !== -1) {
                        conversation[index] = realMsg;
                    }

                } catch (e) {
                    console.error("Failed to send message", e);
                    // UI Feedback: Mark the temp message as "failed"
                    const msgElement = document.getElementById(`msg-${tempId}`);
                    if (msgElement) msgElement.style.opacity = '0.5';
                }
            },

            toggleSettings() {
                const chat = document.getElementById('view-chat');
                const settings = document.getElementById('view-settings');
                const btn = document.getElementById('settings-btn');

                if (chat.classList.contains('hidden')) {
                    chat.classList.remove('hidden');
                    settings.classList.add('hidden');
                    btn.innerHTML = Icons.settings;
                } else {
                    chat.classList.add('hidden');
                    settings.classList.remove('hidden');
                    btn.innerHTML = Icons.dashboard;
                }
            },

            async saveSettings() {
                const data = {
                    key: document.getElementById('pusher-key').value,
                    app_id: document.getElementById('pusher-app-id').value,
                    secret: document.getElementById('pusher-secret').value,
                    cluster: document.getElementById('pusher-cluster').value,
                };
                try {
                    await axios.post(`${API_BASE}/settings`, data);
                    alert("Settings saved successfully.");
                } catch (e) {
                    alert("Failed to save settings.");
                }
            },

            renderIcons() {
                document.getElementById('icon-search').innerHTML = Icons.search;
                document.getElementById('icon-search-header').innerHTML = Icons.search;
                document.getElementById('settings-btn').innerHTML = Icons.settings;
                document.getElementById('btn-attach').insertAdjacentHTML('afterbegin', Icons.plus);
                document.getElementById('btn-emoji').innerHTML = Icons.smile;
                document.getElementById('action-btn').innerHTML = Icons.mic;
                document.getElementById('icon-close-preview').innerHTML = Icons.close;
                document.getElementById('icon-send-preview').innerHTML = Icons.send;
                document.getElementById('icon-dashboard-title').innerHTML = Icons.dashboard;
                document.getElementById('fab-compose').innerHTML = Icons.plus;
                document.getElementById('icon-close-modal').innerHTML = Icons.close;
                document.getElementById('icon-search-modal').innerHTML = Icons.search;
            },

            updateActionBtn() {
                const btn = document.getElementById('action-btn');
                const hasText = state.input.trim().length > 0;
                if (hasText) {
                    btn.innerHTML = Icons.send;
                    btn.classList.add('bg-indigo-600', 'text-white');
                } else {
                    btn.innerHTML = Icons.mic;
                    btn.classList.remove('bg-indigo-600', 'text-white');
                }
            },

            handleFileUpload(input) {
                if (input.files[0]) {
                    alert("File selected ready to send.");
                }
            },

            handleActionBtn() {
                if (state.input.trim().length > 0) this.sendMessage();
            },

            clearAttachment() {
                document.getElementById('file-input').value = '';
                document.getElementById('attachment-preview').classList.add('hidden');
            },

            openCompose() {
                document.getElementById('compose-modal').classList.remove('hidden');
                document.getElementById('user-search-input').focus();
            },

            closeCompose() {
                document.getElementById('compose-modal').classList.add('hidden');
                document.getElementById('user-search-input').value = '';
                document.getElementById('search-results').innerHTML =
                    '<p class="text-center text-gray-400 py-8 text-sm">Type to search for users</p>';
            },


            async searchUsers(query) {
                const container = document.getElementById('search-results');
                if (!query.trim()) {
                    container.innerHTML =
                        '<p class="text-center text-gray-400 py-8 text-sm">Type to search for users</p>';
                    return;
                }

                try {
                    const res = await axios.get(`${API_BASE}/users?q=${query}`);
                    if (res.data.length === 0) {
                        container.innerHTML =
                            '<p class="text-center text-gray-400 py-8 text-sm">No users found</p>';
                        return;
                    }
                    container.innerHTML = res.data.map(u => `
                        <div onclick="app.startConversation('${u.id}')" class="flex items-center gap-3 p-3 hover:bg-gray-50 rounded-lg cursor-pointer transition-colors">
                            <img src="${u.avatar}" class="w-10 h-10 rounded-full">
                            <div>
                                <h4 class="font-medium text-gray-800">${u.name}</h4>
                                <p class="text-xs text-gray-500">${u.email}</p>
                            </div>
                        </div>
                    `).join('');
                } catch (e) {
                    console.error(e);
                }
            },


            async startConversation(userId) {
                // console.log(userId);
                // return;
                try {
                    const res = await axios.post(`${API_BASE}/conversations`, {
                        user_id: userId
                    });
                    // Refresh conversations list to show new one
                    const listRes = await axios.get(`${API_BASE}/conversations`);
                    state.conversations = listRes.data;
                    this.renderSidebar();

                    this.closeCompose();
                    a
                    this.selectChat(res.data.id);
                } catch (e) {
                    console.log("Failed to start conversation: " + (e.response?.data?.message || "Check Console"));
                }
            },

            useMockFallback() {
                // Mock implementation logic...
                state.conversations = [{
                    id: '1',
                    name: 'Demo User',
                    avatar: 'https://ui-avatars.com/api/?name=Demo',
                    lastMessage: {
                        content: 'Hello'
                    },
                    unseenCount: 1,
                    type: 'private'
                }];
                this.renderSidebar();

                let mediaRecorder;
                let audioChunks = [];



                // app.renderAudioPlayer = (url) => {
                //     console.log(url);
                //     const uniqueId = 'player-' + Date.now();
                //     return `
            //         <div class="voice-player flex items-center gap-3 p-2 bg-indigo-50 rounded-xl min-w-[200px]" id="${uniqueId}">
            //             <button onclick="app.togglePlay('${uniqueId}')" class="play-btn w-10 h-10 flex items-center justify-center bg-indigo-600 text-white rounded-full">
            //                 ▶
            //             </button>
            //             <div class="flex-1">
            //                 <div class="h-1.5 w-full bg-indigo-200 rounded-full overflow-hidden">
            //                     <div class="progress-bar h-full bg-indigo-600 w-0"></div>
            //                 </div>
            //             </div>
            //             <audio src="${url}" ontimeupdate="app.updateProgress('${uniqueId}', this)"></audio>
            //         </div>
            //     `;
                // };

                app.togglePlay = (containerId) => {
                    const container = document.getElementById(containerId);
                    const audio = container.querySelector('audio');
                    const btn = container.querySelector('.play-btn');

                    if (audio.paused) {
                        audio.play();
                        btn.innerText = '⏸';
                    } else {
                        audio.pause();
                        btn.innerText = '▶';
                    }
                };

                app.updateProgress = (containerId, audio) => {
                    const progress = (audio.currentTime / audio.duration) * 100;
                    document.getElementById(containerId).querySelector('.progress-bar').style.width = progress +
                        '%';
                };

            }

        };

        window.onload = () => app.init();
        window.app = app;
    </script>
</body>
