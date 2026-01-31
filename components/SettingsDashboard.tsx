import React, { useState } from 'react';
import { DashboardIcon, SettingsIcon, CheckIcon } from './Icons';

export const SettingsDashboard: React.FC = () => {
  const [activeTab, setActiveTab] = useState('general');

  const SettingToggle = ({ label, enabled }: { label: string, enabled: boolean }) => (
    <div className="flex items-center justify-between py-4 border-b border-gray-100">
      <span className="text-gray-700 font-medium">{label}</span>
      <button className={`w-12 h-6 rounded-full p-1 transition-colors duration-200 ${enabled ? 'bg-indigo-600' : 'bg-gray-300'}`}>
        <div className={`w-4 h-4 bg-white rounded-full shadow-md transform transition-transform duration-200 ${enabled ? 'translate-x-6' : 'translate-x-0'}`} />
      </button>
    </div>
  );

  return (
    <div className="flex-1 bg-gray-50 p-8 overflow-y-auto">
      <div className="max-w-4xl mx-auto">
        <header className="mb-8">
          <h1 className="text-3xl font-bold text-gray-900 flex items-center gap-3">
            <DashboardIcon className="w-8 h-8 text-indigo-600" />
            Chatify Pro Dashboard
          </h1>
          <p className="text-gray-500 mt-2">Manage your chat package configuration and system status.</p>
        </header>

        <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
          {/* Settings Sidebar */}
          <div className="bg-white rounded-xl shadow-sm border border-gray-100 p-4 h-fit">
            <nav className="space-y-1">
              {['General', 'Broadcasting', 'Security', 'File Uploads', 'Appearance'].map((tab) => (
                <button
                  key={tab}
                  onClick={() => setActiveTab(tab.toLowerCase())}
                  className={`w-full text-left px-4 py-3 rounded-lg text-sm font-medium transition-colors ${
                    activeTab === tab.toLowerCase()
                      ? 'bg-indigo-50 text-indigo-700'
                      : 'text-gray-600 hover:bg-gray-50'
                  }`}
                >
                  {tab}
                </button>
              ))}
            </nav>
          </div>

          {/* Settings Content */}
          <div className="md:col-span-3 space-y-6">
            <div className="bg-white rounded-xl shadow-sm border border-gray-100 p-6">
              <h2 className="text-xl font-bold text-gray-800 mb-4 capitalize">{activeTab} Settings</h2>
              
              {activeTab === 'general' && (
                <div className="space-y-2">
                  <SettingToggle label="Enable Chat System" enabled={true} />
                  <SettingToggle label="Allow Guest Chat" enabled={false} />
                  <SettingToggle label="Show Online Status" enabled={true} />
                  <SettingToggle label="Enable Push Notifications" enabled={true} />
                </div>
              )}

              {activeTab === 'broadcasting' && (
                <div className="space-y-4">
                  <div className="grid grid-cols-2 gap-4">
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-1">Driver</label>
                      <select className="w-full border-gray-300 rounded-lg p-2.5 bg-gray-50 border focus:ring-2 focus:ring-indigo-500 outline-none">
                        <option>Pusher</option>
                        <option>Reverb (Laravel 11)</option>
                        <option>Ably</option>
                      </select>
                    </div>
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-1">Cluster</label>
                      <input type="text" value="mt1" className="w-full border-gray-300 rounded-lg p-2.5 bg-gray-50 border" readOnly />
                    </div>
                  </div>
                  <div className="p-4 bg-green-50 text-green-700 rounded-lg border border-green-200 flex items-center gap-2">
                    <CheckIcon className="w-5 h-5" />
                    System Connected via WebSocket
                  </div>
                </div>
              )}

              {activeTab === 'file uploads' && (
                <div className="space-y-4">
                  <SettingToggle label="Enable Attachments" enabled={true} />
                  <div className="pt-2">
                    <label className="block text-sm font-medium text-gray-700 mb-1">Max File Size (MB)</label>
                    <input type="number" defaultValue={10} className="w-24 border-gray-300 rounded-lg p-2 bg-gray-50 border" />
                  </div>
                  <div className="pt-2">
                    <label className="block text-sm font-medium text-gray-700 mb-1">Allowed Extensions</label>
                    <input type="text" defaultValue="jpg, png, pdf, docx, mp3, wav" className="w-full border-gray-300 rounded-lg p-2 bg-gray-50 border" />
                  </div>
                </div>
              )}
            </div>

            {/* Stats Cards */}
            <div className="grid grid-cols-3 gap-6">
               <div className="bg-gradient-to-br from-blue-500 to-indigo-600 p-6 rounded-xl text-white shadow-lg">
                  <div className="text-3xl font-bold mb-1">12,403</div>
                  <div className="text-blue-100 text-sm font-medium">Total Messages</div>
               </div>
               <div className="bg-gradient-to-br from-emerald-500 to-teal-600 p-6 rounded-xl text-white shadow-lg">
                  <div className="text-3xl font-bold mb-1">142</div>
                  <div className="text-emerald-100 text-sm font-medium">Active Groups</div>
               </div>
               <div className="bg-gradient-to-br from-orange-500 to-red-600 p-6 rounded-xl text-white shadow-lg">
                  <div className="text-3xl font-bold mb-1">1.2 GB</div>
                  <div className="text-orange-100 text-sm font-medium">Storage Used</div>
               </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
