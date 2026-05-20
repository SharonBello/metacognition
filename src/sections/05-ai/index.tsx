// ═══════════════════════════════════════════════════════════════════
// Section 05 — AI כתשתית חשיבה (25 min)
// ═══════════════════════════════════════════════════════════════════
import React from 'react';
import SectionShell from '@/components/SectionShell/SectionShell';
import AIReframe from './AIReframe';
import PromptCardDeck from './PromptCardDeck';

const AISection: React.FC = () => (
  <SectionShell id="ai">
    <AIReframe />
    <PromptCardDeck />
  </SectionShell>
);

export default AISection;