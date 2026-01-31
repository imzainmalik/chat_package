export enum MessageStatus {
  SENT = 'SENT',
  DELIVERED = 'DELIVERED',
  READ = 'READ',
}

export enum MessageType {
  TEXT = 'TEXT',
  IMAGE = 'IMAGE',
  VOICE = 'VOICE',
  FILE = 'FILE',
}

export interface User {
  id: string;
  name: string;
  avatar: string;
  status: 'online' | 'offline' | 'busy';
  lastSeen?: Date;
}

export interface Reaction {
  emoji: string;
  userId: string;
}

export interface Attachment {
  type: 'image' | 'file' | 'audio';
  url: string;
  name?: string;
  size?: string;
  mimeType?: string;
}

export interface Message {
  id: string;
  conversationId: string;
  senderId: string;
  content: string; // Text content or caption
  type: MessageType;
  attachment?: Attachment;
  status: MessageStatus;
  reactions: Reaction[];
  createdAt: Date;
  replyToId?: string;
}

export interface Conversation {
  id: string;
  type: 'private' | 'group';
  name: string; // User name or Group name
  avatar: string;
  participants: string[]; // User IDs
  lastMessage?: Message;
  unseenCount: number;
  isPinned?: boolean;
}

export interface ChatState {
  currentUser: User;
  conversations: Conversation[];
  messages: Record<string, Message[]>; // Keyed by conversationId
  users: Record<string, User>;
  activeConversationId: string | null;
}