import { ChatState, Message, MessageStatus, MessageType, User, Conversation } from '../types';

// Mock Users
export const MOCK_USERS: Record<string, User> = {
  'me': { id: 'me', name: 'John Doe', avatar: 'https://picsum.photos/seed/me/200/200', status: 'online' },
  'u1': { id: 'u1', name: 'Alice Smith', avatar: 'https://picsum.photos/seed/u1/200/200', status: 'online' },
  'u2': { id: 'u2', name: 'Bob Johnson', avatar: 'https://picsum.photos/seed/u2/200/200', status: 'offline', lastSeen: new Date() },
  'u3': { id: 'u3', name: 'Tech Team', avatar: 'https://picsum.photos/seed/u3/200/200', status: 'busy' }, // Group avatar logic
};

// Mock Initial State
export const INITIAL_STATE: ChatState = {
  currentUser: MOCK_USERS['me'],
  users: MOCK_USERS,
  activeConversationId: null,
  conversations: [
    {
      id: 'c1',
      type: 'private',
      name: 'Alice Smith',
      avatar: MOCK_USERS['u1'].avatar,
      participants: ['me', 'u1'],
      unseenCount: 2,
      lastMessage: {
        id: 'm_prev1',
        conversationId: 'c1',
        senderId: 'u1',
        content: 'Hey! Did you see the new Laravel package?',
        type: MessageType.TEXT,
        status: MessageStatus.DELIVERED,
        reactions: [],
        createdAt: new Date(Date.now() - 1000 * 60 * 5),
      }
    },
    {
      id: 'c2',
      type: 'private',
      name: 'Bob Johnson',
      avatar: MOCK_USERS['u2'].avatar,
      participants: ['me', 'u2'],
      unseenCount: 0,
      lastMessage: {
        id: 'm_prev2',
        conversationId: 'c2',
        senderId: 'me',
        content: 'Sure, I will send the docs later.',
        type: MessageType.TEXT,
        status: MessageStatus.READ,
        reactions: [{ emoji: '👍', userId: 'u2' }],
        createdAt: new Date(Date.now() - 1000 * 60 * 60 * 2),
      }
    },
    {
      id: 'c3',
      type: 'group',
      name: 'Tech Team Project',
      avatar: 'https://picsum.photos/seed/tech/200/200',
      participants: ['me', 'u1', 'u2', 'u3'],
      unseenCount: 5,
      lastMessage: {
        id: 'm_prev3',
        conversationId: 'c3',
        senderId: 'u2',
        content: 'Meeting starts in 10 mins.',
        type: MessageType.TEXT,
        status: MessageStatus.READ,
        reactions: [],
        createdAt: new Date(Date.now() - 1000 * 60 * 10),
      }
    }
  ],
  messages: {
    'c1': [
      {
        id: 'm1',
        conversationId: 'c1',
        senderId: 'u1',
        content: 'Hello John!',
        type: MessageType.TEXT,
        status: MessageStatus.READ,
        reactions: [],
        createdAt: new Date(Date.now() - 1000 * 60 * 60),
      },
      {
        id: 'm2',
        conversationId: 'c1',
        senderId: 'me',
        content: 'Hi Alice, how are you?',
        type: MessageType.TEXT,
        status: MessageStatus.READ,
        reactions: [],
        createdAt: new Date(Date.now() - 1000 * 60 * 55),
      },
      {
        id: 'm3',
        conversationId: 'c1',
        senderId: 'u1',
        content: 'I am doing great. Working on the new Chatify Pro integration.',
        type: MessageType.TEXT,
        status: MessageStatus.READ,
        reactions: [{ emoji: '🔥', userId: 'me' }],
        createdAt: new Date(Date.now() - 1000 * 60 * 50),
      },
       {
        id: 'm4',
        conversationId: 'c1',
        senderId: 'u1',
        content: 'Hey! Did you see the new Laravel package?',
        type: MessageType.TEXT,
        status: MessageStatus.DELIVERED,
        reactions: [],
        createdAt: new Date(Date.now() - 1000 * 60 * 5),
      }
    ],
    'c2': [],
    'c3': []
  }
};

export const generateId = () => Math.random().toString(36).substr(2, 9);
